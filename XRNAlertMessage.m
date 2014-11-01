//
//  XRNAlertMessage.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNAlertMessage.h"
#import "BlockAlertView.h"

@implementation XRNAlertMessage

-(BlockAlertView*)buildAlertView
{
    NSString *title = self.dictionary[XRNMessageTitleField];
    if (title.length == 0)
        title = NSLocalizedString(@"Notification", @"");
    
    NSString *body = self.dictionary[XRNMessageDetailedTextField];
    if (body.length == 0)
        body = self.dictionary[@"aps"][@"alert"];
    
    BlockAlertView *alertView = [[BlockAlertView alloc] initWithTitle:title message:body];
    
    return alertView;
}

-(void)handle
{
    BlockAlertView *alertView = [self buildAlertView];
    if (alertView.numberOfButtons == 0)
    {
        [alertView addButton:NSLocalizedString(@"Ok", @"") withBlock:nil];
        alertView.cancelButtonIndex = 0;
    }
    
    [alertView show];
}

@end
