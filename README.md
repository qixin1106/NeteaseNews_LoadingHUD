模仿网易新闻的Loading效果动画
======================

演示效果(因为gif截取问题,动画3秒后就断了,请查看实际demo效果):

![image](https://raw.githubusercontent.com/qixin1106/NeteaseNews_LoadingHUD/master/showDisplay.gif)




### SHOW IN VIEW

        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        XPHUDView *hud = [[XPHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInView:pushVC.view];

### SHOW IN WINDOW

        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        XPHUDView *hud = [[XPHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInWindow];

### HIDE

           [hud hideWithBlock:^(XPHUDView *hud) {
                [hud removeFromSuperview];
                hud=nil;
            }];
