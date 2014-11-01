//
//  XRNAlertMessage.h
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNMessage.h"

@class BlockAlertView;

@interface XRNAlertMessage : XRNMessage

-(BlockAlertView*)buildAlertView;

@end
