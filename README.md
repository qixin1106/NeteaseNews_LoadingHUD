模仿网易新闻的Loading效果动画
======================

演示效果(因为gif截取问题,动画3秒后就断了,请查看实际demo效果):

![image](https://raw.githubusercontent.com/qixin1106/NeteaseNews_LoadingHUD/master/showDisplay.gif)

单个loading显示,可以配置.

![image](https://raw.githubusercontent.com/qixin1106/NeteaseNews_LoadingHUD/master/single.gif)








### LOADING

    QXActivityView *av = [[QXActivityView alloc] initWithCenter:CGPointMake(100, 200)
                                                       diameter:20.0
                                                      lineWidth:2.0];
    av.lineColor = [UIColor blueColor];
    [self.view addSubview:av];
    [av startAnimation];








### SHOW IN VIEW

        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        QXHUDView *hud = [[QXHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInView:pushVC.view];

### SHOW IN WINDOW

        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        QXHUDView *hud = [[QXHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInWindow];

### HIDE

            [hud hideWithBlock:^(QXHUDView *hud) {
                [hud removeFromSuperview];
                hud=nil;
            }];





