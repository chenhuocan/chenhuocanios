//
//  CHRootViewController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//
//04- 导航控制器管理原则
//
//程序一进入时,就要让窗口的根控制器是一个导航控制器.
//1.新建窗口
//2.创建导航控制器.并设置导航控制器的根控制器
//3.把导航控制器设为窗口的根控制器.
//4.显示窗口.
//
//
//说明:1.当设置导航控制器的根控制器时,也就是initWithRootViewController,
//      它底层其实是调用了导航控制器的push方法.把该控制器添加为导航控制器的子控制器.
//      并且它会把该控制器的View添加到导航控制器专门存放子控制器的View上面.
//    2.把导航控制器设为窗口的根控制器时,它就会把导航控制器的View添加到窗口的View上面.
//      所以程序一运行时, 我们看到的就是一个导航控制器的View.
//      导航控制器的View内部默认有两个子view.一个是导航条, 一个是转专存放子控制器的View.
//      现在专门存放子控制器的View里面存放的就是导航控制器根控制器的View.
//
//导航控制器的子控制器都是存放到一个栈中.也就是一个数组当中.
//
//当调用导航控制器的push方法时, 就会把一个控制器压入到导航控制器的栈中.
//压入栈中是, 那么刚压入栈中的这个导航控制器就在栈的最顶部.
//它就会把原来导航控制器View当中存放的子控制器View的内容移除,
//然后把导航控制器栈顶控制器的View添加到导航控制器专门存放子控制器View当中.
//注意:只是把控制器的View从导航控制器存放子控制器的View当中移除,并没有把控制器从栈中移除.所以上一个控制器还在.
//
//当调用pop当方法时, 就会把导航控制器存放子控制器View当中控制器的View移除,并且会把该控制器从栈里面移除.
//此时该控制器就会被销毁.接着它就会把上一个控制器的View添加到导航控制器专门存放子控制器的View当中.
//

//1.凡是在导航条下面的scrollView.默认会设置偏移量.UIEdgeInsetsMake(64, 0, 0, 0)
    
    
    

#import "CHRootViewController.h"

@interface CHRootViewController ()

@end

@implementation CHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置导航条的内容
    //由栈顶控制器来决定
    //设置标题
    self.navigationItem.title = @"根控制器";
    //设置标题视图
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
      //设置左侧标题
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:0 target:self action:@selector(leftClick)];
        
        
         //设置右侧图片
    UIImage *image = [UIImage imageNamed:@"navigationbar_friendsearch"];
    UIImage *oriImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:oriImage style:0 target:self action:@selector(rightClick)];
        
    //
    //
    //    //设置右侧是一个自定义的View(位置不需要自己决定,但是大小是要自己决定)
    //    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    //    //让按钮自适应大小
    //    [btn sizeToFit];
    //
    //    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    //
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)rightClick{
  NSLog(@"%s",__func__);
    // 跳转到 跳转到第二个控制器
    [self.navigationController pushViewController:self animated:YES];
}

/// 返回到上一个页面
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

/// 返回到指定的控制器
- (void)popToVc{
    [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
}
//回到根控制器
- (void) backRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
