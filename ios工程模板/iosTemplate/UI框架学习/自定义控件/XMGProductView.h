//
//  XMGProductView.h
//  03-综合练习
//
//  Created by xmg on 15/11/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//
// mvc 的变种 将数据和view 结合，如果这中view 只对应这种数据那么可以这样做
#import <UIKit/UIKit.h>
@class HCProductModel;

@interface XMGProductView : UIButton

// 提供模型对象的接口,设置内部的数据
@property (nonatomic, strong) HCProductModel *product;

@end
