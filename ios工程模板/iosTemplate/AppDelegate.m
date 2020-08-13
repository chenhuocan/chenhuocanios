//
//  AppDelegate.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/3/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//应用程序将要失去焦点时调用
- (void)applicationWillResignActive:(UIApplication *)application {
   NSLog(@"%s",__func__);
}

//应用程序进入到后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
   NSLog(@"%s",__func__);
}

//应用程序进入到前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
  NSLog(@"%s",__func__);
}

//应用程序获取焦点
//焦点:能否与用户进行交互.
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

//当应用程序退出的时候调用
- (void)applicationWillTerminate:(UIApplication *)application {
   NSLog(@"%s",__func__);
}


//当应用程序收到内存警告时调用
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    //清理缓存.图片,视频.
    NSLog(@"%s",__func__);
}
 //接收 A 应用跳到B 应用 通过URL 传参到B应用
- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if(!url) {
        return NO;
    }
    NSString *URLString = [url absoluteString];
    NSLog(@"%@",URLString);
    // TODO 从url解析参数。
    return YES;
}


#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    NSLog(@"%s",__func__);
}

@end
