//
//  XPHUDView.h
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <UIKit/UIKit.h>
//HUD圆圈直径
#define kHUDDiameter 30.0
//HUD圆圈描边宽度
#define kHUDLineWidth 2.0

@interface XPHUDView : UIView
//显示
- (void)showInWindow;
- (void)showInView:(UIView*)view;
//隐藏
typedef void(^HUDDidHide)(XPHUDView *hud);
- (void)hideWithBlock:(HUDDidHide)hudDidHide;
@end






