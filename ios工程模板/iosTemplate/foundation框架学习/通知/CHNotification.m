//
//  CHNotification.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/10.
//  Copyright © 2020 陈火灿. All rights reserved.
//  通知的使用

#import "CHNotification.h"
#import "CHPerson.h"
#import "CHCompany.h"

@interface CHNotification ()

@end

@implementation CHNotification

- (void)viewDidLoad {
    [super viewDidLoad];
    CHCompany *com1 = [[CHCompany alloc] init];
    com1.name = @"陈火灿";
    
    CHCompany *com2 = [[CHCompany alloc] init];
    com2.name = @"Sina";
    
    CHPerson *p1 = [[CHPerson alloc] init];
    p1.name = @"张三";
    CHPerson *p2 = [[CHPerson alloc] init];
    p2.name = @"李四";
    CHPerson *p3 = [[CHPerson alloc] init];
    p3.name = @"王五";
    
    // 监听通知  跟Android的广播一样  name 为nil 的时候 可以接收全部的通知，如果 name 与 发送通知的name一样 那就只能接收  同一种通知
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNew:) name:nil  object:nil];

    // 发布通知
    NSNotification *note = [NSNotification notificationWithName:@"军事新闻" object:com1 userInfo:@{@"title": @"XXXXXXX"}];
    [[NSNotificationCenter defaultCenter] postNotification:note];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"军事新闻" object:com2 userInfo:@{@"title": @"XXXXXXXXYYYYYY"}];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:com1 userInfo:@{@"title": @"XXXXXXXXYYYYYY"}];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:com2 userInfo:@{@"title": @"XXXXXXXXYYYYYY"}];

    // 匿名通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"军事新闻" object:nil userInfo:@{@"title": @"XXXXXXXXYYYYYY"}];

    // 移除通知
    // [[NSNotificationCenter defaultCenter] removeObserver:p1 name:@"军事新闻" object:com1];
    [[NSNotificationCenter defaultCenter] removeObserver:p1];
}

-(void)getNew:(NSNotification *)note{
    
}

@end
