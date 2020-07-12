//
//  imageResources.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

/**
  加载图片的方式:
  1. imageNamed:
  2. imageWithContentsOfFile:

  1. 加载Assets.xcassets这里面的图片:
   1> 打包后变成Assets.car
   2> 拿不到路径
   3> 只能通过imageNamed:来加载图片
   4> 不能通过imageWithContentsOfFile:来加载图片

  2. 放到项目中的图片:
   1> 可以拿到路径
   2> 能通过imageNamed:来加载图片
   3> 也能通过imageWithContentsOfFile:来加载图片
*/


/**
   图片的两种加载方式:
   1> imageNamed:
     a. 就算指向它的指针被销毁,该资源也不会被从内存中干掉
     b. 放到Assets.xcassets的图片,默认就有缓存
     c. 图片经常被使用

   2> imageWithContentsOfFile:
     a. 指向它的指针被销毁,该资源会被从内存中干掉
     b. 放到项目中的图片就不由缓存
     c. 不经常用,大批量的图片

*/
#import "imageResources.h"

@interface imageResources ()

@end

@implementation imageResources

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] init];
//   方式一
    imageView.image = [UIImage imageNamed:@"1"];
//  方式二
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    
    
//    - 图片的加载方式
//    - 有缓存
//    ```objc
//    UIImage *image = [UIImage imageNamed:@"图片名"];
//    ```
//        - 使用场合：图片比较小、使用频率较高
//        - 建议把需要缓存的图片直接放到Images.xcassets
//    - 无缓存
//    ```objc
//    NSString *file = [[NSBundle mainBundle] pathForResource:@"图片名" ofType:@"图片的扩展名"];
//    UIImage *image = [UIImage imageWithContentsOfFile:@"图片文件的全路径"];
//    ```
//        - 使用场合：图片比较大、使用频率较小
//        - 不需要缓存的图片不能放在Images.xcassets
//    - 放在Images.xcassets里面的图片，只能通过图片名去加载图片
    
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
