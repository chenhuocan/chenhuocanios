//
//  FrameAnimation.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

//- 延迟做一些事情
//
//[self performSelector:@selector(stand:) withObject:@"123" afterDelay:10];
//// 10s后自动调用self的stand:方法，并且传递@"123"参数



#import "FrameAnimation.h"

@interface FrameAnimation ()

@property (strong,nonatomic)  UIImageView *imageView;

@end

@implementation FrameAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.imageView];
    [self startAnimation];
}

#pragma mark ---帧动画

- (void)startAnimation {
    NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        // 获取图片的名称
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        // 创建图片对象
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArr addObject:image];
    
    }
    // 设置动画图片
    self.imageView.animationImages = imageArr;
    // 设置动画播放次数
    self.imageView.animationRepeatCount = 0;
    // 设置播放时长
     // 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
    self.imageView.animationDuration = 1.0;
    // 开始动画
    [self.imageView startAnimating];
    [self performSelector:@selector(overAnimation) withObject:nil afterDelay:10];
}

- (void)overAnimation {
    [self.imageView stopAnimating];
    // 结束动画后延迟做一组动画
    // Selector 方法
    // Object 参数
    // afterDelay 时间
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:10];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
