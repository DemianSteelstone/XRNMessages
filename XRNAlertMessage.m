//
//  XRNAlertMessage.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNAlertMessage.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@implementation XRNAlertMessage

-(UIAlertView*)buildAlertView
{
    NSString *title = self.dictionary[XRNMessageTitleField];
    if (title.length == 0)
        title = NSLocalizedString(@"Notification", @"");
    
    NSString *body = self.dictionary[XRNMessageDetailedTextField];
    if (body.length == 0)
        body = self.dictionary[@"aps"][@"alert"];
    
    UIAlertView *alertView = [[UIAlertView alloc] bk_initWithTitle:title message:body];
    
    return alertView;
}

-(void)handle
{
    UIAlertView *alertView = [self buildAlertView];
    if (alertView.numberOfButtons == 0)
        [alertView bk_setCancelButtonWithTitle:NSLocalizedString(@"Ok", @"") handler:nil];
    
    [alertView show];
}

@end
