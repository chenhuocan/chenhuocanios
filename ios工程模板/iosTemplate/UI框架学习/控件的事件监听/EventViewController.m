//
//  EventViewController.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
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

#import "EventViewController.h"

@interface EventViewController ()<UITextFieldDelegate>

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
       [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *textFlied = [[UITextField alloc] init];
    textFlied.delegate = self;
    //用代理替换了这些事件
//    [textFlied addTarget:self action:@selector(tfEditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//
//    [textFlied addTarget:self action:@selector(tfEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//
//    [textFlied addTarget:self action:@selector(tfEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    UISegmentedControl *s = [[UISegmentedControl alloc] initWithItems:@[@"123",@"234",@"456",@"567"]];
    s.selectedSegmentIndex = 0;
    [s addTarget:self action:@selector(sClick:) forControlEvents:UIControlEventValueChanged];
    s.center = CGPointMake(self.view.center.x, 200);
    [self.view addSubview:s];
    
}
- (void)btnClick:(UIButton *)btn{
    
}

- (void)sClick:(UISegmentedControl *)s
{
    NSLog(@"%ld",s.selectedSegmentIndex);
}
#pragma mark - textFlied监听方法
- (void)tfEditingDidBegin
{
    NSLog(@"开始编辑");
}

- (void)tfEditingDidEnd
{
    NSLog(@"结束编辑");
}

- (void)tfEditingChanged:(UITextField *)tf
{
    NSLog(@"%@",tf.text);
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
}

/**
 *  当textField文字改变就会调用这个方法
 *  @param string    用户输入的文字
 *
 *  @return YES:允许用户输入;NO:禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange--%@",string);
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    
}
@end
