//
//  ViewController.m
//  TestHUD
//
//  Created by Qixin on 14/12/2.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "ViewController.h"
#import "QXHUDView.h"
#import "QXActivityView.h"

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    QXActivityView *av = [[QXActivityView alloc] initWithCenter:CGPointMake(100, 200)
                                                       diameter:20.0
                                                      lineWidth:2.0];
    av.lineColor = [UIColor blueColor];
    [self.view addSubview:av];
    [av startAnimation];
    
    
    QXActivityView *av2 = [[QXActivityView alloc] initWithCenter:CGPointMake(100, 260)
                                                       diameter:40.0
                                                      lineWidth:5.0];
    av2.lineColor = [UIColor redColor];
    [self.view addSubview:av2];
    [av2 startAnimation];

    
    QXActivityView *av3 = [[QXActivityView alloc] initWithCenter:CGPointMake(100, 360)
                                                        diameter:50.0
                                                       lineWidth:15.0];
    av3.lineColor = [UIColor greenColor];
    [self.view addSubview:av3];
    [av3 startAnimation];

}


#pragma mark - Show HUD 5s
- (IBAction)onClick:(UIButton *)sender
{
    //MARK:Show in view
    if (sender.tag==0)
    {
        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        QXHUDView *hud = [[QXHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInView:pushVC.view];
    }

    //MARK:Show in window
    if (sender.tag==1)
    {
        UIViewController *pushVC = [[UIViewController alloc] init];
        pushVC.title = @"Display HUD";
        pushVC.view.backgroundColor = [UIColor whiteColor];
        QXHUDView *hud = [[QXHUDView alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        [hud showInWindow];
        //test
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideWithBlock:^(QXHUDView *hud) {
                [hud removeFromSuperview];
                hud=nil;
            }];
        });
    }
}


@end
