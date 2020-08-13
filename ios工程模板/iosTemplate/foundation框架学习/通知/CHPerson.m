//
//  CHPerson.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/10.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHPerson.h"

@implementation CHPerson
{
    int _age;
}
- (void)getNew:(NSNotification *)note{
    NSLog(@"[%@]接收到了[%@]发布的[%@]通知,通知的内容是:[%@]",self.name,[note.object name],note.name,note.userInfo);
}
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}


- (instancetype)init{
    if (self = [super init]) {
        _age = 8;
    }
    return self;
}

- (void)printAge{
NSLog(@"age:%d", _age);
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@----money:%.2f", _name, _money];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self =[super init]) {
        /*
        self.name = dict[@"name"];
        self.money = [dict[@"money"] floatValue];
        */
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
