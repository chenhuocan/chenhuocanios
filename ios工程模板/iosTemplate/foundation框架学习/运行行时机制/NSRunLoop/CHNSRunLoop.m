//
//  CHNSRunLoop.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHNSRunLoop.h"

@interface CHNSRunLoop ()

@end

@implementation CHNSRunLoop

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.获得主线程对应的runloop
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    
    //2.获得当前线程对应的runLoop
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    
    NSLog(@"%p---%p",mainRunLoop,currentRunLoop);
    //NSLog(@"%@",mainRunLoop);
    
    //Core
    NSLog(@"%p",CFRunLoopGetMain());
    NSLog(@"%p",CFRunLoopGetCurrent());
    
    NSLog(@"%p",mainRunLoop.getCFRunLoop);
    
    //Runloop和线程的关系
    //一一对应,主线程的runloop已经创建,但是子线程的需要手动创建
    [[[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil] start];
}

//在runloop中有多个运行模式,但是runloop只能选择一种模式运行
//mode里面至少要有一个timer或者是source
-(void)run{
    //如何创建子线程对应的runLoop,currentRunLoop懒加载的
    NSLog(@"%@",[NSRunLoop currentRunLoop]);
    NSLog(@"run---%@",[NSThread currentThread]);
}

#pragma 相关类
-(void)timer1{
    //1.创建定时器
   NSTimer *timer =  [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //2.添加定时器到runLoop中,指定runloop的运行模式为NSDefaultRunLoopMode
    /*
     第一个参数:定时器
     第二个参数:runloop的运行模式
     */
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //UITrackingRunLoopMode:界面追踪
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];

//    NSRunLoopCommonModes = NSDefaultRunLoopMode + UITrackingRunLoopMode
    //占用,标签,凡是添加到NSRunLoopCommonModes中的事件爱你都会被同时添加到打上commmon标签的运行模式上
    /*
     0 : <CFString 0x10af41270 [0x10a0457b0]>{contents = "UITrackingRunLoopMode"}
     2 : <CFString 0x10a065b60 [0x10a0457b0]>{contents = "kCFRunLoopDefaultMode"
     */
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)timer2{
    NSRunLoop *currentRunloop = [NSRunLoop currentRunLoop];
    
    //该方法内部自动添加到runloop中,并且设置运行模式为默认
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    //开启runloop
    [currentRunloop run];
}



@end
