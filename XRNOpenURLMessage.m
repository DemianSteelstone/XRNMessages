//
//  XRNOpenURLMessage.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNOpenURLMessage.h"

#import <BlocksKit/BlocksKit+UIKit.h>

@implementation XRNOpenURLMessage

-(UIAlertView*)buildAlertView
{
    UIAlertView *alertView = [super buildAlertView];
    
    [alertView bk_setCancelButtonWithTitle:NSLocalizedString(@"Cancel", @"") handler:nil];
    [alertView bk_addButtonWithTitle:NSLocalizedString(@"View", @"") handler:^{
        NSURL *url = [NSURL URLWithString:self.dictionary[XRNMessageURLField]];
        [[UIApplication sharedApplication] openURL:url];
    }];
    
    return alertView;
}

@end
