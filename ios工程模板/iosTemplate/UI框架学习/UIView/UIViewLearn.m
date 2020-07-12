//
//  UIViewLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UIViewLearn.h"

@interface UIViewLearn ()

@end

@implementation UIViewLearn

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self attribute];
    [self methods];
    [self attributeSize];
    
}

#pragma mark  -常见属性

- (void)attribute {
  
    // Do any additional setup after loading the view.
    // 控制器的父控件 self.view.superview --> UIWindow
    NSLog(@"控制器的父控件 %@",self.view.superview);
    // 控制器的子控件 self.view.subviews 如果没有子控件就输出一个空数组,如果有子控件输出下面的格式数据
    // (
    //    "<UISwitch: 0x7fe243406250; frame = (171 187; 51 31); opaque = NO; autoresize = RM+BM; layer = <CALayer: 0x600000cc2040>>"
    //)
    NSLog(@"控制器的父控件 %@",self.view.subviews);
}
#pragma mark  -常见方法
- (void)methods {
    /**
     *  尽量少使用tag:
        1> tag的效率非常差
        2> tag使用多了,容易乱
     */

    // 设置tag [self.view setTag:1] 或是在storyboard上设置view的tag
    // 1、 根据tag 拿到对应的view
    // UIView * redView = [self.view viewWithTag:1];
    // 2、将控件添加到view
    UISwitch *sw = [[UISwitch alloc] init];
    [self.view addSubview: sw];

    // 选项卡对象
    // UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"选项1"]];

    // 移除 子控件从view 移除
        // [sw removeFromSuperview];
}

#pragma mark -常见属性（尺寸和位置）
- (void)attributeSize {
    UILabel *label = [[UILabel alloc] init];
//  设置frame(位置和尺寸)
    label.frame = CGRectMake(100, 100, 100, 100);
    label.backgroundColor = [UIColor yellowColor];
    label.bounds = CGRectMake(0, 0, 100, 120);
    label.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    
    
    

    
    
    CGRect frame = label.frame;
    frame.origin.x -= 100; // 改变x值
    frame.origin.y += 100; // 改变y值
    frame.size.width += 50; // 改变宽度
    frame.size.height += 100; // 改变高度
    label.frame = frame;
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
