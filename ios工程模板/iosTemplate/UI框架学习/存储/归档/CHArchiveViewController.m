//
//  CHArchiveViewController.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHArchiveViewController.h"
#import "CHPerson.h"
@interface CHArchiveViewController ()

@end

@implementation CHArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)save {
    CHPerson *per = [[CHPerson alloc] init];
    per.name = @"xmg";

    
    // 获取沙盒目录
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"Person.data"];
    NSLog(@"%@",tempPath);
    NSLog(@"%@",filePath);
    //归档 archiveRootObject会调用encodeWithCoder:
    [NSKeyedArchiver archiveRootObject:per toFile:filePath];
    
    
}
- (void)read {
    //获取沙盒目录
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"Person.data"];
    //unarchiveObjectWithFile会调用initWithCoder
    CHPerson *per = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",per.name);
}
@end
