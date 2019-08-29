//
//  UIResponder+Router.h
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)
/**
 凡是继承UIResponder的控件,都可以通过事件响应链条传递事件
 
 @param eventName 事件名
 @param userInfo 附加参数,nullable可以为空
 */
-(void)routerEventWithName:(NSString *)eventName userInfo:(nullable NSDictionary*)userInfo;
@end
