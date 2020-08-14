//
//  CHWindow.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHWindow1.h"

@implementation CHWindow1

//常见的视图不响应事件不外乎如下几种情况
//1、view.userInteractionEnabled = NO;
//2、view.hidden = YES;
//3、view.alpha < 0.05
//4、view 超出 superview 的 bounds
// hitTest的实现思路
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    // 如果交互未打开，或者透明度小于0.05 或者 视图被隐藏   //1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO || self.alpha < 0.05 || self.hidden == YES){
        return nil;
    }
    // 如果 touch 的point 在 self 的bounds 内
    //3.从后往前遍历自己的子控件.让子控件重复前两步操作,(把事件传递给,让子控件调用hitTest)
    if ([self pointInside:point withEvent:event]){
        for (UIView *subView in self.subviews){
            //进行坐标转化
            CGPoint coverPoint = [subView convertPoint:point fromView:self];
           // 调用子视图的 hitTest 重复上面的步骤。找到了，返回hitTest view ,没找到返回有自身处理
            UIView *hitTestView = [subView hitTest:coverPoint withEvent:event];

            if (hitTestView){
                return hitTestView;
            }
        }
        //4.没有找到比它自己更适合的View.那么它自己就是最适合的View
        return self;
    }
    return nil;

}

//步骤文字说明
//
//1、首先在当前视图的hitTest方法中调用pointInside方法判断触摸点是否在当前视图内
//
//2、若pointInside方法返回NO，说明触摸点不在当前视图内，则当前视图的hitTest返回nil，该视图不处理该事件
//
//3、若pointInside方法返回YES，说明触摸点在当前视图内，则从最上层的子视图开始（即从subviews数组的末尾向前遍历），遍历当前视图的所有子视图，调用子视图的hitTest方法重复步骤1-3
//
//4、直到有子视图的hitTest方法返回非空对象或者全部子视图遍历完毕
//
//5、若第一次有子视图的hitTest方法返回非空对象，则当前视图的hitTest方法就返回此对象，处理结束
//
//6、若所有子视图的hitTest方法都返回nil，则当前视图的hitTest方法返回当前视图本身，最终由该对象处理触摸事件


//作用:判断当前点在不在它调用View,(谁调用pointInside,这个View就是谁)
//什么时候调用:它是在hitTest方法当中调用的.
//注意:point点必须得要跟它方法调用者在同一个坐标系里面
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return YES;
}

@end
