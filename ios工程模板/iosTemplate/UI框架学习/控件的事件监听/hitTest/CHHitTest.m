//
//  CHHitTest.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//



// hitTest 的调用顺序
//touch -> UIApplication -> UIWindow -> UIViewController.view -> subViews -> ....-> 合适的view

// --------------------------------------------------

// 事件的传递顺序 事件传递顺序与hitTest 的调用顺序 恰好相反
//view -> superView ...- > UIViewController.view -> UIViewController -> UIWindow -> UIApplication -> 事件丢弃
//1、 首先由 view 来尝试处理事件，如果他处理不了，事件将被传递到他的父视图superview
//
//2、superview 也尝试来处理事件，如果他处理不了，继续传递他的父视图
//UIViewcontroller.view
//
//3、UIViewController.view尝试来处理该事件，如果处理不了，将把该事件传递给UIViewController
//
//4、UIViewController尝试处理该事件，如果处理不了，将把该事件传递给主窗口Window
//
//5、主窗口Window尝试来处理该事件，如果处理不了，将传递给应用单例Application
//
//6、如果Application也处理不了，则该事件将会被丢弃
#import "CHHitTest.h"

@interface CHHitTest ()

@end

@implementation CHHitTest
 //是UIView 里面的一个方法，该方法的作用 在于 : 在视图的层次结构中寻找一个最适合的 view 来响应触摸事件。
//该方法会被系统调用，调用的时候，如果返回为nil，即事件有可能被丢弃，否则返回最合适的view 来响应事件。
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
    //point       : 在接收器的局部坐标系(界)中指定的点。
    //event       : 系统保证调用此方法的事件。如果从事件处理代码外部调用此方法，则可以指定nil。
    //returnValue :视图对象是当前视图和包含点的最远的后代。如果点完全位于接收方的视图层次结构之外，则返回nil。
}


///  应用
//底部⼀一个按钮, 按钮的上⾯面有⼀一个View,遮挡在按钮的上⾯面.
//点击View时, View接收事件,当发现点击的点在按钮的位置时, 让底部的按钮处理事件.
//实现View的touchBegain⽅方法,先监听UIView的点击.
//并去实现UIView的HitTest⽅方法, 在hitTest⽅方法当中通过把当前点转换成按钮所在的坐标系 CGPoint btnP = [self convertPoint:point toView:self.btn]; 转换过后查看当前点在不在按钮上,如果在按钮上,就直接返回按钮. 如果有在按钮上,保持系统默认做法.
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//
//    //拿到后面的按钮
//    //当点在按钮上的时候,才返回按钮,如果不在按钮上.保持系统默认做法
//
//    //判断点在不在按钮身上
//    //把当前的点转换到按钮身上的坐标系的点
//    CGPoint btnP = [self convertPoint:point toView:self.btn];
//
//    if ([self.btn pointInside:btnP withEvent:event]) {
//        return self.btn;
//    }else{
//        return [super hitTest:point withEvent:event];
//    }
//
//}

@end
