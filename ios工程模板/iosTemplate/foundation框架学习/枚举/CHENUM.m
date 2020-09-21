//
//  CHENUM.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHENUM.h"
//第一种写法
typedef enum
{
    XMGDemoTypeTop,
    XMGDemoTypeBottom,
}XMGDemoType;

//第二种枚举,定义类型
typedef NS_ENUM(NSInteger,XMGType)
{
    XMGTypeTop,
    XMGTypeBottom,
};

//第三种枚举 ,位移枚举
//一个参数可以传递多个值
//如果是位移枚举,观察第一个枚举值,如果该枚举值!=0 那么可以默认传0做参数,如果传0做参数,那么效率最高
typedef NS_OPTIONS(NSInteger, XMGActionType)
{
    XMGActionTypeTop = 1<<0,  //1*2(0) =1
    XMGActionTypeBottom = 1<<1,//1*2(1)=2
    XMGActionTypeLeft = 1<<2,//1*2(2)=4
    XMGActionTypeRight = 1<<3,//8
};
@interface CHENUM ()

@end

@implementation CHENUM

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self demo:XMGActionTypeTop | XMGActionTypeRight | XMGActionTypeLeft |XMGActionTypeBottom];
    [self demo:0];
}

//按位与 & 1&1==1 1&0==0 0&0==0 只要有0则为0
//按位或 | 1|1==1 1|0==1 0|0==0 只要有1则为1
-(void)demo:(XMGActionType)type
{
    NSLog(@"%zd",type);
    
    if (type & XMGActionTypeTop) {
        NSLog(@"向上---%zd",type & XMGActionTypeTop);
    }
    
    if (type & XMGActionTypeRight) {
        NSLog(@"向右---%zd",type & XMGActionTypeRight);
    }
    if (type & XMGActionTypeBottom) {
        NSLog(@"向下---%zd",type & XMGActionTypeBottom);
    }
    
    if (type & XMGActionTypeLeft) {
        NSLog(@"向左---%zd",type & XMGActionTypeLeft);
    }
    
}

@end
