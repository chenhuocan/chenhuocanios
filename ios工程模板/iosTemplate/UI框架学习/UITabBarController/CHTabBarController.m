//
//  CHTabBarController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHTabBarController.h"

@interface CHTabBarController ()

@end

@implementation CHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)demo {
    //1、 创建窗口
    UIWindow * window =  [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 2、设置窗口的根控制器
    UITableViewController *tabVC = [[UITableViewController alloc]init];
    //3、创建控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav.tabBarItem.title = @"消息";
    nav.tabBarItem.title  = @"消息";
    nav.tabBarItem.badgeValue = @"10";
    nav.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
    //添加子控制器
    [tabVC addChildViewController:nav];
    
    //创建控制器
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    vc2.tabBarItem.title = @"联系人";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    [tabVC addChildViewController:vc2];

    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    vc3.tabBarItem.title = @"动态";
    vc3.tabBarItem.image = [UIImage imageNamed:@"tab_qworld_nor"];
    [tabVC addChildViewController:vc3];

//    //选中某一个子控制器
//    tabVC.selectedIndex = 2;

    
    window.rootViewController = tabVC;
    //3.显示窗口
    [window makeKeyAndVisible];
}

@end
