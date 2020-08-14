//
//  CHTransform.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHTransform.h"

@interface CHTransform ()
@property(nonatomic,weak) UILabel *label;
@end

@implementation CHTransform

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.label];
    //设置复位
    //[pan setTranslation:CGPointZero inView:self.mainV];
}

#pragma mark ------CGAffineTransformTranslate   transform 实现对空件的 平移  旋转  缩放

//平移
- (void)moveUp {

    [UIView animateWithDuration:0.5 animations:^{
        //使用Make,它是相对于最原始的位置做的形变.
        //self.imageV.transform = CGAffineTransformMakeTranslation(0, -100);
        //相对于上一次做形变.
        self.label.transform = CGAffineTransformTranslate(self.label.transform, 0, -100);
    }];
    
}

//旋转(旋转的度数, 是一个弧度)
- (void)rotation1 {
    [UIView animateWithDuration:0.5 animations:^{
        //self.imageV.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.label.transform = CGAffineTransformRotate(self.label.transform, M_PI_4);
        
    }];
    
}
//缩放
- (void)scale {
    [UIView animateWithDuration:0.5 animations:^{
        //self.imageV.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.label.transform = CGAffineTransformScale(self.label.transform, 0.8, 0.8);
    }];
    
}


@end
