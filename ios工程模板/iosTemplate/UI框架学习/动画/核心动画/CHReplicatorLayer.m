//
//  CHReplicatorLayer.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//  复制层

#import "CHReplicatorLayer.h"

@interface CHReplicatorLayer ()

@end

@implementation CHReplicatorLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer  layer];
    //repL.frame = self.contentV.bounds;
    //[self.contentV.layer addSublayer:repL];

    repL.instanceCount = 5;
    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    //设置复制出来的子层动画的延时执行时长
    repL.instanceDelay = 1;

    //创建一个振动条
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 30, 100);
    layer.anchorPoint = CGPointMake(0, 1);
    //layer.position = CGPointMake(0, self.contentV.bounds.size.height);
    [repL addSublayer:layer];

    //添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
}

// 阴影
- (void)shadow {
    NSLog(@"%@",self.view.layer);
    CAReplicatorLayer *repL =  (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    //绕着复制层的锚点进行旋转
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    //阴影
    repL.instanceRedOffset -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceBlueOffset -= 0.1;
    repL.instanceAlphaOffset -= 0.1;
    
    
    
}

@end
