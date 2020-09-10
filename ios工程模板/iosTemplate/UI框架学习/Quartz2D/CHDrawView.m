//
//  CHDrawView.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/7.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHDrawView.h"

@implementation CHDrawView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
    [self setNeedsDisplay];
}


/// 专门用来绘图的  什么时候调用:当View显示的时候调用
/// rect:当View的bounds
- (void)drawRect:(CGRect)rect{

 
    [self drawLine];
    [self drawCurveLine];
    [self drawRect];
    [self drawArc:rect];
}

//画直线
- (void)drawLine{
    //1.获取上下文(获取,创建上下文 都 以uigraphics开头)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    //2.2 添加一根线到终点
    [path addLineToPoint:CGPointMake(250, 50)];
    
    //画第二条线
    //    [path moveToPoint:CGPointMake(100, 280)];
    //    [path addLineToPoint:CGPointMake(250, 100)];
    
    //addLineToPoint:把上一条线的终点当作是下一条线的起点
    [path addLineToPoint:CGPointMake(200, 280)];
    
    //上下文的状态
    //设置线的宽度
    CGContextSetLineWidth(ctx, 10);
    //设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //设置线的顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    //设置颜色
    [[UIColor redColor] set];
    
    
    
    //3.把绘制的内容添加到上下文当中.
    //UIBezierPath:UIKit框架 ->    CGPathRef:CoreGraphics框架
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容显示到View上(渲染到View的layer)(stroke fill)
    CGContextStrokePath(ctx);

}
// 画曲线
- (void)drawCurveLine{
      //1.在drawRect方法当中系统已经帮你创建一个跟View相关联的上下文.(Layer上下文)
     //只要获取上下文就行了.
     CGContextRef ctx =   UIGraphicsGetCurrentContext();
     //2.描述路径
     UIBezierPath *path = [UIBezierPath bezierPath];
     //画曲线
     //2.1设置起点
     [path moveToPoint:CGPointMake(50, 280)];
      //2.2添加一根曲线到某一个点
     [path addQuadCurveToPoint:CGPointMake(250, 280) controlPoint:CGPointMake(250, 200)];
     //3.把路径添加到上下文
     CGContextAddPath(ctx, path.CGPath);
     //4.把上下文的内容渲染View上
     CGContextStrokePath(ctx);

}

//画矩形
- (void)drawRect{
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    //画矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    //圆角矩形
    //cornerRadius:圆角半径
    //UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    
    [[UIColor yellowColor] set];
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容渲染View上
    //CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
}

- (void)drawArc:(CGRect)rect {
   
    //使用UIBezierPath提供的绘图方法进行绘制
    //画椭圆
    //UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];

    //[[UIColor redColor] set];
    //[path stroke];


    //画弧
    //Center:弧所在的圆心
    //radius:圆的半径
    //startAngle:开始角度
    //endAngle:截至角度
    //clockwise: YES:顺时针 NO:逆时针

    NSLog(@"%@",NSStringFromCGPoint(self.center));

    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    //不能直接会用self.center ,是因为self.center坐标是相对于它的父控件.
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];

    //添加一根线到圆心
    [path addLineToPoint:center];

    //关闭路径closePath:从路径终点连接一根线到路径的起点
    //[path closePath];

    [[UIColor redColor] set];

    //画扇形
    //fill(填充之前,会自动关闭路径)
    [path fill];
}

- (void)drawEllipse{
   
    //使用UIBezierPath提供的绘图方法进行绘制
    //画椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, 200-10, 100)];
    path.lineWidth = 1;
    [path stroke];
    [path fill];

}

//生成一个随机的颜色
- (UIColor *)randomColor {
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
   return  [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// 画饼图
- (void)drawPie{
    //画第一个扇形
    CGPoint center =  CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat radius = self.bounds.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 25 / 100.0 * M_PI * 2;
    CGFloat endA = startA + angle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    [[self randomColor] set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
    //画第二个扇形
    
    startA = endA;
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [[self randomColor] set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
    
    startA = endA;
    angle = 50 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [[self randomColor] set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
    
    
//    NSArray *dataArray = @[@25,@25,@50];
//     CGPoint center =  CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
//     CGFloat radius = self.bounds.size.width * 0.5 - 10;
//     CGFloat startA = 0;
//     CGFloat angle = 0;
//     CGFloat endA = 0;
//
//     for (NSNumber *num in dataArray) {
//
//         startA = endA;
//         angle = num.intValue / 100.0 * M_PI * 2;
//         endA = startA + angle;
//         UIBezierPath  *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
//         [[self randomColor] set];
//         //添加一根线到圆心
//         [path addLineToPoint:center];
//         [path fill];
//     }

}

@end
