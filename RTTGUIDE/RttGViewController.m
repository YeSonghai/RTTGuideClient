//
//  RttGViewController.m
//  RTTGUIDE
//
//  Created by Ye Sean on 12-5-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RttGViewController.h"
#import "ZMQObjC.h"
#import "Tss.pb.h"
#import "sys/socket.h"
#import "sys/types.h"
#import "RttGOprRcvTSS.h"


@interface RouteAnnotation : BMKPointAnnotation
{
	int _type; ///<0:起点 1：终点 2：公交 3：地铁 4:驾乘
	int _degree;
}

@property (nonatomic) int type;
@property (nonatomic) int degree;
@end

@implementation RouteAnnotation

@synthesize type = _type;
@synthesize degree = _degree;
@end


@interface CandidateSteps:NSObject
{
	int _index;
	CLLocationCoordinate2D _StPoint;
    CLLocationCoordinate2D _EdPoint;
}
@property (nonatomic) int index;
@property (nonatomic) CLLocationCoordinate2D StPoint;
@property (nonatomic) CLLocationCoordinate2D EdPoint;
@end

@implementation CandidateSteps
@synthesize index = _index;
@synthesize StPoint = _StPoint;
@synthesize EdPoint = _EdPoint;
@end

//判断pnt是否在由（p1, p2）两点组成的线段范围内
//方法：计算投影点，然后判断投影点是否在线段内；如果是，则返回距离，否则返回－1.0；
//Note: 允许投影点在线段两端的误差，目前本函数还没加入这个误差；
double GetNearLineDistance(BMKMapPoint pnt,  BMKMapPoint p1, BMKMapPoint p2)
{
    double a;    
    double b;    
    double c;    
    
//    CLLocationDistance dC = BMKMetersBetweenMapPoints(p1, p2);
//    CLLocationDistance dA = BMKMetersBetweenMapPoints(p1, pnt);
//    CLLocationDistance dB = BMKMetersBetweenMapPoints(p2, pnt);    
//    if ((dC < dA) || (dC < dB))
//    {
//        if (dA < dB)
//        {
//            return dA;
//        }
//        else 
//        {
//            return dB;
//        }
//    }
    
    if(p2.x >= p1.y)   
    {   
        a=p2.y-p1.y;
        b=p1.x-p2.x;
        c=p1.y*p2.x-p1.x*p2.y;    
    }
    else   
    {   
        a=p1.y-p2.y;    
        b=p2.x-p1.x;    
        c=p2.y*p1.x-p2.x*p1.y;    
    }
    
    double dSPtX = (b*b*pnt.x - a*(b*pnt.y + c))/(a*a + b*b);
    double dSPtY = (a*a*pnt.y - b*(a*pnt.x + c))/(a*a + b*b);
    
    //投影点是否在线段内；之所以这么写是为了避免复杂浮点运算；
    if (p1.x < p2.x)//横坐标判断
    {
        if ((dSPtX < p1.x) || (dSPtX > p2.x)) //不在线段内，还没加入误差
        {
            return -1.0;
        }
    }
    else 
    {
        if ((dSPtX > p1.x) || (dSPtX < p2.x)) //不在线段内，还没加入误差
        {
            return -1.0;
        }
    }
    
    if (p1.y < p2.y) //纵坐标判断
    {
        if ((dSPtY < p1.y) || (dSPtY > p2.y)) //不在线段内，还没加入误差
        {
            return -1.0;
        }
    }
    else 
    {
        if ((dSPtY > p1.y) || (dSPtY < p2.y)) //不在线段内，还没加入误差
        {
            return -1.0;
        }
    }
    
    double s = fabs(a*pnt.x+b*pnt.y+c)/sqrt(a*a+b*b);
    return s;
};


@interface RttGViewController ()
@property (nonatomic) CLLocationCoordinate2D lastUserLocation;
@property (nonatomic) CLLocationCoordinate2D lastOnPlanLocation;
//#ifdef DEBUG
//@property (nonatomic) CLLocationCoordinate2D* passCoordinate;
//@property (nonatomic) int passPCount;
//@property (nonatomic) BMKPolyline* prePolyLine;
//#endif

@end

@implementation RttGViewController

