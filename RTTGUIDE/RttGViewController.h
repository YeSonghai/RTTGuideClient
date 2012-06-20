//
//  RttGViewController.h
//  RTTGUIDE
//
//  Created by Ye Sean on 12-5-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "ZMQSocket.h"
#import "ZMQContext.h"

//#import "/Users/seanyie/Projects/RTTGUIDE/BaiduMapApi_Lib_iOS_1.2.0/inc/BMapKit.h"


@interface RttGViewController : UIViewController <BMKMapViewDelegate, BMKSearchDelegate> 
{
	IBOutlet BMKMapView* _mapView;
    __weak IBOutlet UILabel *uilRoadName;
	BMKSearch* _search;

    //NSMutableArray * _RoutSteps;
    NSArray * _RoutSteps;
    BMKRoute* DrivingRoute;
    
    ZMQContext *zmqTSSContext;
    ZMQSocket *zmqTSSSocket;
    
    NSOperationQueue *rttThreadQue; 
}

@end

double GetNearLineDistance(BMKMapPoint pnt,  BMKMapPoint p1, BMKMapPoint p2);
//double geiei(int i, int b);
