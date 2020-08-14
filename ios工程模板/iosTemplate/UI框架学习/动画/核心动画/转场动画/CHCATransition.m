//
//  CHCATransition.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//1.什么是转场动画?
//    就是从一个场景转换到另一个场景,像导航控制器的push效果,就是一个转场.
//
//2.如何创建转场动画
//  创建转场动画
//  CATransition *anim = [CATransition animation];
//  设置转场类型
//  anim.type = @"cube";
//  anim.duration = 1;
//  设置转场的方向
//  anim.subtype = kCATransitionFromLeft;
//  设置动画的开始位置
//  anim.startProgress = 0.5;
//  设置动画的结束位置
//  anim.endProgress  =0.8;
//  添加动画.了
// [_imageV.layer addAnimation:anim forKey:nil];
//
//
// 要执行动画的代码称为转场代码.
// 转场动画要和转场代码写在同一个方法当中才有动画效果.
//
//3.UIView进行转场动画
//
//   [UIView transitionWithView:self.imageV duration:1
//    options:UIViewAnimationOptionTransitionFlipFromRight
//    animations:^{
//        转场代码
//    } completion:^(BOOL finished) {
//        动画执行完毕时调用.
//    }];
//
//    使用UIView转场的类型比较少.


#import "CHCATransition.h"

@interface CHCATransition ()

@end

@implementation CHCATransition

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

static int _i = 1;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//转场代码与转场动画必须得在同一个方法当中.
//转场代码
//    _i++;
//    if (_i == 4) {
//        _i = 1;
//    }
//
//    NSString *imageName = [NSString stringWithFormat:@"%d",_i];
//    self.imageV.image = [UIImage imageNamed:imageName];
//
//
//    //添加转场动画
//    CATransition *anim = [CATransition animation];
//    anim.duration  = 1;
//    //设置转场的类型
//    anim.type = @"pageCurl";
//
//    //设置动画的起始位置
//    anim.startProgress = 0.3;
//    //设置动画的结束位置
//    anim.endProgress = 0.5;
//
//
//
//    [self.imageV.layer addAnimation:anim forKey:nil];
    
    

    
//    [UIView transitionWithView:self.imageV duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
//
//        //转场 代码
//        _i++;
//        if (_i == 4) {
//            _i = 1;
//        }
//
//        NSString *imageName = [NSString stringWithFormat:@"%d",_i];
//        self.imageV.image = [UIImage imageNamed:imageName];
//    } completion:^(BOOL finished) {
//
//    }];

    
}


@end
