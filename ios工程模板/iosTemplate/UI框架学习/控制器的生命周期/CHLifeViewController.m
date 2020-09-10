//
//  CHLifeViewController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHLifeViewController.h"

@interface CHLifeViewController ()

@end

@implementation CHLifeViewController
//当控制器加载完毕时调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//当控制器的view即将显示的时候调用.
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
}
//当控制器的view显示完毕时调用
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
//当控制器的View将要布局子控件的时候调用
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

//当控制器view布局子控件完毕时调用
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

//当控制器的View即将消失时调用
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
//当控制器的View消失完毕调用.
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

@end
