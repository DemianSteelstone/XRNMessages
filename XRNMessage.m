//
//  XRNMessage.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 31.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XRNMessage.h"

#import "XRNAlertMessage.h"

NSString * const XRNMessageTypeField = @"type";
NSString * const XRNMessageTitleField = @"title";
NSString * const XRNMessageDetailedTextField = @"detailed-text";
NSString * const XRNMessageURLField = @"url";

@implementation XRNMessage

+(XRNMessage*)messageFromDictionary:(NSDictionary*)dictionary
{
    NSString *className = dictionary[XRNMessageTypeField];
    Class class = NSClassFromString(className);
    
    if (class == nil)
        class = [XRNAlertMessage class];
    
    return [[class alloc] initWithDictionary:dictionary];
}

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        _dictionary = dictionary;
    }
    return self;
}

-(void)handle
{
    [self doesNotRecognizeSelector:_cmd];
}

@end
