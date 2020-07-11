//
//  UIButtonLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

//iOS 事件分为三大类型
//触摸事件
//加速事件
//远程控制事件

//在iOS中不是任何对象都能处理事件，只有继承了UIResponder的对象才能接收并处理事件。我们称之为“响应者对象”
//
//UIApplication、UIViewController、UIView都继承自UIResponder，因此它们都是响应者对象，都能够接收并处理事件
//
//UIResponder内部提供了以下方法来处理事件
//触摸事件
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
//
//加速计事件
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//
//远程控制事件
//- (void)remoteControlReceivedWithEvent:(UIEvent *)event;



//触摸事件类型
//UIControlEventTouchDown    点按下去的事件
//UIControlEventTouchDownRepeat  重复的触动事件
//UIControlEventTouchDragInside   手指在控件的边界内拖动的事件
//UIControlEventTouchDragOutside   手指在控件边界之外被拖动的事件
//UIControlEventTouchDragEnter  手指被拖动到控件的边界的事件
//UIControlEventTouchDragExit  一个手指从控件内拖到外界的事件
//UIControlEventTouchUpInside  手指处于控制范围内的触摸事件
//UIControlEventTouchUpOutside  手指超出控制范围的控制中的触摸事件
//UIControlEventTouchCancel  取消控件当前触发的事件
//UIControlEventValueChanged  当控件的值发生改变时，发送通知。
//UIControlEventPrimaryActionTriggered
//UIControlEventEditingDidBegin 当文本控件中开始编辑时发送通知。
//UIControlEventEditingChanged  当文本控件中的文本被改变时发送通知
//UIControlEventEditingDidEnd   当文本控件中编辑结束时发送通知
//UIControlEventEditingDidEndOnExit 当文本控件内通过按下回车键（或等价行为）结束编辑时，发送通知。
//UIControlEventAllTouchEvents  通知所有触摸事件。
//UIControlEventAllEditingEvents  通知所有关于文本编辑的事件。
//UIControlEventApplicationReserved
//UIControlEventSystemReserved
//UIControlEventAllEvents  通知所有事件。



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
