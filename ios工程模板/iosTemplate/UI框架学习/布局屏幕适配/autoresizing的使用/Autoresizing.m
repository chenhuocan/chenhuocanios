//
//  Autoresizing.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//  自动调整布局大小
//  iOS屏幕适配主要有三个技术，分别是Autoresizing、AutoLayout、SizeClass
//  https://www.jianshu.com/p/b637d3d21606  Autoresizing、AutoLayout、SizeClass 介绍
//  Autoresizing 比较少用了

#import "Autoresizing.h"

@interface Autoresizing ()

@end

@implementation Autoresizing

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    CGFloat X = self.view.frame.size.width - 100;
    CGFloat Y = self.view.frame.size.height - 100;
    redView.frame = CGRectMake(0, 0, 100, 100);
    
    /*
     UIViewAutoresizingFlexibleLeftMargin 距离父控件的左边是可以伸缩的
     UIViewAutoresizingFlexibleBottomMargin 距离父控件的底部是可以伸缩的
     UIViewAutoresizingFlexibleRightMargin 距离父控件的右边是可以伸缩的
     UIViewAutoresizingFlexibleTopMargin 距离父控件的顶部是可以伸缩的
     UIViewAutoresizingFlexibleHeight  高度会跟随父控件的高度进行伸缩
     UIViewAutoresizingFlexibleWidth  宽度会跟随父控件的宽度进行伸缩
     */
    
    redView.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:redView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
