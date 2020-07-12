//
//  plst.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "plist.h"

@interface plist ()

@end

@implementation plist

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 写入一个数组到plist文件
    NSArray *names = @[@"yjh", @"gxq", @"mj", @"sz", @"nj"];
    BOOL flag = [names writeToFile:@"/Users/chenhuocan/Desktop/name.plist" atomically:YES];

    // 写入字典到plist文件中
    NSDictionary *person = @{
                           @"name" : @"叶建华",
                           @"age" : @"18",
                           @"height" : @"1.88",
                           @"friends" : @[@"大神11期", @"马云"]
                           };

    BOOL flag1 = [person writeToFile:@"/Users/chenhuocan/Desktop/person.plist" atomically:YES];


    // 写入一个字典+数组到plist文件中
    NSArray *products = @[
                          @{@"icon" : @"danjianbao", @"title" : @"单肩包"},
                          @{@"icon" : @"liantiaobao", @"title" : @"链条包"},
                          @{@"icon" : @"shoutibao", @"title" : @"手提包"},
                          @{@"icon" : @"qianbao", @"title" : @"钱包"},
                          @{@"icon" : @"shuangjianbao", @"title" : @"双肩包"},
                          @{@"icon" : @"xiekuabao", @"title" : @"斜挎包"}
                          ];

     BOOL flag2 = [products writeToFile:@"/Users/chenhuocan/Desktop/products.plist" atomically:YES];

    // 把plist写入数组
    NSString *path = @"/Users/chenhuocan/Desktop/products.plist";
    NSArray *personArr = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@",personArr);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
