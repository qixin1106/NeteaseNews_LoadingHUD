//
//  XPHUDView.m
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "XPHUDView.h"

@interface ActivityView : UIView
- (void)hide;
@end






@interface XPHUDView ()
@property (strong, nonatomic) UIView *hudView;
@property (strong, nonatomic) ActivityView *activityView;
@end

@implementation XPHUDView


- (void)dealloc
{
    NSLog(@"XPHUDView dealloc!");
    [self.activityView hide];
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
        
        self.activityView = [[ActivityView alloc] initWithFrame:CGRectZero];
        self.activityView.center = CGPointMake(50, 50);
        [self.hudView addSubview:self.activityView];
    }
    return self;
}


#pragma mark - 显示
- (void)showInWindow
{
    //MARK: 适配,iOS8以后存在多个window(如显示win,input的win等...),如果不加载在最后一个window上,可能会被呼出的键盘遮挡等恶心的效果.
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
        [self.activityView hide];
        if (hudDidHide){hudDidHide(self);}
    }];
}




@end













@interface ActivityView ()
@property (strong, nonatomic) CADisplayLink *link;
@property (assign, nonatomic) NSInteger start;
@property (assign, nonatomic) NSInteger end;
@property (assign, nonatomic) BOOL isFlap;
@end

@implementation ActivityView

- (void)hide
{
    [self.link invalidate];
    //这个方法已经removeFromRunLoop了,不需要下面再次调用
    //[self.link removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)dealloc
{
    NSLog(@"ActivityView dealloc!");
    [self hide];
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = CGRectMake(frame.origin.x,
                                frame.origin.y,
                                kHUDDiameter+kHUDLineWidth,
                                kHUDDiameter+kHUDLineWidth);
        self.backgroundColor = [UIColor clearColor];
        self.start = 0;
        self.end = 0;
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateActivityView)];
        [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}



#pragma mark - Logic
- (void)updateActivityView
{
    NSInteger zhou = (self.isFlap)?360:720;
    if ((self.end/zhou)%2==1)
    {
        self.isFlap=!self.isFlap;
        self.start=0;
        self.end=0;
    }

    if (self.isFlap)
    {
        self.start+=8;
        self.end+=4;
    }
    else
    {
        self.start+=4;
        self.end+=8;
    }
    [self.layer setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    @autoreleasepool
    {
        UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        //因为考虑lineWidth因素,相当于photoshop中得描边居中显示,因此需要做lineWidth宽度一半的便宜,否则会有切除效果
        CGRect ovalRect = CGRectMake(kHUDLineWidth*0.5,
                                     kHUDLineWidth*0.5,
                                     kHUDDiameter,
                                     kHUDDiameter);
        UIBezierPath* ovalPath = UIBezierPath.bezierPath;
        ovalPath.lineCapStyle = kCGLineCapRound;
        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))
                            radius: CGRectGetWidth(ovalRect)*0.5
                        startAngle: self.start * M_PI/180.0
                          endAngle: self.end * M_PI/180.0
                         clockwise: YES];
        [color setStroke];
        ovalPath.lineWidth = kHUDLineWidth;
        [ovalPath stroke];
    }
}

@end

