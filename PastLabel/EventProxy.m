//
//  EventProxy.m
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "EventProxy.h"
#import "UIResponder+Router.h"

NSString *const kEventSend = @"sende";
@interface EventProxy()
@property (nonatomic, strong) NSDictionary *eventStrategyDictionary;
@end

@implementation EventProxy
/**
 通过方法SEL生成NSInvocation
 
 @param selector 方法
 @return Invocation对象
 */
-(NSInvocation *)createInvocationWithSelector:(SEL)selector{
    // 通过方法名创建方法签名 注意:不能使用 [[NSInvocation alloc] init]也不可以用下面这个方法
    // NSMethodSignature *signature = [NSInvocation instanceMethodSignatureForSelector:selector];
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    // 通过方法签名创建invocation
    // signature == nil 这里就会崩溃
    NSInvocation *invacation = [NSInvocation invocationWithMethodSignature:signature];
    [invacation setTarget:self];
    [invacation setSelector:selector];
    return invacation;
}
-(NSDictionary *)eventStrategyDictionary{
    if (!_eventStrategyDictionary) {
        NSInvocation *invocation1 = [self createInvocationWithSelector:@selector(clickSendButtonParament:)];
        _eventStrategyDictionary = @{kEventSend:invocation1};
    }
    return _eventStrategyDictionary;
}

-(void)handleEventWithName:(NSString *)eventName parameter:(NSDictionary *)parameter{
    //获取invocation
    NSInvocation *invocation = self.eventStrategyDictionary[eventName];
    //设置invocation参数
    [invocation setArgument:&parameter atIndex:2];
    //调用方法
    [invocation invoke];
}

-(void)clickSendButtonParament:(NSDictionary*)parameter{
    NSLog(@"%@",parameter);
}
@end
