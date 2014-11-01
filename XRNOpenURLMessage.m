//
//  XRNOpenURLMessage.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNOpenURLMessage.h"

#import "BlockAlertView.h"

@implementation XRNOpenURLMessage

-(BlockAlertView*)buildAlertView
{
    BlockAlertView *alertView = [super buildAlertView];
    
    [alertView addButton:NSLocalizedString(@"Cancel", @"") withBlock:nil];
    [alertView addButton:NSLocalizedString(@"View", @"") withBlock:^(BlockAlertView *alert) {
        NSURL *url = [NSURL URLWithString:self.dictionary[XRNMessageURLField]];
        [[UIApplication sharedApplication] openURL:url];
    }];
    
    return alertView;
}

@end
