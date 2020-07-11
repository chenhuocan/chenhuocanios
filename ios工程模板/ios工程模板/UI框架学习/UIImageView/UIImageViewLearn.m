//
//  UIImageViewLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UIImageViewLearn.h"

@interface UIImageViewLearn ()

@end

@implementation UIImageViewLearn

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiimage];
    // Do any additional setup after loading the view.
}

#pragma mark ---UIImageView使用

- (void)uiimage {
    // 1.创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] init];

    // 设置frame的方式
    // 2. 设置尺寸
    // imageView.frame = CGRectMake(100, 100, 100, 100);
    // imageView.frame = (CGRect){{100, 100},{267, 400}};
    // [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]
    
    // 创建一个UIimageview对象
    // 注意: initWithImage 默认就有尺寸--->图片的尺寸 ，利用这个方法创建出来的imageView的尺寸和传入的图片尺寸一样
    // UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
      
    
    imageView.frame = self.view.bounds;
    
    
    // 3. 设置背景颜色
    imageView.backgroundColor = [UIColor redColor];
    // 4. 设置背景图片 设置图片 (png不需要后缀) 图片资源放置 Assets.xcassets
    imageView.image = [UIImage imageNamed:@"1"];
    // 5.设置图片的内容模式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 6.加毛玻璃
    // 6.1 创建UIToolBar对象
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    // 6.2 设置toolBar的frame
    toolbar.frame = imageView.frame;
    // 6.3 设置毛玻璃的样式
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.98;
    // 6.4 加到imageView中
    [imageView addSubview:toolbar];
    [self.view addSubview:imageView];
    
    
    // 不能直接修改：OC对象的结构体属性的成员
    // 错误写法 imageView.frame.size = imageView.image.size;
    // 正确写法
    //    CGRect tempFrame = imageView.frame;
    //    tempFrame.size = imageView.image.size;
    //    imageView.frame = tempFrame;
}

/**
 设置图片的内容模式
 UIViewContentModeRedraw, // 重新绘制 (核心绘图) drawRact
 
 //带有Scale,标明图片有可能被拉伸或压缩
 UIViewContentModeScaleToFill, // 完全的压缩或拉伸
 
 // Aspect 比例,缩放是带有比例的
 UIViewContentModeScaleAspectFit, // 宽高比不变 Fit 适应
 UIViewContentModeScaleAspectFill, // 宽高比不变 Fill 填充
 
 //不带有Scale,标明图片不可能被拉伸或压缩
 UIViewContentModeCenter,
 UIViewContentModeTop,
 UIViewContentModeBottom,
 UIViewContentModeLeft,
 UIViewContentModeRight,
 UIViewContentModeTopLeft,
 UIViewContentModeTopRight,
 UIViewContentModeBottomLeft,
 UIViewContentModeBottomRight,
 */

//- 带有scale单词的：图片有可能会拉伸
//    - UIViewContentModeScaleToFill
//        - 将图片拉伸至填充整个imageView
//        - 图片显示的尺寸跟imageView的尺寸是一样的
//    - 带有aspect单词的：保持图片原来的宽高比
//        - UIViewContentModeScaleAspectFit
//            - 保证刚好能看到图片的全部
//        - UIViewContentModeScaleAspectFill
//            - 拉伸至图片的宽度或者高度跟imageView一样
//
//- 没有scale单词的：图片绝对不会被拉伸，保持图片的原尺寸
//    - UIViewContentModeCenter
//    - UIViewContentModeTop
//    - UIViewContentModeBottom
//    - UIViewContentModeLeft
//    - UIViewContentModeRight
//    - UIViewContentModeTopLeft
//    - UIViewContentModeTopRight
//    - UIViewContentModeBottomLeft
//    - UIViewContentModeBottomRight


@end
