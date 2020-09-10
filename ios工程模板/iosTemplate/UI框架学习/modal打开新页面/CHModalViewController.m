//
//  CHModalViewController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHModalViewController.h"

@interface CHModalViewController ()

@end

@implementation CHModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)modal{
    //当在modal时,会把窗口上面的View给移除,然后要modal控制器的view,给添加到窗口上.
    //如果当一个控制器被销毁,那么它View的业务逻辑是没有办法处理.
    //控制器被销毁,控制器的View不一定被销毁(只要有强指针指向它,就不会被销毁);
    [self presentViewController:self animated:YES completion:^{
        NSLog(@"modal completion");
        NSLog(@"%@",[UIApplication sharedApplication].keyWindow.rootViewController);
        NSLog(@"%@",self.presentedViewController);
    }];
    
    
    //使用动画实现modal
    //    CGRect frame = twoVC.view.frame;
    //    frame.origin.y = [UIScreen mainScreen].bounds.size.height;
    //    twoVC.view.frame = frame;
    //    [[UIApplication sharedApplication].keyWindow addSubview:twoVC.view];
    //
    //    self.twoVC = twoVC;
    //
    //    [UIView animateWithDuration:0.5 animations:^{
    //
    //        twoVC.view.frame = self.view.frame;
    //
    //    }completion:^(BOOL finished) {
    //        [self.view removeFromSuperview];
    //    }];
}

- (void)dismissModal{
    [self dismissViewControllerAnimated:YES completion:^{
        //关闭完处理的事情
    }];
}
@end
