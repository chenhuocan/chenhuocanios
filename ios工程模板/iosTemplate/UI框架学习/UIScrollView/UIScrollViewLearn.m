//
//  UIScrollViewLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UIScrollViewLearn.h"
#import "OtherObjects.h"

@interface UIScrollViewLearn ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic)  OtherObjects * other ;
@property (strong,nonatomic)  UIPageControl *pageControl;

@end

@implementation UIScrollViewLearn

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 默认scrollView设置该属性为YES
    //    self.scrollView.clipsToBounds = YES;
    // 3.是否能够滚动
    //self.scrollView.scrollEnabled = NO;

    // 4.是否能够跟用户交互(响应用户的点击等操作)
    // 注意点:设置userInteractionEnabled = NO,scrollView以及内部所有的子控件都不能跟用户交互
    // self.scrollView.userInteractionEnabled = NO;
    
    
    // 1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    NSLog(@"11-->%@",self.scrollView.subviews);
    // 2.设置contentSize
    self.scrollView.contentSize = image.size;
    
    // 2.设置内容尺寸(滚动范围)
    // 可滚动尺寸:contentSize的尺寸 减去 scrollView的尺寸
    // 注意点:contentSize的尺寸小于或者等于scrollView的尺寸也是不可以滚定的
    //self.scrollView.contentSize = CGSizeMake(325, 225);
    
    // 3.是否有弹簧效果
    self.scrollView.bounces  = NO;
    
    // 4.不管有没有设置contentSize,总是有弹簧效果(下拉刷新)
    // self.scrollView.alwaysBounceHorizontal = YES;
    // self.scrollView.alwaysBounceVertical = YES;
    
     // 5.是否显示滚动条
    //    self.scrollView.showsHorizontalScrollIndicator = NO;
    //    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // 注意点:千万不要通过索引去subviews数组访问scrollView子控件
    // [self.scrollView.subviews.firstObject removeFromSuperview];
    
    
    // 3.内容的偏移量
    // 作用1:控制内容滚动的位置
    // 作用2:得知内容滚动的位置
    self.scrollView.contentOffset = CGPointMake(0, -100);
    
    // 4.内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    
    
    // 3.设置缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
    //代理使用 ---设置代理
    self.scrollView.delegate = self;
    
}
#pragma mark ----功能

/// 分页功能
- (void)paging {
    // 0.分页器
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.scrollView addSubview:self.pageControl];
    // 1.添加图片
     CGFloat scrollViewW = self.scrollView.frame.size.width;
     CGFloat scrollViewH = self.scrollView.frame.size.height;
     int count = 3;
     for (int i = 0; i < count; i ++) {
         UIImageView *imageView = [[UIImageView alloc] init];
         NSString *name = [NSString stringWithFormat:@"img_0%d",i + 1];
         imageView.image = [UIImage imageNamed:name];
         imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
         [self.scrollView addSubview:imageView];
     }

     // 2.设置contentSize
     self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
     
     // 3.开启分页功能
     // 标准:以scrollView的尺寸为一页
     self.scrollView.pagingEnabled = YES;
    
    // 设置总页数
    self.pageControl.numberOfPages = count;
    // 5.单页的时候是否隐藏pageControl
    self.pageControl.hidesForSinglePage = YES;
    
    // 6.设置pageControl的图片
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"]  forKeyPath: @"_pageImage"];
}


#pragma mark  ----设置内容的偏移量
- (void)top {
    // 向上移动
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES];
}

- (void)bottom {
    // 向下移动
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)left {
    // 向左移动
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y) animated:YES];
}

- (void)right {
    // 向右移动
    CGFloat offsetY = self.scrollView.contentOffset.y;
    CGFloat offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark --- 其他对象使用代理
- (void)useDelegate {
    /*
       1.任何oc对象都可以作为scrollView的代理
       2.苹果设计的代理属是weak
    */
    // 苹果设计的代理属是weak 说以这个对象要设置成强类型
    self.other = [[OtherObjects alloc] init];
    self.scrollView.delegate = self.other;
    
}

    
#pragma mark -----UIScrollViewDelegate 代理方法

/// 当scrollView正在滚动的时候就会制动调用这个方法
/// @param scrollView <#scrollView description#>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
    
    // 这是分页的例子代码
    // 1.计算页码
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    // 2.设置页码
    self.pageControl.currentPage = page;
}

/// 用户即将开始拖拽scrollView时就会调用这个方法
/// @param scrollView <#scrollView description#>
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

/// 用户即将停止拖拽scrollView时就会调用这个方法
/// @param scrollView <#scrollView description#>
/// @param velocity <#velocity description#>
/// @param targetContentOffset <#targetContentOffset description#>
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
     NSLog(@"scrollViewWillEndDragging");
}


/// 用户已经停止拖拽scrollView时就会调用这个方法
/// @param scrollView scrollView description
/// @param decelerate <#decelerate description#>
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
   
    if (decelerate == NO) {
       NSLog(@"用户已经停止拖拽scrollView,停止滚动");
    } else {
       NSLog(@"用户已经停止拖拽scrollView,但是scrollView由于惯性会继续滚动,减速");
    }
}

/// 返回需要缩放的子控件(scrollView的子控件)
/// @param scrollView <#scrollView description#>
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
//    return imageView;
    return nil;
}

/// scrollView减速完毕会调用,停止滚动
/// @param scrollView <#scrollView description#>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   NSLog(@"scrollView减速完毕会调用,停止滚动");
}
@end
