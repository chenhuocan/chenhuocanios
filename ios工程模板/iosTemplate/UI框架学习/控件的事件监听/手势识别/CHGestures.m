//
//  CHGestures.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//
//通过touches⽅方法监听view触摸事件的缺点? 1.必须得⾃自定义view,在⾃自定义的View当中去实现touches⽅方法. 2.由于是在view内部的touches⽅方法中监听触摸事件，因此默认情况下，⽆无法让其他外界对 象监听view的触摸事件 3.不容易区分⽤用户的具体⼿手势⾏行为(不容易区分是⻓长按⼿手势,还是缩放⼿手势)这些等.
//iOS 3.2之后，苹果推出了⼿手势识别功能(Gesture Recognizer在触摸事件处理⽅方⾯面⼤大⼤大简化 了开发者的开发难度
//UIGestureRecognizer⼿手势识别器 利⽤用UIGestureRecognizer，能轻松识别⽤用户在某个view上⾯面做的⼀一些常⻅见⼿手势 UIGestureRecognizer是⼀一个抽象类，定义了所有⼿手势的基本⾏行为，使⽤用它的⼦子类才能处理 具体的⼿手势

//⼿手势使⽤用⽅方法
//1.创建⼿手势 2.添加⼿手势 3.实现⼿手势⽅方法
#import "CHGestures.h"

@interface CHGestures ()<UIGestureRecognizerDelegate>
@property(nonatomic,weak) UIImageView *imageView ;
@end

@implementation CHGestures

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imageView = imageView;
    [self.view addSubview:self.imageView];
    //-----------1、创建手势-----扫
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //设置轻扫的方向(一个轻扫手势只能对应一个方向)
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //设置轻扫的方向(一个轻扫手势只能对应一个方向)
    swipe1.direction = UISwipeGestureRecognizerDirectionRight;
    
    //2.添加手势
    [self.imageView addGestureRecognizer:swipe];
    [self.imageView addGestureRecognizer:swipe1];
    
    
    //-----------1.创建手势 ----长按
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    //2.添加手势
    [self.imageView addGestureRecognizer:longP];
    // 点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tap.delegate = self;
      //2.添加手势
    [self.imageView addGestureRecognizer:tap];
    
    
    //-----------添加旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGes:)];
    rotation.delegate = self;
    [self.imageView addGestureRecognizer:rotation];
    
    //-----------添加捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    
    
    
    //-----------添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
    
}








#pragma mark -----事件监听
//当轻扫时调用 事件监听
- (void)swipe:(UISwipeGestureRecognizer *)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"left");
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"right");
    }
    //NSLog(@"%s",__func__);
}

//当长按时调用(当长按移动时,该方法会持续调用)
- (void)longP:(UILongPressGestureRecognizer *)longP{
    NSLog(@"%s",__func__);
    //判断手势的状态
    if (longP.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始长按");
    }else if(longP.state == UIGestureRecognizerStateChanged){
         NSLog(@"长按时移动");
    }else if(longP.state == UIGestureRecognizerStateEnded){
        NSLog(@"手指离开");
    }
    
}
//3.实现手势方法
- (void)tap{
    NSLog(@"%s",__func__);
}


- (void)rotationGes:(UIRotationGestureRecognizer *)rotationGes{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotationGes.rotation);
    //复位
    [rotationGes setRotation:0];

}

//当缩放时调用
- (void)pinch:(UIPinchGestureRecognizer *)pinch{
    NSLog(@"%s",__func__);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale,pinch.scale );
    //复位
    [pinch setScale:1];
}

//当拖动View时调用
- (void)pan:(UIPanGestureRecognizer *)pan {
    //获取偏移量(相对于最原始的偏移量)
    CGPoint transP = [pan translationInView:self.imageView];
    NSLog(@"%@",NSStringFromCGPoint(transP));
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x, transP.y);
    
    //让它相对于上一次
    //复位.
    [pan setTranslation:CGPointZero inView:self.imageView];
    
}

#pragma mark ----代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
//Simultaneous:同时
//是否允许同时支持多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{

    return YES;
}



@end
