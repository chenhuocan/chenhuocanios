//
//  CHCellModule.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/29.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHCellModule.h"

@implementation CHCellModule
+ (instancetype)tgWithDict:(NSDictionary *)dict{
    CHCellModule *tg = [[self alloc] init];
    [tg setValuesForKeysWithDictionary:dict];
    return tg;
}

@end
