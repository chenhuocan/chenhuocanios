//
//  CHCar.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/27.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHCar.h"

@implementation CHCar
+ (instancetype)carWithDict:(NSDictionary *)dict{
    CHCar *car = [[self alloc] init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    return car;
}


+ (instancetype) carWithName:(NSString *) name icon:(NSString *) icon {
    CHCar * car = [[self alloc] init];
    car.icon = icon;
    car.name = name;
    return car;
}
@end