@synthesize lastUserLocation = _lastUserLocation;
@synthesize lastOnPlanLocation = _lastOnPlanLocation;
//#ifdef DEBUG
//@synthesize passCoordinate = _passCoordinate;
//@synthesize passPCount = _passPCount;
//@synthesize prePolyLine = _prePolyLine;
//#endif

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    DrivingRoute = [[BMKRoute alloc] init];//
    DrivingRoute.steps = nil;
    DrivingRoute.tip = nil;
    
    
    zmqTSSContext = [[ZMQContext alloc] initWithIOThreads:1U];
    static NSString *const kEndpoint = @"tcp://172.16.0.106:6001";
    NSLog(@"*** Start to connect to endpoint [%@].", kEndpoint);    
    zmqTSSSocket = [zmqTSSContext socketWithType:ZMQ_DEALER];
    BOOL didBind = [zmqTSSSocket connectToEndpoint:kEndpoint];
    if (!didBind) 
    {
        NSLog(@"*** Failed to connect to endpoint [%@].", kEndpoint);
        //return EXIT_FAILURE;
        return;
    }
    else 
    {
        NSLog(@"*** Successed to connected to endpoint [%@].", kEndpoint);
    }
    
    RttGOprRcvTSS *pRcvThread = [[RttGOprRcvTSS alloc] initWithZMQ:zmqTSSContext andSocket:zmqTSSSocket];
    rttThreadQue = [[NSOperationQueue alloc] init];
    [rttThreadQue addOperation:pRcvThread];
    
    
    //int socketpair[2];
    //int itt = socketpair(AF_LOCAL, SOCK_STREAM, 0, socketpair);
    

    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)]; 
    
    CLLocationCoordinate2D centerlocation = CLLocationCoordinate2DMake(22.546154, 114.06859);
    [_mapView setCenterCoordinate:(centerlocation)];

    _mapView.delegate = self;
    self.view = _mapView;
    //mapView.delegate = self;

    
    //增加显示路名的信息条
    [self.view addSubview:uilRoadName];
    
    //百度地图API，允许获取和显示用户当前位置
    [_mapView setShowsUserLocation:YES];
    
    // 地图比例尺级别，在手机上当前可使用的级别为3-18级
    [_mapView setZoomLevel:12];
    
    
    
#ifdef DEBUG
    NSLog(@"RoutPlaning.....");
    
	_search = [[BMKSearch alloc]init];
	_search.delegate = self;
	BMKPlanNode* start = [[BMKPlanNode alloc]init];
	//start.name = @"市民中心";
    //start.pt = CLLocationCoordinate2DMake(22.546154, 114.06859);
    //start.name = @"机场";
    //start.pt = CLLocationCoordinate2DMake(22.651957, 113.832946);
    start.pt = CLLocationCoordinate2DMake(22.552171, 114.019111);


	BMKPlanNode* end = [[BMKPlanNode alloc]init];
	//end.name = @"山姆会员店";
    //end.pt = CLLocationCoordinate2DMake(22.552171, 114.019111);
    end.name = @"蛇口码头";

    //end.name = @"滨海白石立交桥";
    //end.pt = CLLocationCoordinate2DMake(22.552087, 114.019416);


	bool isSuccPlanCall = [_search drivingSearch:@"深圳" startNode:start endCity:@"深圳" endNode:end];
    
    if (!isSuccPlanCall)
    {
        NSLog(@"Call driving search failure");
    }

    //[start release];
	//[end release];
    
//    self.passCoordinate = new CLLocationCoordinate2D[10240];
//    self.passPCount = 0;
//    self.prePolyLine = NULL;
    self->uilRoadName.text = @"路云信息科技";
    NSLog(@"End of RoutPlaning.....");

#endif
    
}

- (void)viewDidUnload
{
    uilRoadName = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)onGetAddrResult:(BMKAddrInfo*)result errorCode:(int)error
{
	if (error != BMKErrorOk) 
    {
    	NSLog(@"onGetDrivingRouteResult:error:%d", error);
        self->uilRoadName.text = @"路径规划错误";
        return;
    }
    
    if (result.addressComponent.streetName != nil)
    {
        self->uilRoadName.text = result.addressComponent.streetName;
    }
    else {
        self->uilRoadName.text = @"未知路名";
    }
    
    //NSLog(@"ROOOODDNMAE=%@, %@, %@", uilRoadName.text, result.addressComponent.city, result.addressComponent.description);
    
}

