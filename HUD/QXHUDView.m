//
//  XPHUDView.m
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "QXHUDView.h"
#import "QXActivityView.h"



@interface QXHUDView ()
@property (strong, nonatomic) UIView *hudView;
@property (strong, nonatomic) QXActivityView *activityView;
@end

@implementation QXHUDView


- (void)dealloc
{
    NSLog(@"XPHUDView dealloc!");
    [self.activityView stopAnimation];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.frame = CGRectMake(0,
                                0,
                                [[UIScreen mainScreen] bounds].size.width,
                                [[UIScreen mainScreen] bounds].size.height);
        
        self.hudView = [[UIView alloc] init];
        self.hudView.frame = CGRectMake(0, 0, 100, 100);
        self.hudView.center = self.center;
        self.hudView.layer.cornerRadius = 5.0f;
        self.hudView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        self.hudView.alpha = 0;
        [self addSubview:self.hudView];
        
        self.activityView = [[QXActivityView alloc] initWithCenter:CGPointMake(50, 50)
                                                          diameter:30.0
                                                         lineWidth:2.0];
        self.activityView.lineColor = [UIColor redColor];
        [self.hudView addSubview:self.activityView];
    }
    return self;
}


#pragma mark - 显示
- (void)showInWindow
{
    [self.activityView startAnimation];
    if ([UIApplication sharedApplication].windows.count>1)
    {
        UIWindow *win = [[UIApplication sharedApplication].windows lastObject];
        [win addSubview:self];
    }
    else
    {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    [UIView animateWithDuration:0.15f animations:^{
        self.hudView.alpha = 1;
    }];
}

- (void)showInView:(UIView*)view
{
    [self.activityView startAnimation];
    [view addSubview:self];
    [UIView animateWithDuration:0.15f animations:^{
        self.hudView.alpha = 1;
    }];
}

#pragma mark - 隐藏并动画结束后回调
- (void)hideWithBlock:(HUDDidHide)hudDidHide
{
    [UIView animateWithDuration:0.15f animations:^{
        self.hudView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.activityView stopAnimation];
        if (hudDidHide){hudDidHide(self);}
    }];
}




@end
