//
//  CHStudents.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/13.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHStudents.h"

@implementation CHStudents
//1.程序一运行，就创建对象
//当类被加载到内存的时候就会调⽤用load的⽅方法,它会⽐比main优先调⽤用
static CHStudents *_instance;
//什么时候调用：当类被加载到内存当中就会调用。
+ (void)load{
    NSLog(@"%s",__func__);
    _instance = [[CHStudents alloc] init];
}
//2.创建的对象，只有一个

+ (instancetype)shareCHStudents{
    return _instance;
}

//3.只要调用alloc，程序就崩溃

+(instancetype)alloc{
    if (_instance) {
        //程序就崩溃
        NSException *exc = [NSException exceptionWithName:@"NSInternalInconsistencyException"
                                                   reason:@"There can only be one Person instance."
                                                 userInfo:nil];
        
        //抛出异常
        [exc raise];
    }
    return [super alloc];
}

@end
