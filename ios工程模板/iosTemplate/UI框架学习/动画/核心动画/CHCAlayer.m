//
//  CHCAlayer.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//
//CALayer我们⼜又称它叫做层. 在每个UIView内部都有⼀一个layer这样⼀一个属性.
//UIView之所以能够显⽰示,就是因为它⾥里⾯面有这个⼀一个层,才具有显⽰示的功能. 我们通过操作CALayer对象,可以很⽅方便地调整UIView的⼀一些外观属性. 可以给UIView设置阴影,圆⾓角,边框等等...

//
//11.UIView与核心动画对比?
//
//1.UIView和核心动画区别?
//   核心动画只能添加到CALayer
//   核心动画一切都是假象，并不会改变真实的值。
//
//2.什么时候使用UIView的动画?
//  如果需要与用户交互就使用UIView的动画.
//  不需要与用户交互可以使用核心动画
//
//3.什么场景使用核心动画最多?
//  在转场动画中，核心动画的类型比较多
//  根据一个路径做动画，只能用核心动画（帧动画）
//  动画组：同时做多个动画




#import "CHCAlayer.h"

@interface CHCAlayer ()

@end

@implementation CHCAlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //设置阴影的颜色
    imageV.layer.shadowColor = [UIColor blueColor].CGColor;
    //设置阴影的不透明度
    imageV.layer.shadowOpacity = 1;
    imageV.layer.shadowOffset = CGSizeMake(10, 10);
    //设置阴影的模糊的半径
    imageV.layer.shadowRadius = 5;

    
    //边框宽度,往里边走的.
    imageV.layer.borderWidth = 2;
    imageV.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    
    //设置圆角
    imageV.layer.cornerRadius = 50;
    //把超过根层以外的东西都给裁剪掉(UIview自带的层,我们称它是根层)
    imageV.layer.masksToBounds = YES;
    
    NSLog(@"%@",imageV.layer.contents);
}

/// 自定义CALayer
- (void)creatCALayer {
    //⾃自定义CALayer的⽅方式创建UIView的⽅方式⾮非常相似.
    //2.关于CALayer的疑惑?
    //为什么要使⽤用CGImageRef、CGColorRef? 为了保证可移植性，QuartzCore不能使⽤用UIImage、UIColor，只能使⽤用CGImageRef、 CGColorRef
   
   // UIView和CALayer都能够显⽰示东⻄西,该怎样选择?
    //对⽐比CALayer，UIView多了⼀一个事件处理的功能。也就是说，CALayer不能处理⽤用户的触摸 事件，⽽而UIView可以
    //如果显⽰示出来的东⻄西需要跟⽤用户进⾏行交互的话，⽤用UIView; 如果不需要跟⽤用户进⾏行交互，⽤用UIView或者CALayer都可以 CALayer的性能会⾼高⼀一些，因为它少了事件处理的功能，更加轻量级
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
    
}

- (void)attributes{
    //如果让⼀一张图⽚片只显⽰示上半部分或者下半部分
        //contentsRect就是要显⽰示的范围.它是取值范围是(0~1);
        //想让上部图⽚片只显⽰示上半部分contentsRect设置CGRectMake(0, 0, 1, 0.5);
        //让下部图⽚片只显⽰示下半部分contentsRect设置为CGRectMake(0, 0.5, 1, 0.5)
    
    //让上部图⽚片绕着锚点进⾏行旋转,但是图⽚片的默认锚点在中⼼心,所以要把上部图⽚片的锚点设在 最底部.
        //修改上部分的锚点为anchorPoint = CGPointMake(0.5, 1)
        //但是修过锚点之后, 会出现⼀一个问题,就是上部分的图⽚片,会往上⾛走.导致两个图⽚片中间有⼀一个 空隙. 解决办法为.把两张图⽚片放到⼀一起.设置上部分图⽚片的锚点后.上部分图⽚片会上⾛走⼀一半的距离. 然后再设置下部图⽚片的锚点.设置上图⽚片的最上⾯面设置下部图⽚片锚点值为anchorPoint = CGPointMake(0.5, 0);
        //    这样就能够办到两张图⽚片合成⼀一张的效果
    
    //1.让上部图片只显示上半部分
    //self.topImageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    ////2.让下部图片只显示下半部分
    //self.bottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    //self.topImageV.layer.anchorPoint = CGPointMake(0.5, 1);
    //self.bottomImageV.layer.anchorPoint = CGPointMake(0.5, 0);
}

-(void)positionAndAnchorPoint{
//    NSLog(@"center = %@",NSStringFromCGPoint(self.orangeView.center));
//    NSLog(@"position = %@",NSStringFromCGPoint(self.orangeView.layer.position));
//    NSLog(@"position = %@",NSStringFromCGPoint(self.orangeView.layer.anchorPoint));
//    self.orangeView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    
//    position和anchorPoint是CAlayer的两个属性.
//    我们以前修改一个控件的位置都是能过Frame的方式进行修改.
//    现在利用CALayer的position和anchorPoint属性也能够修改控件的位置.
//    这两个属性是配合使用的.
//    position:它是用来设置当前的layer在父控件当中的位置的.
//              所以它的坐标原点.以父控件的左上角为(0.0)点.
//
//    anchorPoint:它是决点CALayer身上哪一个点会在position属性所指的位置
//               anchorPoint它是以当前的layer左上角为原点(0.0)
//               它的取值范围是0~1,它的默认在中间也就是(0.5,0.5)的位置.
//               anchorPoint又称锚点.就是把锚点定到position所指的位置.
//
//    两者结合使用.想要修改某个控件的位置,我们可以设置它的position点.
//               设置完毕后.layer身上的anchorPoint会自动定到position所在的位置.
}

// 了解3D效果
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    //3D效果
//    [UIView animateWithDuration:0.5 animations:^{
//        //self.imageV.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
//        //把结构体转成对象
//        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//
//        //通过KVC一般是做快速旋转,平移,缩放
//        [self.imageV.layer setValue:@(100) forKeyPath:@"transform.translation.x"];
//
//    }];
//
//
//}


//渐变层
- (void)gradientLayer {
    
//    CAGradientLayer *gradientL = [CAGradientLayer layer];
//    gradientL.frame = self.bottomImageV.bounds;
//    //设置渐变的颜色
//    gradientL.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor];
//    //设置渐变的方向
//    gradientL.startPoint = CGPointMake(0, 0);
//    gradientL.endPoint = CGPointMake(1, 0);
//    
//    //设置一个渐变到另一个渐变的起始位置
//    gradientL.locations = @[@0.2,@0.6];
}
@end
