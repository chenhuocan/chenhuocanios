//
//  KVC.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//  键值对编码
//取值和赋值(开发中基本不用)
//获取对象私有变量的值.(经常使用,例如UIPageContorl分页, 设置圆点为图片)
//改变对象私有变量的值(经常使用)
//简单的字典转模型(偶尔使用)
//模型转字典
//批量取值

//https://www.jianshu.com/p/b9f020a8b4c9
//https://www.cnblogs.com/gaoxiaoniu/p/10701207.html
#import "KVC.h"
#import "CHPerson.h"
#import "CHDog.h"
@interface KVC ()

@end

@implementation KVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     取出数组中所有模型的某个属性值
    */
    CHPerson *person1 = [[CHPerson alloc] init];
    person1.name = @"zhangsan";
    person1.money = 12.99;

    CHPerson *person2 = [[CHPerson alloc] init];
    person2.name = @"zhangsi";
    person2.money = 22.99;

    CHPerson *person3 = [[CHPerson alloc] init];
    person3.name = @"wangwu";
    person3.money = 122.99;

    NSArray *allPersons = @[person1, person2, person3];
    NSArray *allPersonName = [allPersons valueForKeyPath:@"name"];

    NSLog(@"%@", allPersonName);
}


/**
 *  把模型转成字典
 */

- (void) test6{
    CHPerson *person = [[CHPerson alloc] init];
    person.name = @"lurry";
    person.money = 21.21;
    
    NSDictionary *dict = [person dictionaryWithValuesForKeys:@[@"name", @"money"]];
    NSLog(@"%@", dict);
}


/**
 * 取值
 */
- (void)test5{
    CHPerson *person = [[CHPerson alloc] init];
    person.name = @"张三";
    person.money = 12332;
    
    // 利用kvc取值
    NSLog(@"%@ --- %.2f", [person valueForKeyPath:@"name"], [[person valueForKey:@"money"] floatValue]);
}

/**
 作用: 字典转模型
 开发中是不建议使用setValuesForKeysWithDictionary:
 1> 字典中的key必须在模型的属性中找到
 2> 如果模型中带有模型,setValuesForKeysWithDictionary不好使
 应用场景: 简单的字典转模型 ---> 框架 (MJExtention)
 */
-(void) test4{
    NSDictionary *dict = @{
                           @"name" :@"lurry",
                           @"money" : @189.88,
                           @"dog" : @{
                                   @"name" : @"wangcai",
                                   @"price" : @8
                                   },
                           @"books": @[
                                   @{@"name" :@"iOS快速开发", @"price" : @1999},
                                   @{@"name" :@"iOS快速发", @"price" : @199},
                                   @{@"name" :@"iOS快开发", @"price" : @99}
                                   ]
                           };
    CHPerson *person = [[CHPerson alloc] initWithDict:dict];
    NSLog(@"%@", person.dog.class);
    
    [person setValue: @{
                        @"name" : @"wangcai",
                        @"price" : @8
                        } forKeyPath:@"dog"];
}


/**
 *  利用KVC修改类的私有成员变量(UIPageControl)
 */
-(void) test3{
    CHPerson *person = [[CHPerson alloc] init];
    //        person->_age
    // 利用KVC修改类的私有成员变量
    [person printAge];
    [person setValue:@"88" forKeyPath:@"_age"]; // age _age
    [person printAge];
}

/**
 *  利用KVC进行综合赋值
 */
-(void) test2{
    CHPerson *person = [[CHPerson alloc] init];
    person.dog = [[CHDog alloc] init];
    //        person.dog.name = @"旺财";
    
    // KVC赋值
    /*
     forKey和forKeyPath
     1>forKeyPath 包含了所有 forKey 的功能
     2>forKeyPath 进行内部的点语法,层层访问内部的属性
     3>注意: key值一定要在属性中找到
     */
    //        [person.dog setValue:@"阿黄" forKey:@"name"];
    [person setValue:@"旺财" forKeyPath:@"dog.name"];
    
    NSLog(@"%@", person.dog.name);

}

/**
 *  利用KVC进行简单赋值
 */
-(void) test{
    CHPerson *person = [[CHPerson alloc] init];
    // 常规赋值
    /*
     person.name = @"张三";
     person.age = 18;
     */
    
    // KVC赋值
    [person setValue:@"王五" forKey:@"name"];
    [person setValue:@"19" forKeyPath:@"money"]; // 自动类型转换
    
    NSLog(@"%@-----%.2f", person.name, person.money);
}
@end
