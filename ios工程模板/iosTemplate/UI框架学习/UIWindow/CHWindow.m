//
//  CHWindow.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHWindow.h"

@interface CHWindow ()
@property (strong, nonatomic) UIWindow *window;
@end

@implementation CHWindow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在AppDelegate.m 中使用
   
    //1.创建窗口
    self.window = [[UIWindow  alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blueColor];


    //2.一个窗口必须得有根控制器(设置窗口的根控制器)
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = vc;

    //NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
    NSLog(@"%@",self.window);
    //3.显示
    //[self.window makeKeyAndVisible];
    //NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
    NSLog(@"%@",self.window);
    NSLog(@"%@",self.window.subviews);
    self.window.hidden = NO;
    NSLog(@"%@",self.window.subviews);
    /**
    makeKeyAndVisible:
    1.设置应用程序的主窗口
    2.让窗口显示,把窗口hidden = no,显示过程当中,把窗口的根控制器的view添加到窗口上.
    [self.window addsubView:rootViewCotroller.view]
    */
           
    
    //1.创建窗口
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    //2.设置窗口的根控制器
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    self.window.rootViewController = vc;
//    //3.显示窗口
//    [self.window makeKeyAndVisible];
    
    //从ios9之后,如果添加了多个窗口,控制器它会自动把状态栏给隐藏掉.
    //解决办法,把状态栏给应用程序管理.
 

    //设置窗口层级
    //UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
    // self.window1.windowLevel = UIWindowLevelStatusBar;
    // self.window.windowLevel = UIWindowLevelAlert;
    //键盘,状态栏其实都是window
}

/*
 UIWindow是⼀一种特殊的UIView，通常在⼀一个app中⾄至少有⼀一个UIWindow
 iOS程序启动完毕后， ， ⼀一个iOS程序之所以能显⽰示到屏幕上，完全是因为它有UIWindow
 在加载info.plist,判断下是否指定main,如果指定了,就会去加载StoryBoard. 1.创建⼀一个窗⼝口
 2.加载MainStoryBoard,初始化⼀一个控制器. 3.把初始化出来的控制器设置为窗⼝口的根控制器.让窗⼝口显⽰示到屏幕上.
 如果没有指定Mian话, 那这个时候就需要我们⼿手动的去创建窗⼝口. 当info.plist⽂文件没有找到的时候,那么程序就加载完毕,那么在程序加载完毕时要⾃自⼰己⼿手动去 创建窗⼝口.
 在开发当中,通常都是⼿手动去创建窗⼝口.
 1.创建窗⼝口,要有窗⼝口显⽰示,必须要有强引⽤用.窗⼝口也是控件,要想展⽰示出来.必须得要有尺⼨寸. self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]; 2.创建控制器
 会把控制器的View添加到窗⼝口上.并且有⼀一个旋转的功能.
 UIViewController *vc = [[UIViewController alloc] init]; vc.view.backgroundColor = [UIColor redColor];
 3.设置控制器为窗⼝口的根控制器 self.window.rootViewController = vc; 4.显⽰示窗⼝口
 [self.window makeKeyAndVisible];
 [self.window makeKeyAndVisible]的底层实现: 1.让窗⼝口成为显⽰示状态. 窗⼝口默认是隐藏的.hidden = yes. 底层做的事件就是:
 self.window.hidden = NO;
 2把控制器的View添加到窗⼝口上⾯面. [self.window addSubView:rootVC.view]; 3.把当前窗⼝口设置成应⽤用程序的主窗⼝口 application.keyWindow获得应⽤用程序的主窗⼝口.
 在程序当中,状态栏和键盘,它都属性是⼀一个窗⼝口.可以通过打印的⽅方式来验证. 设置window的层级.UIWindowLevelNormal它是⼀一个CGFloat类型. self.window.windowLevel = UIWindowLevelNormal UIWindowLevelNormal < UIWindowLevelStatusBar < UIWindowLevelAlert
*/

@end
