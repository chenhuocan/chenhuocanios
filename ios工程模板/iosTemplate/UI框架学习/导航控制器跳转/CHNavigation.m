//
//  CHNavigation.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHNavigation.h"
#import "CHRootViewController.h"

@interface CHNavigation ()

@end

@implementation CHNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// 在AppDelegate中调用
- (void)application{
    // 创建窗口
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 初始化根控制器
    CHRootViewController *rootVC = [[CHRootViewController alloc] init];
    //设置窗口的根控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    window.rootViewController = nav;
    //显示窗口
    [window makeKeyWindow];
}

@end
