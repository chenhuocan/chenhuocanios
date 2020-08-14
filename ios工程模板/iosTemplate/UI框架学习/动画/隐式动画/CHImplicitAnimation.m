//
//  CHImplicitAnimation.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//  隐式动画
//什么是隐式动画? 了解什么是隐式动画前,要先了解是什么根层和⾮非根层.
//根层:UIView内部自动关联着的那个layer我们称它是根层. 非根层:自己手动创建的层,称为非根层.
//隐式动画就是当对⾮非根层的部分属性进行修改时, 它会⾃自动的产⽣生一些动画的效果. 我们称这个默认产生的动画为隐式动画.
//如何取消隐式动画? ⾸首先要了解动画底层是怎么做的.动画的底层是包装成一个事务来进行的.
//什么是事务? 很多操作绑定在⼀起,当这些操作执⾏行完毕后,才去执行下一个操作.
//开启事务
//[CATransaction begin];
//设置事务没有动画
//[CATransaction setDisableActions:YES];
//设置动画执⾏行的时⻓长
//[CATransaction setAnimationDuration:2];
//提交事务
//[CATransaction commit];

#import "CHImplicitAnimation.h"

@interface CHImplicitAnimation ()
/** <#注释#> */
@property (nonatomic, weak)  CALayer *layer;
@property (weak, nonatomic) UIView *redView;
@end

@implementation CHImplicitAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // 非根层:自己手动创建的层,称为非根层.隐式动画就是当对⾮非根层的部分属性进行修改时, 它会⾃自动的产⽣生一些动画的效果.
    // 非根层才有隐式动画
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //只有非根层才有隐式动画,(自己手动创建的图片)
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:5];
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    [CATransaction commit];
    
    self.layer.bounds = CGRectMake(0, 0, 90, 90);
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    self.layer.position = CGPointMake(100, 400);
    
    
    self.redView.layer.position = CGPointMake(300, 400);
    self.redView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.redView.layer.backgroundColor = [UIColor greenColor].CGColor;
    
}


@end
