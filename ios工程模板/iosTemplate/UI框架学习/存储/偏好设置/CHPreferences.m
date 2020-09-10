//
//  CHPreferences.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHPreferences.h"

@interface CHPreferences ()

@end

@implementation CHPreferences

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)save {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"xmg" forKey:@"name"];
    [defaults setInteger:10 forKey:@"age"];
    //立马写入到文件当中
    [defaults synchronize];
    NSLog(@"%@",NSHomeDirectory());
}

- (void)read {
    // 根据key 值获取值
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name"];
    NSInteger age = [defaults integerForKey:@"age"];
    
}

@end
