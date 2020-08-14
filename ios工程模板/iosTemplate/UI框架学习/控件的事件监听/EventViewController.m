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



//如何监听UIView的触摸事件?
//想要监听UIViiew的触摸事件,⾸首先第⼀一步要⾃自定义UIView, 因为只有实现了UIResponder的事件⽅方法才能够监听事件.
//UIView的触摸事件主要有: ⼀一根或者多根⼿手指开始触摸view，系统会⾃自动调⽤用view的下⾯面⽅方法. - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//⼀一根或者多根⼿手指在view上移动时，系统会⾃自动调⽤用view的下⾯面⽅方法 (随着⼿手指的移动，会持续调⽤用该⽅方法,也就是说这个⽅方法会调⽤用很多次)
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//⼀一根或者多根⼿手指离开view，系统会⾃自动调⽤用view的下⾯面⽅方法
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

//-------------------------------------------------------------------------------------------


//事件的产⽣生与传递 ----事件是怎么样产⽣生与传递的?
/*
当发生一个触摸事件后,系统会将该事件加⼊入到一个由UIApplication管理的事件队列中.
UIApplication会从事件队列中取出最前⾯面的事件，交给主窗口。
主窗口会在视图层次结构中找到一个最合适的视图来处理触摸事件 触摸事件的传递是从父控件传递到子控件的.
如果一个父控件不能接收事件,那么它里面的了子控件也不能够接收事件.
 

 //1.当一个控件如果它的父控件不能够接收事件,那么它里面子控件也是不能接收事件的
 //2.当一个控件隐藏的时候,它里面的子控件也跟着隐藏
 //3.当一个控件透明的时候,它里面的子控件也跟着透明
 */

// 一个控件什么情况下不能够接收事件?
/*
1.不接收⽤用户交互时不能够处理事件
userInteractionEnabled = NO
2.当一个控件隐藏的时候不能够接收事件 Hidden = YES的时候
3.当一个控件为透明⽩白时候也不能够接收事件 注意:UIImageView的userInteractionEnabled默认就是NO， 因此UIImageView以及它的⼦子控件默认是不能接收触摸事件的
 */


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
