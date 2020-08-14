//
//  CHFrameAnimation.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.

//1.帧动画介绍:
//    CAKeyframeAnimation它可以在多个值之间进行动画.
//    设置多值之间的属性为:
//    后面是一个数组,就是要设置的多个值.
//    anim.values = @[];
//    
//    它还可以根据一个路径做动画.
//    anim.path = 自己创建的路径.
//
//2.图片抖动思路:
//    其实就是做一个左右旋转的动画.先让它往左边旋转-5,再往右边旋转5度,再从5度旋转到-5度.
//    就会有左右摇摆的效果了.
//    
//    具体实现代码
//    创建帧动画
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    设置动画属性为旋转
//    anim.keyPath = @"transform.rotation";
//    设置属性值为多个属性
//    anim.values = @[@(angle2radio(-5)),@(angle2radio(5)),@(angle2radio(-5))];
//    设置动画执行次数
//    anim.repeatCount = MAXFLOAT;
//    添加动画
//    [_imageView.layer addAnimation:anim forKey:nil];
//
//3.根据圆形的路径做移动的效果.
//    创建路径
//    UIBezierPath *path = [UIBezierPath
//                          bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
//   [path addLineToPoint:CGPointMake(200, 500)];
//   
//   把路径设为动画的属性
//   anim.path = path.CGPath;


#import "CHFrameAnimation.h"
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)
@interface CHFrameAnimation ()

@end

@implementation CHFrameAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建动画对象
    //    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    //
    //    anim.duration = 2;
    //
    //    UIBezierPath *path = [UIBezierPath bezierPath];
    //    [path moveToPoint:CGPointMake(50, 50)];
    //    [path addLineToPoint:CGPointMake(300, 50)];
    //    [path addLineToPoint:CGPointMake(300, 400)];
    //
    //
    //    anim.keyPath =  @"position";
    //    anim.path = path.CGPath;
    //
    //
    //    [self.imageV.layer addAnimation:anim forKey:nil];
}


//图标抖动
- (void)icon {
    
    //1.创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //2.设置属性值
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angle2Rad(-3)),@(angle2Rad(3)),@(angle2Rad(-3))];
    
    //3.设置动画执行次数
    anim.repeatCount =  MAXFLOAT;
    
    anim.duration = 0.5;
    
    //anim.autoreverses = YES;
    
    
//    [self.imageV.layer addAnimation:anim forKey:nil];

    
}

@end
