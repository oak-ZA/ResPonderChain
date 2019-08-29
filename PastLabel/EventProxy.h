//
//  EventProxy.h
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kEventSend;

@interface EventProxy : NSObject
-(void)handleEventWithName:(NSString*)eventName parameter:(NSDictionary*)parameter;
@end
