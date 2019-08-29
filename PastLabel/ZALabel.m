//
//  ZALabel.m
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ZALabel.h"

@implementation ZALabel

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
        self.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}
//长按响应
-(void)longPress:(UILongPressGestureRecognizer*)longpress{
    if (longpress.state == UIGestureRecognizerStateBegan) {
        //设置成为第一响应者
        [self becomeFirstResponder];
        //显示菜单栏
        UIMenuController *menCtrl = [UIMenuController sharedMenuController];
        [menCtrl setTargetRect:self.frame inView:self.superview];
        [menCtrl setMenuVisible:YES animated:YES];
    }
}

//返回需要显示的菜单按钮
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    //只显示复制,粘贴按钮
    if (action == @selector(copy:) || action == @selector(paste:)) {
        return YES;
    }
    return NO;
}

//实现复制方法
-(void)copy:(id)sender{
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.text;
}
//实现粘贴方法
-(void)paste:(id)sender{
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    self.text = paste.string;
}
@end
