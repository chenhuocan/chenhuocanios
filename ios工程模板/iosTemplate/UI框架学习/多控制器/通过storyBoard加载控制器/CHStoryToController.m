//
//  CHStoryToController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//loadView作用,用来创建控制器的View.
//什么时候调用:当控制器的View,第一次使用的时候调用.

//loadView底层原理:
//1.先判断当前控制器是不是从storyBoard当中加载的,如果是从storyBoard加载的控制器.那么它就会从storyBoard当中加载的控制器的View,设置当前控制器的view.
//2.当前控制器是不是从xib当中加载的,如果是从xib当中加载的话,把xib当中指定的View,设置为当前控制器的View.
//3.如果也不是从xib加载的,它会创建空白的view.

//一但重写了loadView方法,就说明要自己定义View.

//一般使用的场景:当控制器的View一显示时,就是一张图片,或者UIWebView.

#import "CHStoryToController.h"
#import "TwoViewController.h"
@interface CHStoryToController ()
@property (strong, nonatomic) UIWindow *window;
@end

@implementation CHStoryToController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    //2.设置窗口的根控制器
    //通过StoryBoard加载控制器.
    //2.1创建storyBoard对象
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"one" bundle:nil];
    //2.2.加载storyBoard箭头指向的控制器
    UIViewController *vc = [storyBoard instantiateInitialViewController];
    
    //2.3.加载指定的控制器
    //UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"VC"];
    self.window.rootViewController = vc;
       //3.显示窗口
    [self.window makeKeyAndVisible];
}
- (void)xibToController{
    //1.创建窗口
       self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       //2.设置窗口根控制器
       //2.1通过xib加载控制器的View
       //initWithNibName:如果指定了特定的名称的xib,会去加载指定的xib
        // TwoViewController *vc = [[TwoViewController alloc] initWithNibName:@"" bundle:nil];
        // self.window.rootViewController = vc;
        // self.window makeKeyAndVisible;
       //如果指定是nil
       
       //1.判断有没有当前控制器相同名称的xib,如果有,自动加载跟它相同名称的xib(XMGViewController.xib)
       //2.如果没有跟它相同名称的xib.自动加载跟它相同名称并且是去掉controller(XMGView.xib)
       
       
       //init底层自动调用initWithNibName.
       //XMGViewController *vc = [[XMGViewController alloc] init];
       //vc.view.backgroundColor = [UIColor redColor];
       
       
       TwoViewController *vc = [[TwoViewController alloc] init];
       self.window.rootViewController = vc;
       
       //3.显示窗口
       [self.window makeKeyAndVisible];
}

//节省内存  重写
-(void)loadView{
    
    //如果一个控件不能够接收事件,那么它里面子控件也是能不能够接收事件
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"火影"]];
    
    imageV.userInteractionEnabled = YES;
    
    self.view = imageV;

}
@end