- (void)onGetDrivingRouteResult:(BMKPlanResult*)result errorCode:(int)error
{
	NSLog(@"onGetDrivingRouteResult:error:%d", error);
	if (error == BMKErrorOk) 
    {
		BMKRoutePlan* plan = (BMKRoutePlan*)[result.plans objectAtIndex:0];
		
		//BMKErrorCode 
		RouteAnnotation* item = [[RouteAnnotation alloc]init];
		item.coordinate = result.startNode.pt;
		item.title = @"起点";
		item.type = 0;
		[_mapView addAnnotation:item];
		//[item release];
		
		int index = 0;
		int size = [plan.routes count];
		for (int i = 0; i < 1; i++) 
        {
			BMKRoute* route = [plan.routes objectAtIndex:i];
			for (int j = 0; j < route.pointsCount; j++) 
            {
				int len = [route getPointsNum:j];
				index += len;
			}
            
            DrivingRoute = [plan.routes objectAtIndex:i];
            //YSH_CODE [DrivingRoute retain];
		}
        
        //Test
        NSLog(@"Points Cnt in Steps: %d", index);
 		BMKMapPoint* points = new BMKMapPoint[index];
		index = 0;
        
        for (int j = 0; j < DrivingRoute.pointsCount; j++) 
        {
            int len = [DrivingRoute getPointsNum:j];
            BMKMapPoint* pointArray = (BMKMapPoint*)[DrivingRoute getPoints:j];
            memcpy(points + index, pointArray, len * sizeof(BMKMapPoint));
            index += len;
        }
        
        size = DrivingRoute.steps.count;
        int iCCnt = 0;
        for (int j = 0; j < size; j++) 
        {
            BMKStep* step = [DrivingRoute.steps objectAtIndex:j];
            item = [[RouteAnnotation alloc]init];
            item.coordinate = step.pt;
            item.title = step.content;
            item.degree = step.degree * 30;
            item.type = 4;
            //[mapView addAnnotation:item];
            
            //[item release];
            
            //str1 = item.title;
            //memcpy((void*)strp2, (const void*) str1.UTF8String, str1.length);
            //StringPtr str1 = NULL;
            //NSString str2;
            //str2.UTF8String
            //NSLog(@"%@", item.title);
            int iPointCnt =  [DrivingRoute getPointsNum:j];
            iCCnt += iPointCnt;
            //Test--TrunOff
            //NSLog(@"\r\nStep%d, %@", j,item.title);
            //NSLog(@"KEYPoin: X:%f, Y:%f", item.coordinate.latitude, item.coordinate.longitude);
            
            //backup
            //BMKMapPoint keyPoint = BMKMapPointForCoordinate(item.coordinate);
            //NSLog(@"KEYPoin: X:%f, Y:%f", keyPoint.x, keyPoint.y);
            for (int k = 0; k < iPointCnt; k++)
            {
                //NSLog(@"Point%d: X:%f, Y:%f", k, ([DrivingRoute getPoints:j]+k)->x, ([DrivingRoute getPoints:j]+k)->y);
            }

        }
        
        //NSLog(@"Points Cnt in Steps: %d", iCCnt);

        //End Test
        
        		
        //Test
		item = [[RouteAnnotation alloc]init];
		item.coordinate = result.endNode.pt;
		item.type = 1;
		item.title = @"终点";
		[_mapView addAnnotation:item];
        //End-Test
        
		item = [[RouteAnnotation alloc]init];
		item.coordinate = result.endNode.pt;
		item.type = 1;
		item.title = @"终点";
		[_mapView addAnnotation:item];
		//[item release];
		BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:points count:index];
		[_mapView addOverlay:polyLine];
		delete []points;
	}
    
}

//- (BMKAnnotationView *)mapView:(BMKMapView *)bmkmapview viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//	if ([annotation isKindOfClass:[RouteAnnotation class]]) {
//		return [self getRouteAnnotationView:view viewForAnnotation:(RouteAnnotation*)annotation];
//	}
//	return nil;
//}

