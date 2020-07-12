//
//  UIButtonLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UIButtonLearn.h"

@interface UIButtonLearn ()

@end

@implementation UIButtonLearn

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.1 创建UIButton对象
    //  UIButton *button = [[UIButton alloc] init];
    // 注意:要设置按钮的样式,只有在创建的时候进行设置 常用:UIButtonTypeCustom
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 1.2 设置按钮的样式 没有效果
    // button.buttonType = UIButtonTypeContactAdd;
    // 1.3 设置按钮的frame
    button.frame = CGRectMake(100, 100, 177, 60);
    // 1.4 设置按钮的背景
//    button.backgroundColor = [UIColor redColor];
//    [button setBackgroundColor:[UIColor redColor]];
    // 1.5 设置按钮的文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    [button setTitle:@"高亮按钮" forState:UIControlStateHighlighted];
    // 1.6 设置按钮文字的颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    // 1.7 设置按钮的阴影颜色
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.shadowOffset = CGSizeMake(1, 1);
    // 1.8 设置内容图片
    [button setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
      [button setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    // 1.9 设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
     [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    
    // 四个值依次是：上、左、下、右，代表的是距离上边界、左边界、下边界、右边界的位移，默认都是0。
    // 设置按钮的内边距
        //1.设置内容
    // button.contentEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    // 2.设置图片
    // button.imageEdgeInsets = UIEdgeInsetsMake(0,0, 0, 0);
    // // 3.设置标题
    // button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    
    // 设置button的取消点击高亮效果设置属性adjustsImageWhenDisabled和adjustsImageWhenHighlighted
    //button.adjustsImageWhenHighlighted = NO;
    //button.adjustsImageWhenDisabled=NO;
    
    [self.view addSubview:button];
    
    button.enabled = true;
    // 3.0 重要
    /**
     *  监听按钮的点击
     *  addTarget: 目标,(让谁做事情)
     *  action: 方法,(做什么事情<方法>)
     *  Events: 事件(点击事件)
     */
    [button addTarget:self action:@selector(demo:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)demo: (UIButton *)btn{
    // 点击按钮做事情
    NSLog(@"%@", btn);
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
