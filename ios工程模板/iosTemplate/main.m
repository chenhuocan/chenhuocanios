//
//  main.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/3/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
    // 第三个参数:UIApplication类名或者⼦子类的名称 nil == @"UIApplication"
    //第四个参数:UIApplication的代理的代理名称 NSStringFromClass:把类名转化字符串
    //  NSStringFromClass好处:1.有提⽰示功能 2.避免输⼊入错误
        
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

// 启动原理 掌握
//程序完整启动流程
// 1.执⾏行Main
// 2.执⾏行UIApplicationMain函数.
// 3.创建UIApplication对象,并设置UIApplicationMain对象的代理.
//UIApplication的第三个参数就是UIApplication的名称,如果指定为nil,它会默认 为UIApplication.
//UIApplication的第四个参数为UIApplication的代理.
//4.开启⼀一个主运⾏行循环.保证应⽤用程序不退出.
//5.加载info.plist.加载配置⽂文件.判断⼀一下info.plist⽂文件当中有没有Main storyboard file base name
//⾥面有没有指定storyboard⽂文件,如果有就去加载info.plist⽂文件,如果没有,那么应 ⽤用程序加载完毕.



/*
   1.执行main函数.
   2.执行UIApplicationMain,创建UIApplication对象,并设置UIApplication它的代理.
   3.开启了一个事件循环.(主运行循环,死循环:保证应用程序不退出)
   4.去加载info.plist.(判断info.plist当中有没有Mian,如果有,加载Mian.storyBoard)
   5.应用程序启动完毕.(通知代理应用程序启动完毕)
*/
