//
//  UILabelLearn.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UILabelLearn.h"

@interface UILabelLearn ()

@end

@implementation UILabelLearn

- (void)viewDidLoad {
    [super viewDidLoad];
    [self label];
    // Do any additional setup after loading the view.
}
#pragma mark -label的使用
- (void) label {
    UILabel *label = [[UILabel alloc] init];
//  设置frame
    label.frame = CGRectMake(100, 100, 100, 50);
//  设置背景颜色
    label.backgroundColor = [UIColor redColor];
//  设置文字
    label.text = @"文字";
//  居中
    label.textAlignment =  NSTextAlignmentCenter;
//  设置字体大小
    label.font = [UIFont systemFontOfSize:20.f];
    label.font = [UIFont boldSystemFontOfSize:25.f];
    label.font = [UIFont italicSystemFontOfSize:20.f];
//  设置文字颜色
    label.textColor = [UIColor whiteColor];
//  设置阴影(默认是有值)
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(-2, 1);
//  设置行数(0:自动换行)
    label.numberOfLines = 1;
//  显示模式
    label.lineBreakMode = NSLineBreakByTruncatingHead;
    /*
       NSLineBreakByWordWrapping = 0,  // 单词包裹,换行的时候会以一个单词换行
       NSLineBreakByCharWrapping,        // 字符包裹换行,换行的时候会以一个字符换行
       NSLineBreakByClipping,        // 裁剪超出的内容
       NSLineBreakByTruncatingHead,    // 一行中头部省略(注意:numberOfLines要为1): "...wxyz"
       NSLineBreakByTruncatingTail,    // 一行中尾部省略: "abcd..."
       NSLineBreakByTruncatingMiddle    // 一行中中间部省略:  "ab...yz"
       */
    [self.view addSubview:label];
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
