//
//  CHBasicAnimation.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//
//核心动画之作用在层上面. 动画的本质是改图层的某⼀一个属性.
//CABasicAnimation *anim = [CABasicAnimation animation]; 图层有那些属性,这⾥里才能写那些属性.
//anim.keyPath = @"transform.scale";
//anim.toValue = @0.5;
//告诉动画完成的时候不要移除 anim.removedOnCompletion = NO; 保存动画最前⾯面的效果.
//anim.fillMode = kCAFillModeForwards; 把动画添加到层上⾯面.
//[_redView.layer addAnimation:anim forKey:nil];

#import "CHBasicAnimation.h"

@interface CHBasicAnimation ()

@end

@implementation CHBasicAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建动画对象(设置layer的属性值.)
     CABasicAnimation *anim = [CABasicAnimation animation];
     //2.设置属性值
     anim.keyPath = @"position.x";
     anim.toValue = @300;
     
     //动画完成时, 会自动删除动画
     anim.removedOnCompletion = NO;
     anim.fillMode = @"forwards";
     
     //3.添加动画
    // [self.redView.layer addAnimation:anim forKey:nil];
    
    
    //-------心动 动画
    //创建动画对象
//    CABasicAnimation *anim = [CABasicAnimation animation];
//
//    //设置属性值
//    anim.keyPath = @"transform.scale";
//    anim.toValue = @0;
//
//    //设置动画执行次数
//    anim.repeatCount = MAXFLOAT;
//
//    //设置动画执行时长
//    anim.duration = 3;
//
//    //自动反转(怎么样去 怎么样回来)
//    anim.autoreverses = YES;
    
 //   //添加动画
//    [self.imageV.layer addAnimation:anim forKey:nil];
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
