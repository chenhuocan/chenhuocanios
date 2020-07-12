//
//  XMGProductView.m
//  03-综合练习
//
//  Created by xmg on 15/11/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "XMGProductView.h"
#import "HCProductModel.h"

@implementation XMGProductView

#pragma mark - 初始化方法:设置btn的相关属性
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 2.文字的颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
        // 3.让btn不可以交互
        self.enabled = NO;
    }
    return self;
}

#pragma mark - 调整子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.取出当前控件的宽度和高度
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 2.调整内部子控件的frame
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

#pragma mark - 重写setProduct方法,来设置子控件数据
- (void)setProduct:(HCProductModel *)product
{
    _product = product;
    
    // 设置内部子控件的数据
    [self setTitle:product.title forState:UIControlStateDisabled];
    [self setImage:[UIImage imageNamed:product.icon] forState:UIControlStateDisabled];
}

@end
