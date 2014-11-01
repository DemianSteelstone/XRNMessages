//
//  XRNRemoteManager.h
//  photoexplorer
//
//  Created by Evgeny Rusanov on 30.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XRNRemoteManager : NSObject

+(void)appDidFinishLaunching:(NSString*)appId clientKey:(NSString*)clientKey;
+(void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken;
+(void)handlePush:(NSDictionary*)userInfo;

@end
