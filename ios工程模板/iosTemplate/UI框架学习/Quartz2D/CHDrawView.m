//
//  CHDrawView.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHDrawView.h"

@implementation CHDrawView

/// 专门用来绘图的  什么时候调用:当View显示的时候调用
/// @param rect:当View的bounds
- (void)drawRect:(CGRect)rect{
    //1.在drawRect方法当中系统已经帮你创建一个跟View相关联的上下文.(Layer上下文)
    //只要获取上下文就行了.
}

@end
