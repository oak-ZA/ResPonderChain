//
//  ViewController.m
//  PastLabel
//
//  Created by 张奥 on 2019/8/29.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ViewController.h"
#import "ZALabel.h"
#import "ZAButton.h"
#import "CustomView.h"
#import "UIResponder+Router.h"
#import "EventProxy.h"
#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#define SCREEN_Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZALabel *label1 = [[ZALabel alloc] initWithFrame:CGRectMake(20, 100, SCREEN_Width - 40, 50)];
    label1.text = @"复制";
    label1.textColor = [UIColor redColor];
    label1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label1];
    
    ZALabel *label2 = [[ZALabel alloc] initWithFrame:CGRectMake(20, 200, SCREEN_Width - 40, 50)];
    label2.text = @"粘贴";
    label2.textColor = [UIColor redColor];
    label2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label2];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(80, 300, 100, 100)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    ZAButton *button = [ZAButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.layer.cornerRadius = 50.f;
    button.layer.masksToBounds = YES;
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(80, 420, 100, 80)];
    [self.view addSubview:customView];
}

-(void)clickButton:(UIButton*)button{
    NSLog(@"12345666");
    
}
-(void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    EventProxy *eventProxy = [[EventProxy alloc] init];
    [eventProxy handleEventWithName:eventName parameter:userInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
