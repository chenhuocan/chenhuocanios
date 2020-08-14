//
//  CHTouches.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//  拖拽功能

#import "CHTouches.h"

@implementation CHTouches


//当开始触摸屏幕的时候调用
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}
//触摸时开始移动时调用(移动时会持续调用)
//NSSet:无序
//NSArray:有序
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    
    //做UIView拖拽  实现拖拽功能
    UITouch *touch = [touches anyObject];
    //求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    NSLog(@"curP====%@",NSStringFromCGPoint(curP));
    NSLog(@"preP====%@",NSStringFromCGPoint(preP));
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    //平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}
//当手指离开屏幕时调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}
//当发生系统事件时就会调用该方法(电话打入,自动关机)
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
