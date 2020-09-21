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

//画文字
- (void)drawText{
    
    NSString  *str = @"火灿哥火灿哥火灿哥火灿哥火灿哥火灿哥";
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //设置颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    //设置描边
    dict[NSStrokeColorAttributeName] = [UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @2;
    //设置阴影
    NSShadow *shaw = [[NSShadow alloc] init];
    shaw.shadowColor = [UIColor blueColor];
    //设置阴影的偏移量
    shaw.shadowOffset = CGSizeMake(1, 1);
    shaw.shadowBlurRadius = 2;
    dict[NSShadowAttributeName] = shaw;
    
    
    [str drawAtPoint:CGPointZero withAttributes:dict];
    //[str drawInRect:rect withAttributes:dict];
    //用drawInRect:rect会自动换行.用drawAtPoint不会自动换行.
    
}

//画图片
- (void)drawImage:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"001"];
    //drawAtPoint绘制的是原始图片的大小
    //[image drawAtPoint:CGPointZero];

    //把要绘制的图片给填充到给定的区域当中. 方式1
    [image drawInRect:rect];



    //裁剪(超过裁剪区域以久的内容,都会被自动裁剪掉)
    //设置裁剪区域一定要在绘制之前进行设置 方式2
    //UIRectClip(CGRectMake(0, 0, 50, 50));

    //平铺 方式4
    //[image drawAsPatternInRect:self.bounds];


    UIRectFill(CGRectMake(50, 50, 50, 50));
}
// 上下文
-(void)demo{
 //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addLineToPoint:CGPointMake(280, 150)];
    
    //3.把路径添加到上下文当中.
    CGContextAddPath(ctx, path.CGPath);
    
    //保存当前上下文的状态
    CGContextSaveGState(ctx);
    
    //设置上下文的状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    CGContextSaveGState(ctx);

    
    //4.把上下文当中的内容渲染View
    CGContextStrokePath(ctx);
    

    
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150, 20)];
    [path2 addLineToPoint:CGPointMake(150, 280)];
    //把路径添加到上下文当中.
    CGContextAddPath(ctx, path2.CGPath);
    
//    CGContextSetLineWidth(ctx, 1);
//    [[UIColor blackColor] set];
    //从上下文状态栈当中恢复上下文的状态
    CGContextRestoreGState(ctx);
     CGContextRestoreGState(ctx);
    
    //把上下文当中的内容渲染View
    CGContextStrokePath(ctx);
        
}

- (void)matrix{
      
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 50)];
  
  //平移操作
  CGContextTranslateCTM(ctx, 100, 100);
  //旋转
  CGContextRotateCTM(ctx, M_PI_4);
  //缩放
  CGContextScaleCTM(ctx, 1.5, 1.5);
  

  CGContextAddPath(ctx, path.CGPath);
  
  [[UIColor redColor] set];
  CGContextFillPath(ctx);
}
-(void)watermark{
    //0.加载图片
     UIImage *image = [UIImage imageNamed:@"阿狸头像"];
     //1.开启一个跟图片原始大小的上下文
     //opaque:不透明度
     UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
     //2.把图片绘制到上下文当中
     [image drawAtPoint:CGPointZero];
     //3.把文字绘制到上下文当中
     NSString *str = @"小码哥";
     [str drawAtPoint:CGPointMake(10, 20) withAttributes:nil];
     //4.从上下文当中生成一张图片.(把上下文当中绘制的所有内容,生成一张图片)
     UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
     //5.关闭上下文.
     UIGraphicsEndImageContext();
     
//     self.imageV.image = newImage;
}

-(void)circularImageCropping{
    //0.加载图片
     UIImage *image = [UIImage imageNamed:@"阿狸头像"];
     //1.开启跟原始图片一样大小的上下文
     UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
     //2.设置一个圆形裁剪区域
     //2.1绘制一个圆形
     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
     //2.2.把圆形的路径设置成裁剪区域
     [path addClip];//超过裁剪区域以外的内容都给裁剪掉
     //3.把图片绘制到上下文当中(超过裁剪区域以外的内容都给裁剪掉)
     [image drawAtPoint:CGPointZero];
     //4.从上下文当中取出图片
     UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
     //5.关闭上下文
     UIGraphicsEndImageContext();
     
     
//     self.imageV.image = newImage;
}

-(void)screenshots{
    //把控制器的View生成一张图片
   
   //1.开启一个位图上下文(跟当前控制器View一样大小的尺寸)
    //用的时候在把它打开
//   UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
   
   //把把控制器的View绘制到上下文当中.
   //2.想要把UIView上面的东西给绘制到上下文当中,必须得要使用渲染的方式.
   CGContextRef ctx = UIGraphicsGetCurrentContext();
//用的时候在把它打开
//   [self.view.layer renderInContext:ctx];
   //[self.view.layer drawInContext:ctx];
   
   //3.从上下文当中生成一张图片
   UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
   
   //4.关闭上下文
   UIGraphicsEndImageContext();

   //把生成的图片写入到桌面(文件方式进行传输:二进制流NSData)
   //把图片转成二进制流NSData
   //NSData *data = UIImageJPEGRepresentation(newImage, 1);
    NSData *data = UIImagePNGRepresentation(newImage);
   [data writeToFile:@"/Users/chenhuocan/Desktop/newImage.png" atomically:YES];
}
// 根据手势截图显示在界面
- (void)pan {
    
//    //判断手势的状态
//    CGPoint curP = [pan locationInView:self.imageV];
//    if(pan.state == UIGestureRecognizerStateBegan) {
//        self.startP = curP;
//    } else if(pan.state == UIGestureRecognizerStateChanged) {
//
//        CGFloat x = self.startP.x;
//        CGFloat y = self.startP.y;
//        CGFloat w = curP.x - self.startP.x;
//        CGFloat h = curP.y - self.startP.y;
//        CGRect rect =  CGRectMake(x, y, w, h);
//
//        //添加一个UIView
//        self.coverV.frame = rect;
//
//    } else if (pan.state == UIGestureRecognizerStateEnded) {
//
//
//        //把超过coverV的frame以外的内容裁剪掉
//        //生成了一张图片,把原来的图片给替换掉.
//        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
//
//        //把ImageV绘制到上下文之前,设置一个裁剪区域
//        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverV.frame];
//        [clipPath addClip];
//
//
//
//        //把当前的ImageView渲染到上下文当中
//        CGContextRef ctx =  UIGraphicsGetCurrentContext();
//        [self.imageV.layer renderInContext:ctx];
//        //.从上下文当中生成 一张图片
//        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//        //关闭上下文
//        UIGraphicsEndImageContext();
//        self.imageV.image = newImage;
//

        
    }
    
