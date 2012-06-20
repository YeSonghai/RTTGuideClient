//
//  RttGAppDelegate.h
//  RTTGUIDE
//
//  Created by Ye Sean on 12-5-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "ZMQSocket.h"
#import "ZMQContext.h"

@interface RttGAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
    
    ZMQContext *zmqTSSContext;
    ZMQSocket *zmqTSSSocket;
}

@property (strong, nonatomic) UIWindow *window;

@end

//@interface BaiduMapApiDemoAppDelegate : NSObject 
//<UIApplicationDelegate> {
//    UIWindow *window;
//    UINavigationController *navigationController;
//    BMKMapManager* _mapManager;
//};
