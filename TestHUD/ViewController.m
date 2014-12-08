//
//  ViewController.m
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "ViewController.h"
#import "XPHUDView.h"


@implementation ViewController



#pragma mark - Show HUD 5s
- (IBAction)onClick:(UIButton *)sender
{
    //MARK:Show in view
    if (sender.tag==0)
    {
        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        XPHUDView *hud = [[XPHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInView:pushVC.view];
    }

    //MARK:Show in window
    if (sender.tag==1)
    {
        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        XPHUDView *hud = [[XPHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInWindow];
        //test
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideWithBlock:^(XPHUDView *hud) {
                [hud removeFromSuperview];
                hud=nil;
            }];
        });
    }
}


@end