//擦掉图片：一张为背景图，一张为前景图，通过手势，擦除前景图，然后生成一张图片显示在前景图
//- (void)pan:(UIGestureRecognizer *)pan {
//
//    //获取当前手指的点
//    CGPoint curP =  [pan locationInView:self.imageV];
//
//    //确定擦除区域
//    CGFloat rectWH = 30;
//    CGFloat x = curP.x - rectWH * 0.5;
//    CGFloat y = curP.y - rectWH * 0.5;
//    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
//
//    //生成一张带有透明擦除区域的图片
//
//    //1.开启图片上下文
//    UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
//
//    //2.把UIImageV内容渲染到当前的上下文当中
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [self.imageV.layer renderInContext:ctx];
//
//    //3.擦除上下文当中的指定的区域
//    CGContextClearRect(ctx, rect);
//
//    //4.从上下文当中取出图片
//    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
//
//    //替换之前ImageView的图片
//    self.imageV.image = newImage;
//
//}
@end


/*
字符属性

字符属性可以应用于 attributed string 的文本中。

NSString *const NSFontAttributeName;(字体)

NSString *const NSParagraphStyleAttributeName;(段落)

NSString *const NSForegroundColorAttributeName;(字体颜色)

NSString *const NSBackgroundColorAttributeName;(字体背景色)

NSString *const NSLigatureAttributeName;(连字符)

NSString *const NSKernAttributeName;(字间距)

NSString *const NSStrikethroughStyleAttributeName;(删除线)

NSString *const NSUnderlineStyleAttributeName;(下划线)

NSString *const NSStrokeColorAttributeName;(边线颜色)

NSString *const NSStrokeWidthAttributeName;(边线宽度)

NSString *const NSShadowAttributeName;(阴影)(横竖排版)

NSString *const NSVerticalGlyphFormAttributeName;

常量

1> NSFontAttributeName(字体)

该属性所对应的值是一个 UIFont 对象。该属性用于改变一段文本的字体。如果不指定该属性，则默认为12-point Helvetica(Neue)。

2> NSParagraphStyleAttributeName(段落)

该属性所对应的值是一个 NSParagraphStyle 对象。该属性在一段文本上应用多个属性。如果不指定该属性，则默认为 NSParagraphStyle 的defaultParagraphStyle 方法返回的默认段落属性。

3> NSForegroundColorAttributeName(字体颜色)

该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的字体颜色。如果不指定该属性，则默认为黑色。

4> NSBackgroundColorAttributeName(字体背景色)

该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的背景颜色。如果不指定该属性，则默认无背景色。

5> NSLigatureAttributeName(连字符)

该属性所对应的值是一个 NSNumber 对象(整数)。连体字符是指某些连在一起的字符，它们采用单个的图元符号。0 表示没有连体字符。1 表示使用默认的连体字符。2表示使用所有连体符号。默认值为 1（注意，iOS 不支持值为 2）。

6> NSKernAttributeName(字间距)

该属性所对应的值是一个 NSNumber 对象(整数)。字母紧排指定了用于调整字距的像素点数。字母紧排的效果依赖于字体。值为 0 表示不使用字母紧排。默认值为0。

7> NSStrikethroughStyleAttributeName(删除线)

该属性所对应的值是一个 NSNumber 对象(整数)。该值指定是否在文字上加上删除线，该值参考“Underline Style Attributes”。默认值是NSUnderlineStyleNone。

8> NSUnderlineStyleAttributeName(下划线)

该属性所对应的值是一个 NSNumber 对象(整数)。该值指定是否在文字上加上下划线，该值参考“Underline Style Attributes”。默认值是NSUnderlineStyleNone。

9> NSStrokeColorAttributeName(边线颜色)

该属性所对应的值是一个 UIColor 对象。如果该属性不指定（默认），则等同于 NSForegroundColorAttributeName。否则，指定为删除线或下划线颜色。更多细节见“Drawing attributedstrings that are both filled and stroked”。

10> NSStrokeWidthAttributeName(边线宽度)

该属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。

11> NSShadowAttributeName(阴影)

该属性所对应的值是一个 NSShadow 对象。默认为 nil。

12> NSVerticalGlyphFormAttributeName(横竖排版)

该属性所对应的值是一个 NSNumber 对象(整数)。0 表示横排文本。1 表示竖排文本。在 iOS 中，总是使用横排文本，0 以外的值都未定义。

*/
