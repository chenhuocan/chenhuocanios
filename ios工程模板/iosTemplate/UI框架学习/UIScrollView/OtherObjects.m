//
//  OtherObjects.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "OtherObjects.h"
#import <UIKit/UIKit.h>

@interface OtherObjects ()<UIScrollViewDelegate>

@end
@implementation OtherObjects

#pragma mark --- 设置scrollview 的代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}
@end
