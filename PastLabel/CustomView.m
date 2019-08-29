//
//  CustomView.m
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "CustomView.h"
#import "EventProxy.h"
#import "UIResponder+Router.h"
@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor blueColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height);
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(clickSendButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

-(void)clickSendButton:(UIButton*)button{
    [self routerEventWithName:kEventSend userInfo:@{@"1":@"张奥"}];
}

@end
