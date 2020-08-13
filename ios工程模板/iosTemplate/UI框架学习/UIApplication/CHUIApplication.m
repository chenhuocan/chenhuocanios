//
//  CHUIApplication.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHUIApplication.h"
#import <UserNotifications/UNNotificationSettings.h>

@interface CHUIApplication ()

@end

@implementation CHUIApplication

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置提醒图标
    //1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    // 2、注册用户通知
    UIUserNotificationSettings * notice = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:notice];
    //3.设置提醒值.
    app.applicationIconBadgeNumber = 10;
}

#pragma mark ----- 设置状态栏

//状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return NO;
}



#pragma mark ---- openURL 使用
- (void)openURL {
    //调用自带 浏览器safari
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"http://www.520it.com"];
    [app openURL:url options:@{@"key": @1} completionHandler:^(BOOL success) {
        if(success){
            NSLog(@"操作完");
        }
    }];
    
    
    //调用 电话phone 拨打电话时不出现确认框
  
    NSString *phone = [NSString stringWithFormat:@"tel://%@", @"800888"];
    NSURL *urlPhone = [NSURL URLWithString:phone];
    [app openURL:urlPhone options:@{} completionHandler:nil];
    //拨打电话之时弹出确认框
    NSURL *urlPhone1 = [NSURL URLWithString:@"telprompt://800888"];
    [app openURL:urlPhone1 options:@{} completionHandler:nil];

    
    
    //打开辅助功能
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=ACCESSIBILITY"] options:@{} completionHandler:nil];


    //设置飞行模式不成功，即设置界面
    [app openURL:[NSURL URLWithString:@"prefs:root=AIRPLANE_MODE"] options:@{} completionHandler:nil];

    //屏幕几分钟之后锁定设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=AUTOLOCK"] options:@{} completionHandler:nil];

    //打开Brightness不成功，设置界面
    [app openURL:[NSURL URLWithString:@"prefs:root=Brightness"] options:@{} completionHandler:nil];

    //打开蓝牙设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Bluetooth"] options:@{} completionHandler:nil];

    //设置日期与时间设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=DATE_AND_TIME"] options:@{} completionHandler:nil];

    //打开FaceTime设置
    [app openURL:[NSURL URLWithString:@"prefs:root=FACETIME"] options:@{} completionHandler:nil];
    //下面是打开通用设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General"] options:@{} completionHandler:nil];
    //打开键盘设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=Keyboard"] options:@{} completionHandler:nil];
    //打开iClound设置
    [app openURL:[NSURL URLWithString:@"prefs:root=CASTLE"] options:@{} completionHandler:nil];
    //打开iCloud下的储存空间
    [app openURL:[NSURL URLWithString:@"prefs:root=CASTLE&path=STORAGE_AND_BACKUP"] options:@{} completionHandler:nil];
    //打开通用下的语言和地区设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=INTERNATIONAL"] options:@{} completionHandler:nil];
    //打开隐私下的定位服务
    [app openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"] options:@{} completionHandler:nil];
    //打开设置下的音乐
    [app openURL:[NSURL URLWithString:@"prefs:root=MUSIC"] options:@{} completionHandler:nil];
    //打开音乐下的均衡器
    [app openURL:[NSURL URLWithString:@"prefs:root=MUSIC&path=EQ"] options:@{} completionHandler:nil];
    //打开音乐下的什么不成功
    [app openURL:[NSURL URLWithString:@"prefs:root=MUSIC&path=VolumeLimit"] options:@{} completionHandler:nil];
    //打开通用下的网络不成功
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=Network"] options:@{} completionHandler:nil];
    //打开通用下的什么不成功
    [app openURL:[NSURL URLWithString:@"prefs:root=NIKE_PLUS_IPOD"] options:@{} completionHandler:nil];
    //打开设置下的备忘录设置
    [app openURL:[NSURL URLWithString:@"prefs:root=NOTES"] options:@{} completionHandler:nil];
    //打开设置下的通知设置
    [app openURL:[NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"] options:@{} completionHandler:nil];
    //打开电话设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Phone"] options:@{} completionHandler:nil];
    //打开设置下照片和相机设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Photos"] options:@{} completionHandler:nil];
    //打开通用下的描述文件
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=ManagedConfigurationList"] options:@{} completionHandler:nil];
    //打开通用下的还原设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=Reset"] options:@{} completionHandler:nil];
    //打开设置下的safari设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Safari"] options:@{} completionHandler:nil];
    //打开siri不成功
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=Assistant"] options:@{} completionHandler:nil];
    //打开设置下的声音设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Sounds"] options:@{} completionHandler:nil];
    //打开通用下的软件更新
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"] options:@{} completionHandler:nil];
    //打开通用下的iTounes Store和App Store设置
    [app openURL:[NSURL URLWithString:@"prefs:root=STORE"] options:@{} completionHandler:nil];
    //打开设置下的twitter设置
    [app openURL:[NSURL URLWithString:@"prefs:root=TWITTER"] options:@{} completionHandler:nil];
    //打开通用下的用量
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=USAGE"] options:@{} completionHandler:nil];
    //打开通用下的vpn设置
    [app openURL:[NSURL URLWithString:@"prefs:root=General&path=VPN"] options:@{} completionHandler:nil];
    //打开设置下的墙纸设置
    [app openURL:[NSURL URLWithString:@"prefs:root=Wallpaper"] options:@{} completionHandler:nil];
    //打开wifi设置
    [app openURL:[NSURL URLWithString:@"prefs:root=WIFI"] options:@{} completionHandler:nil];
    //打开不成功
    [app openURL:[NSURL URLWithString:@"prefs:root= INTERNET_TETHERING"] options:@{} completionHandler:nil];
    
    
    //实现一个应用启动另外一个应用
    //第1步 注册自定义URL协议，设置 URL Scheme  URL Scheme 就是实现跳转URL协议的名称(可以多个)
    // 在 targets 中 info 中的URL-types 配置
    // 在info.plist上配置
    NSURL * urlStr = [NSURL URLWithString:@"test://x=100"];//后面为参数
    if ([[UIApplication sharedApplication] canOpenURL:urlStr]) {
        NSLog(@"打开APP test");
        [app openURL:urlStr options:@{} completionHandler:nil];
    }else{
      NSLog(@"不能打开APP test");

    }
}

@end
