//
//  Timer.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "Timer.h"

@interface Timer ()
@property (nonatomic,weak) NSTimer *timer;
@end

@implementation Timer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 线程
// 主线程:程序一启动,系统会默认创建一条线程.
// 主线程作用:显示刷新UI界面,处理与用用户的交互事件
// 多线程的原理: 1s --->  1万个0.0001s
#pragma mark ---定时器相关代码

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:@"123" repeats:YES];
    // NSDefaultRunLoopMode(默认): 同一时间只能执行一个任务
    // NSRunLoopCommonModes(公用): 可以分配一定的时间执行其他任务
    // 作用:修改timer在runLoop中的模式为NSRunLoopCommonModes
    // 目的:不管主线程在做什么操作,都会分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    [self.timer invalidate];
}


- (void)nextPage:(NSTimer *)timer{
 
}
@end
