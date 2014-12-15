//
//  XPHUDView.h
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXHUDView : UIView
//显示
- (void)showInWindow;
- (void)showInView:(UIView*)view;
//隐藏
typedef void(^HUDDidHide)(QXHUDView *hud);
- (void)hideWithBlock:(HUDDidHide)hudDidHide;
@end






