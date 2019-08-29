//
//  ZAButton.m
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ZAButton.h"

@implementation ZAButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL flag = [super pointInside:point withEvent:event];
    if (flag) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        if ([path containsPoint:point]) {
            return YES;
        }
    }
    return NO;
}

@end
