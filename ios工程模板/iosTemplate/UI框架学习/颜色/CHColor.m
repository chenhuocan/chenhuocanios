//
//  CHColor.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHColor.h"

@interface CHColor ()

@end

@implementation CHColor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //如果一个控件是透明的,那么,它是不能够接收事件.
    self.view.alpha = 0;
       
    //开始创建的控制器的颜色是透明的
    self.view.backgroundColor = [UIColor clearColor];
}



@end
