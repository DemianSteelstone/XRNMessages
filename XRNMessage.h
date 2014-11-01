//
//  XRNMessage.h
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const XRNMessageTypeField;    // use alert class name
extern NSString * const XRNMessageTitleField;
extern NSString * const XRNMessageDetailedTextField;
extern NSString * const XRNMessageURLField;

@interface XRNMessage : NSObject

@property (nonatomic,strong, readonly) NSDictionary *dictionary;

+(XRNMessage*)messageFromDictionary:(NSDictionary*)dictionary;

-(void)handle;

@end
