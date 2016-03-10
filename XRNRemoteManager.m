//
//  XRNRemoteManager.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 30.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNRemoteManager.h"

#import "XRNMessage.h"

#import <Parse/Parse.h>

@implementation XRNRemoteManager

+(void)appDidFinishLaunching:(NSString*)appId clientKey:(NSString*)clientKey
{
    [Parse setApplicationId:appId
                  clientKey:clientKey];
    
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
}

+(NSString*)languageChannel
{
    return [NSLocale preferredLanguages][0];
}

+(void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    
    [currentInstallation setChannels:@[[self languageChannel],@"global"]];
    
    [currentInstallation saveInBackground];
}

+(void)handlePush:(NSDictionary*)userInfo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        XRNMessage *message = [XRNMessage messageFromDictionary:userInfo];
        [message handle];
    });
}

@end
