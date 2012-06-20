//
//  RttGOprRcvTSS.m
//  RTTGUIDE
//
//  Created by Ye Sean on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RttGOprRcvTSS.h"

@implementation RttGOprRcvTSS


@synthesize zmqTSSContx;
@synthesize zmqTSSSocket;

- (id) initWithZMQ:(ZMQContext*) zmqctx andSocket:(ZMQSocket*)zmqsocket
{
    self = [super init];
    self.zmqTSSContx = zmqctx;
    self.zmqTSSSocket = zmqsocket;
    
    return self;
}


- (void)main 
{ 
    
    @autoreleasepool
    {

        while (true)
        {
            
            NSData *reply = [zmqTSSSocket receiveDataWithFlags:0];
            NSString *text = [[NSString alloc]
                              initWithData:reply encoding:NSUTF8StringEncoding];//YSH CODE autorelease];

            NSLog(@"Received reply %@", text);
        }
    }
    
} 

@end
