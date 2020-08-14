//
//  GradientAnimation.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//
//以设置动画效果的属性
//frame
//bounds
//center
//transform
//alpha
//backgroundColor
//contentStretch
#import "GradientAnimation.h"

@interface GradientAnimation ()
@property(nonatomic,weak) UILabel *label;

@end

@implementation GradientAnimation

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
      [self.view addSubview:self.label];
      [self showHubInfo:@"你们好"];
}

#pragma mark ---渐变动画  平移 缩放  旋转

/// 平移
- (void)translation {
    // 方式一
       /*
       // 1. 开始动画
       [UIView beginAnimations:nil context:nil];
       [UIView setAnimationDuration:1.0];
       
       // 2.动画代码
       CGRect frame = self.animationView.frame;
       frame.origin.y -= 50;
       self.animationView.frame = frame;
       
       // 3.提交动画
       [UIView commitAnimations];
        */
       
       // 方式二:
       /*
       [UIView animateWithDuration:2.0 animations:^{
           // 1.动画代码
           CGRect frame = self.animationView.frame;
           frame.origin.y -= 50;
           self.animationView.frame = frame;
       }];
        */
       
       /*
       [UIView animateWithDuration:1.0 animations:^{
           // 执行动画
           CGRect frame = self.animationView.frame;
           frame.origin.y -= 50;
           self.animationView.frame = frame;
       } completion:^(BOOL finished) {
          // 动画完成做什么事情
           self.animationView.backgroundColor = [UIColor blackColor];
       }];
        */
       /*
        UIViewAnimationOptionCurveEaseInOut  动画开始/结束比较缓慢,中间相对较快
        UIViewAnimationOptionCurveEaseIn     动画开始比较缓慢
        UIViewAnimationOptionCurveEaseOut    动画结束比较缓慢
        UIViewAnimationOptionCurveLinear     线性---> 匀速
        */
    
    
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = self.label.frame;
        frame.origin.y += 50;
        self.label.frame = frame;
    } completion:^(BOOL finished) {
        self.label.backgroundColor = [UIColor greenColor];
    }];
    
    
}

/// 旋转
- (void)rotation {
    
    [UIView animateWithDuration:0.5 animations:^{
        //旋转(旋转的度数, 是一个弧度)
        //self.label.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.label.transform = CGAffineTransformRotate(self.label.transform, M_PI_4);
    }];
    
}
/// 缩放
- (void)zoom {
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
         CGRect frame = self.label.frame;
         frame.size = CGSizeMake(10, 15);
         self.label.frame = frame;
     } completion:^(BOOL finished) {
         NSLog(@"动画完成");
     }];
    
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
           CGRect frame = self.label.frame;
           frame.size = CGSizeMake(10, 15);
           self.label.frame = frame;
       } completion:^(BOOL finished) {
           NSLog(@"动画完成");
       }];
}

- (void)showHubInfo:(NSString *)hubInfo
{
    // 3.1.改变指示器上面显示的文字
    self.label.text = hubInfo;
    
    // 3.2.出现动画和消失动画
    [UIView animateWithDuration:1.0 animations:^{
        self.label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.label.alpha = 0.0;
        } completion:nil];
    }];
}

/**
 *  透明度动画
 */
- (void)alpha {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.label.alpha -= 0.9;
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:2.0 animations:^{
           self.label.alpha += 0.9;
       }];
    }];
}


@end
