//
//  ViewController.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/3/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个NSNumber对象
    NSNumber * data = [NSNumber numberWithBool:0];
    //初始化NSNumber对象
    NSNumber * data1 =  [[NSNumber alloc] initWithBool:0];
    NSUInteger aa =  data.intValue;

    NSUUID * id =  [NSUUID UUID];
    
}


@end
