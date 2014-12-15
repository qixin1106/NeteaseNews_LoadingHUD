//
//  QXActivityView.h
//  TestHUD
//
//  Created by Qixin on 14/12/15.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXActivityView : UIView
@property (strong, nonatomic) UIColor *lineColor;//线颜色
- (instancetype)initWithCenter:(CGPoint)center//中心坐标
                      diameter:(CGFloat)diameter//直径=frame.宽
                     lineWidth:(CGFloat)lineWidth;//线粗
- (void)startAnimation;
- (void)stopAnimation;
@end
