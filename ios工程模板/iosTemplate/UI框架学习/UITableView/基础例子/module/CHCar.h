//
//  CHCar.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/27.
//  Copyright © 2020 陈火灿. All rights reserved.
//  汽车的模拟数据

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHCar : NSObject
// 汽车名称
@property (nonatomic,copy) NSString *name;
// 汽车图标
@property (nonatomic,copy) NSString *icon;

+ (instancetype) carWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
