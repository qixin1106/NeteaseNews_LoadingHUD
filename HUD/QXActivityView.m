//
//  QXActivityView.m
//  TestHUD
//
//  Created by Qixin on 14/12/15.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "QXActivityView.h"

@interface QXActivityView ()
@property (assign, nonatomic) CGFloat diameter;
@property (assign, nonatomic) CGFloat lineWidth;
@property (strong, nonatomic) CADisplayLink *link;
@property (assign, nonatomic) NSInteger start;
@property (assign, nonatomic) NSInteger end;
@property (assign, nonatomic) BOOL isFlap;
@end

@implementation QXActivityView

- (void)startAnimation
{
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateActivityView)];
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopAnimation
{
    [self.link invalidate];
    self.link = nil;
    [self removeFromSuperview];
}




- (void)dealloc
{
    NSLog(@"QXActivityView dealloc!");
    [self stopAnimation];
}



- (instancetype)initWithCenter:(CGPoint)center
                      diameter:(CGFloat)diameter
                     lineWidth:(CGFloat)lineWidth
{
    self = [super init];
    if (self)
    {
        self.lineWidth = lineWidth;
        self.diameter = diameter;
        self.frame = CGRectMake(center.x,
                                center.y,
                                diameter+lineWidth,
                                diameter+lineWidth);
        self.center = center;
        self.backgroundColor = [UIColor clearColor];
        self.start = 0;
        self.end = 0;
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
        if (!self.lineColor)
        {
            self.lineColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        }
        //因为考虑lineWidth因素,相当于photoshop中得描边居中显示,因此需要做lineWidth宽度一半的便宜,否则会有切除效果
        CGRect ovalRect = CGRectMake(self.lineWidth*0.5,
                                     self.lineWidth*0.5,
                                     self.diameter,
                                     self.diameter);
        UIBezierPath* ovalPath = UIBezierPath.bezierPath;
        ovalPath.lineCapStyle = kCGLineCapRound;
        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))
                            radius: CGRectGetWidth(ovalRect)*0.5
                        startAngle: self.start * M_PI/180.0
                          endAngle: self.end * M_PI/180.0
                         clockwise: YES];
        [self.lineColor setStroke];
        ovalPath.lineWidth = self.lineWidth;
        [ovalPath stroke];
    }
}
@end
