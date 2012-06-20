//
//  RttGAppDelegate.m
//  RTTGUIDE
//
//  Created by Ye Sean on 12-5-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RttGAppDelegate.h"

@implementation RttGAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // 要使用百度地图,请先启动 BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    
    // 如果要关注网络及授权验证事件,请设定 generalDelegate 参数
    BOOL ret = [_mapManager start:@"513CBE299AB953DDFAEBC4A608F1F6557C30D685" generalDelegate:nil];
    //BOOL ret = [_mapManager start:@"9FF1B68BD31F426E718CC680FF75A14C52CE5D8E" generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view]; 
    [self.window makeKeyAndVisible]; 
    
    //[[self.window rootViewController]]
    [ [ UIApplication sharedApplication] setIdleTimerDisabled:YES ] ;

//    //@autoreleasepool {
//    zmqTSSContext = [[ZMQContext alloc] initWithIOThreads:1U];
//    //}
//    static NSString *const kEndpoint = @"tcp://192.168.1.6:6001";
//    zmqTSSSocket = [zmqTSSContext socketWithType:ZMQ_DEALER];
//    BOOL didBind = [zmqTSSSocket connectToEndpoint:kEndpoint];
//    if (!didBind) 
//    {
//        NSLog(@"*** Failed to bind to endpoint [%@].", kEndpoint);
//        //return EXIT_FAILURE;
//        return;
//    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
