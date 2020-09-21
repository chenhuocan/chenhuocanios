//
//  CHNSCache.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHNSCache.h"

@interface CHNSCache ()<NSCacheDelegate>
/** 注释 */
@property (nonatomic, strong) NSCache *cache;
@end

@implementation CHNSCache

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSCache *)cache
{
    if (_cache == nil) {
        _cache = [[NSCache alloc]init];
        _cache.totalCostLimit = 5;//总成本数是5 ,如果发现存的数据超过中成本那么会自动回收之前的对象
        _cache.delegate = self;
    }
    return _cache;
}

//存数据
- (IBAction)addBtnClick:(id)sender
{
    //NSCache的Key只是对对象进行Strong引用，不是拷贝(和可变字典的区别)
    for (NSInteger i = 0; i<10; i++) {
       NSData *data = [NSData dataWithContentsOfFile:@"/Users/xiaomage/Desktop/Snip20160221_38.png"];
        
        //cost:成本
        [self.cache setObject:data forKey:@(i) cost:1];
        NSLog(@"存数据%zd",i);
    }
}

//取数据
- (IBAction)checkBtnClick:(id)sender
{
    NSLog(@"+++++++++++++++");
    for (NSInteger i = 0; i<10; i++) {
        NSData *data = [self.cache objectForKey:@(i)];
        if (data) {
            NSLog(@"取出数据%zd",i);
        }
    }
}

//删除数据
- (IBAction)removeBtnClick:(id)sender
{
    [self.cache removeAllObjects];
}

#pragma mark ----------------------
#pragma mark NSCacheDelegate
//即将回收对象的时候调用该方法
-(void)cache:(NSCache *)cache willEvictObject:(id)obj
{
    NSLog(@"回收%zd",[obj length]);
}
@end
