//
//  CHCarGroup.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/27.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHCarGroup.h"
#import "CHCar.h"

@implementation CHCarGroup
+ (instancetype)carGroupWithDict:(NSDictionary *)dict{
    CHCarGroup *group = [[self alloc] init];
    
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    
    // 字典数组 -> 模型数组
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        CHCar *car = [CHCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    return group;
    
}

@end
