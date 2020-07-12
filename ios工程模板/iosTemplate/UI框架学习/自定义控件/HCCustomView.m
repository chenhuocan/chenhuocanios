//
//  customView.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "HCCustomView.h"
@interface HCCustomView()
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *label;
@end

@implementation HCCustomView

// 创建对应的子控件 (不要设置frame)
- (instancetype) init {
    if (self = [super init]) {
        
    // 创建UIIMageView对象
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:imageView];
    self.imageView = imageView;

    // 创建UILabel对象
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor blueColor];
    [self addSubview:label];
    self.label = label;
    }
    return self;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 布局子控件(设置frame)
- (void)layoutSubviews{
  // 一定要调用super
    [super layoutSubviews];
//    NSLog(@"%@", NSStringFromCGRect(self.frame));
    // 布局子控件,设置子控件的frame
    // 拿到当前View的尺寸
    NSInteger width = self.frame.size.width;
    NSInteger height = self.frame.size.height;
     self.imageView.frame = CGRectMake(0, 0, width, width);
     self.label.frame = CGRectMake(0, width, width, height-width);

}

@end
