//
//  Lazyloading.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "Lazyloading.h"
#import "HCProductModel.h"

@interface Lazyloading ()
@property(nonatomic,strong) NSArray *products;

@end

@implementation Lazyloading

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 只会读取一次文件
    [self products];
}
// 最终的懒加载
// 1.数据用到的时候再加载  2.只会被加载一次
// 步骤: 重写成员变量的get方法,在get方法中判断是否加载数据
#pragma mark -- 懒加载代码
- (NSArray *)products {
    if (_products == nil) {
       // 1.获取plist文件的路径
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"products.plist" ofType:nil];
        
        // 2.读取plist文件
        _products = [NSArray arrayWithContentsOfFile:plistPath];
        // 3.将字典转成模型对象
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in _products) {
            HCProductModel *product = [HCProductModel productWithDict:dict];
            [tempArray addObject:product];
        }
        _products = tempArray;
        
    }
    
    return _products;
}

@end
