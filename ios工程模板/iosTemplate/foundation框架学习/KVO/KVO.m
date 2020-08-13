//
//  KVO.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/10.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "KVO.h"
#import "CHPerson.h"

@interface KVO ()

@end

@implementation KVO

- (void)viewDidLoad {
    [super viewDidLoad];
    CHPerson *person = [[CHPerson alloc] init];
    person.name = @"zs";
    /*
    作用:给对象绑定一个监听器(观察者)
    - Observer 观察者
    - KeyPath 要监听的属性
    - options 选项(方法方法中拿到属性值)
    */
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    person.name = @"ls";
       
    person.name = @"ww";
    // 移除监听
    [person removeObserver:self forKeyPath:@"name"];
    
}
/**
 *  当监听的属性值发生改变
 *
 *  @param keyPath 要改变的属性
 *  @param object  要改变的属性所属的对象
 *  @param change  改变的内容
 *  @param context 上下文
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@------%@------%@", keyPath, object, change);
}

@end
