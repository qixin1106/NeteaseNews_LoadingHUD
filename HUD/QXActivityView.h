//
//  QXActivityView.h
//  TestHUD
//
//  Created by Qixin on 14/12/15.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <UIKit/UIKit.h>
//HUD圆圈直径
#define kHUDDiameter 30.0
//HUD圆圈描边宽度
#define kHUDLineWidth 2.0

@interface QXActivityView : UIView
@property (strong, nonatomic) UIColor *lineColor;
- (instancetype)initWithCenter:(CGPoint)center
                      diameter:(CGFloat)diameter
                     lineWidth:(CGFloat)lineWidth;
- (void)startAnimation;
- (void)stopAnimation;
@end