- (BMKOverlayView*)mapView:(BMKMapView *)bmkmapview viewForOverlay:(id<BMKOverlay>)overlay
//- (BMKOverlayView*)mapView:BMKMapView viewForOverlay:(id<BMKOverlay>)overlay
{	
	if ([overlay isKindOfClass:[BMKPolyline class]]) 
    {
        BMKPolylineView* polylineView = [ [BMKPolylineView alloc] initWithOverlay:overlay];// autorelease];
        //BMKCircleView* circleView = [[[BMKCircleView alloc] initWithOverlay:overlay] autorelease];

        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
        polylineView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.7];
        polylineView.lineWidth = 2.0;
        return polylineView;
    }
	return nil;
}


-(void) mapView: (BMKMapView*) pmapview didUpdateUserLocation: (BMKUserLocation*)userLocation
{
    CLLocationDistance distance = 0.0;
    
    if (userLocation.isUpdating)
    {
        self->uilRoadName.text = @"位置更新中...";
        return;
    }
    
    distance = BMKMetersBetweenMapPoints(BMKMapPointForCoordinate(userLocation.location.coordinate),
                                         BMKMapPointForCoordinate(_lastUserLocation));    
    
    //减少计算量，以及刷新地图的频率
    if (distance < 10.0){
        return;
    }
    
    //保存最后判断的在规划路径上的点坐标，用于判断偏离距离
    CLLocationCoordinate2D temp_Last_onPlanLocation = _lastUserLocation;

    //更新上一次获得的当前坐标
    [self setLastUserLocation:userLocation.location.coordinate];
    
    
    //关键路径点的数目
    int iStepCnt = DrivingRoute.steps.count;
    //可变数组，用于保存所有关键路径点的信息
    NSMutableArray *StepIndexs = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D temp_userLocation;
    
    //获取通过定位得到的当前用户位置
    temp_userLocation = userLocation.location.coordinate;
    
    //TEST____测试点
#ifdef TARGET_IPHONE_SIMULATOR
    //深南大道－1 起点
    //temp_userLocation.latitude = 22.54606;
    //temp_userLocation.longitude = 114.067022;
    //深南大道
    //temp_userLocation.latitude = 22.525933;
    //temp_userLocation.longitude = 113.977106;
    //滨海大道
    //temp_userLocation.latitude = 22.526134;
    //temp_userLocation.longitude = 113.992261;
    //创业路
    //temp_userLocation.latitude = 22.521449;
    //temp_userLocation.longitude = 113.932115;
    //偏离规划路径
    //temp_userLocation.latitude = 22.525656;
    //temp_userLocation.longitude = 113.933228;
    //调头路线(两段重合)
    //temp_userLocation.latitude = 22.482651;
    //temp_userLocation.longitude = 113.918204;
    temp_userLocation.latitude = 22.525887;
    temp_userLocation.longitude = 113.982577;
    
    
#endif
    
    //Debug Testing, mapView or mppView
    //[mapView setCenterCoordinate:temp_userLocation animated:0];
    [pmapview setCenterCoordinate:temp_userLocation animated:0];

    
    BMKMapPoint LocationPoint = BMKMapPointForCoordinate(temp_userLocation);
    
    for (int i = 0; i < (iStepCnt-1); i++) 
    {
        BMKStep* step_a = [DrivingRoute.steps objectAtIndex:i];
        BMKStep* step_b = [DrivingRoute.steps objectAtIndex:(i+1)];
        
        //NSLog(@"KEYPoin: X:%f, Y:%f", step_a.pt.latitude, step_a.pt.longitude);
        
        bool is_inLine = false;
        
        if (step_a.pt.latitude < step_b.pt.latitude)
        {
            if ((temp_userLocation.latitude >= step_a.pt.latitude) 
                && (temp_userLocation.latitude <= step_b.pt.latitude)) 
            {
                is_inLine = true;
            }
        }
        else 
        {
            if ((temp_userLocation.latitude <= step_a.pt.latitude) 
                && (temp_userLocation.latitude >= step_b.pt.latitude)) 
            {
                is_inLine = true;
            } 
        }
        
        if (step_a.pt.longitude < step_b.pt.longitude)
        {
            if ((temp_userLocation.longitude >= step_a.pt.longitude) 
                && (temp_userLocation.longitude <= step_b.pt.longitude)) 
            {
                is_inLine = true;
            }
        }
        else 
        {
            if ((temp_userLocation.longitude <= step_a.pt.longitude) 
                && (temp_userLocation.longitude >= step_b.pt.longitude)) 
            {
                is_inLine = true;
            }
        }
        
        if (is_inLine)
        {
            CandidateSteps *candStep = [[CandidateSteps alloc] init];
            //[candStep initialize];
            candStep.index = i;
            candStep.StPoint = step_a.pt;
            candStep.EdPoint = step_b.pt;
            [StepIndexs addObject:candStep];
            //[candStep dealloc];
            
            //DEBUG_INFO
            //NSLog(@"InLine_P1===============%@", step_a.content);
            //NSLog(@"InLine_P2===============%@", step_b.content);
            //END
        }
    }
    
    //NSLog(@"stepIndex.count= %d", StepIndexs.count);
    bool isOnPlan = false;
    
    for (int i=0; i<StepIndexs.count; i++)
    {
        CandidateSteps *candStep = [StepIndexs objectAtIndex:i];
        int RoutePointIndex = candStep.index+1;
        
        int iPointCnt =  [DrivingRoute getPointsNum:RoutePointIndex];
        //iCCnt += iPointCnt;
        //NSLog(@"\r\nStep%d, %@", i,item.title);
        //BMKMapPoint keyPoint = BMKMapPointForCoordinate(item.coordinate);
        //NSLog(@"KEYPoin: X:%f, Y:%f", keyPoint.x, keyPoint.y);
        //NSLog(@"KEYPoin: X:%f, Y:%f", item.coordinate.latitude, item.coordinate.longitude);
        if (iPointCnt < 1){
            continue;
        }
        
        //DEBUG_INFO
        //BMKStep* step = [DrivingRoute.steps objectAtIndex:RoutePointIndex];
        //NSLog(@"RouteInfo===============%@", step.content);
        
        //BMKMapPoint EnterPoint = BMKMapPointForCoordinate(step.pt);
        //NSLog(@"EnterPoint %f: %f", EnterPoint.x, EnterPoint.y);
        //END_DEBUG_INFO
        
        BMKMapPoint linePnt1;
        BMKMapPoint linePnt2;
        for (int k = 0; k < iPointCnt; k++)
        {
            
            if (k == 0){
                linePnt1 = BMKMapPointForCoordinate(candStep.StPoint);
                
                linePnt2 = (BMKMapPoint) *([DrivingRoute getPoints:RoutePointIndex]+k);
                
            }
            else if (k == iPointCnt) {
                linePnt1 = BMKMapPointForCoordinate(candStep.EdPoint);
                linePnt2 = (BMKMapPoint) *([DrivingRoute getPoints:RoutePointIndex]+k-1);
            }
            else {
                linePnt1 = (BMKMapPoint) *([DrivingRoute getPoints:RoutePointIndex]+k-1);
                linePnt2 = (BMKMapPoint) *([DrivingRoute getPoints:RoutePointIndex]+k);
            }
            
            //DEBUG_INFO
            //NSLog(@"LinePt1: %f, LinePt: %f", linePnt1.x, linePnt1.y);
            //NSLog(@"LinePt2: %f, LinePt: %f", linePnt2.x, linePnt2.y);
            //END
            
            //BMKMapPoint linePnt1 = (BMKMapPoint) *([DrivingRoute getPoints:i]+k);
            
            double dDistance =  GetNearLineDistance(LocationPoint, linePnt1, linePnt2);
            //GetNearLineDistance(LocationPoint, 
            //                                       ((BMKMapPoint) (*linePnt1)), 
            //                                       ((BMKMapPoint) (*linePnt1)));
            if ((dDistance > -1.0) && (dDistance < 30.0)) //小于30m，这个范围必须经过测试调整; 目前GPS精度为20M左右，并且加上路宽等因素；
            {
                BMKStep* step = [DrivingRoute.steps objectAtIndex:(candStep.index)];
                self->uilRoadName.text = step.content;
                
                //NSString *strRoadName = step.content;
                                
                
                //                if (candStep.index > 0)
                //                {
                //                    BMKStep* step = [DrivingRoute.steps objectAtIndex:(candStep.index-1)];
                //                    self->uilRoadName.text =step.content;
                //                }
                //                else {
                //                    self->uilRoadName.text = @"起点";
                //                }
                isOnPlan = true;
                break;
            }
            //NSLog(@"Point%d: Distance: %f", k, dDistance);
        }
        
        if (isOnPlan)
        {
            _lastOnPlanLocation = temp_userLocation;
            break;
        }
        
    }//end of for steps
    
    distance = BMKMetersBetweenMapPoints(BMKMapPointForCoordinate(_lastOnPlanLocation),
                                         BMKMapPointForCoordinate(temp_userLocation));    
    
    if ((!isOnPlan) && (distance > 100.0))
    {
        self->uilRoadName.text = @"您已经偏离航线";
        
        //self->_search = [[BMKSearch alloc]init];
//        bool result = [self->_search reverseGeocode:temp_userLocation];
//        if (!result)
//        {
//            NSLog(@"获取当前地址错误");
//            return;
//        }
    }
    
    
//    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    @autoreleasepool 
//    {
//        ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1U];
//        
//        /* Get a socket to talk to clients. */
//        NSLog(@"Connecting to TSS server…");
//        static NSString *const kEndpoint = @"tcp://localhost:5555";
//        ZMQSocket *requester = [ctx socketWithType:ZMQ_DEALER];
//        BOOL didBind = [requester connectToEndpoint:kEndpoint];
//        if (!didBind) {
//            NSLog(@"*** Failed to bind to endpoint [%@].", kEndpoint);
//            //return EXIT_FAILURE;
//            return;
//        }
//        

    
    TSS_Point_Builder *tssPointBuild = [[TSS_Point_Builder alloc]init];
    //TSS_DrivingRoute_RoadAndPoint_Builder *tssDrvSegmtBuild = [[TSS_DrivingRoute_RoadAndPoint_Builder alloc]init];
    TSS_DrivingRoute_Builder *tssRouteBuild = [[TSS_DrivingRoute_Builder alloc] init];
    [tssPointBuild setLat: 12.000001];
    [tssPointBuild setLon:132.000001];
    TSS_Point *pNewTssPnt = [tssPointBuild build];
    [tssRouteBuild setStart:pNewTssPnt];
    
    //@autoreleasepool 
    {
        
        for (int iseg = 0; iseg <10; iseg++)
        {
            TSS_Point_Builder *proStartPointBuild = [[TSS_Point_Builder alloc]init];
            [proStartPointBuild setLat: 12.000001];
            [proStartPointBuild setLon:132.000001];
            TSS_Point *pNewStartPnt = [proStartPointBuild build];
            if (pNewStartPnt == nil)
            {
                NSLog(@"*********Failed to build Point");
            }
            TSS_DrivingRoute_RoadAndPoint_Builder *tssDrvSegmtBuild = [[TSS_DrivingRoute_RoadAndPoint_Builder alloc]init];
            [tssDrvSegmtBuild setRoad:@"Road-A"];
            [tssDrvSegmtBuild setEnd:pNewStartPnt];
            TSS_DrivingRoute_RoadAndPoint *pRnP = [tssDrvSegmtBuild build];
            if (pRnP == nil)
            {
                NSLog(@"*********Failed to build pRnP");
            }
            [tssRouteBuild addSegment:pRnP];
        }
    }
    
    TSS_DrivingRoute *pDrvRoute = [tssRouteBuild build];
    if (pDrvRoute == nil)
    {
        NSLog(@"*********Failed to build Route");
    }
    
    static const int kMaxRequest = 2;
    //NSData *const request = [@"Hello" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *const request = [pDrvRoute data];
    for (int request_nbr = 0; request_nbr < kMaxRequest; ++request_nbr) 
    {
        //NSAutoreleasePool *localPool = [[NSAutoreleasePool alloc] init];
        
        NSLog(@"Sending request %d.", request_nbr);
        [zmqTSSSocket sendData:request withFlags:0];
//        NSData *reply = [zmqTSSSocket receiveDataWithFlags:0];
//        @autoreleasepool
//        {
//            NSString *text = [[NSString alloc]
//                              initWithData:reply encoding:NSUTF8StringEncoding];//YSH CODE autorelease];
//            
//            NSLog(@"Received reply %d: %@", request_nbr, text);
//        }
        
        //YSH CODE[localPool drain];
    }
    
//        
//        [requester close];
//        //[pool drain];
//    }
//    
}


@end
