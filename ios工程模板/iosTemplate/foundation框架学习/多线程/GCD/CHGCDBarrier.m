//
//  CHGCDBarrier.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//   //栅栏函数

#import "CHGCDBarrier.h"

@interface CHGCDBarrier ()

@end

@implementation CHGCDBarrier

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //0.获得全局并发队列
    //栅栏函数不能使用全局并发队列
    //dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    //1.异步函数
    dispatch_async(queue, ^{
       
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"download1-%zd-%@",i,[NSThread currentThread]);
        }
        
    });
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"download2-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    
    //栅栏函数
    dispatch_barrier_async(queue, ^{
       
        NSLog(@"+++++++++++++++++++++++++++++");
    });
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"download3-%zd-%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"download4-%zd-%@",i,[NSThread currentThread]);
        }
    });
}


-(void)moveFileWithGCD{
    //1.拿到文件路径
    NSString *from = @"/Users/xiaomage/Desktop/from";
    
    //2.获得目标文件路径
    NSString *to = @"/Users/xiaomage/Desktop/to";
    
    //3.得到目录下面的所有文件
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:from];
    
    NSLog(@"%@",subPaths);
    //4.遍历所有文件,然后执行剪切操作
    NSInteger count = subPaths.count;
    
    dispatch_apply(count, dispatch_get_global_queue(0, 0), ^(size_t i) {
        //4.1 拼接文件的全路径
        // NSString *fullPath = [from stringByAppendingString:subPaths[i]];
        //在拼接的时候会自动添加/
        NSString *fullPath = [from stringByAppendingPathComponent:subPaths[i]];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPaths[i]];
        
        NSLog(@"%@",fullPath);
        //4.2 执行剪切操作
        /*
         第一个参数:要剪切的文件在哪里
         第二个参数:文件应该被存到哪个位置
         */
        [[NSFileManager defaultManager]moveItemAtPath:fullPath toPath:toFullPath error:nil];
        
        NSLog(@"%@---%@--%@",fullPath,toFullPath,[NSThread currentThread]);

    });
}


#pragma mark ----------------------GCD队列组基本使用
#pragma mark Methods
-(void)group1
{
    //1.创建队列
    dispatch_queue_t queue =dispatch_get_global_queue(0, 0);
    
    //2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //3.异步函数
    /*
     1)封装任务
     2)把任务添加到队列中
     dispatch_async(queue, ^{
     NSLog(@"1----%@",[NSThread currentThread]);
     });
     */
    /*
     1)封装任务
     2)把任务添加到队列中
     3)会监听任务的执行情况,通知group
     */
    dispatch_group_async(group, queue, ^{
        NSLog(@"1----%@",[NSThread currentThread]);
    });
    
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"2----%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"3----%@",[NSThread currentThread]);
    });
    
    //拦截通知,当队列组中所有的任务都执行完毕的时候回进入到下面的方法
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"-------dispatch_group_notify-------");
    });
    
    //    NSLog(@"----end----");

}

-(void)group2
{
    //1.创建队列
    dispatch_queue_t queue =dispatch_get_global_queue(0, 0);
    
    //2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //3.在该方法后面的异步任务会被纳入到队列组的监听范围,进入群组
    //dispatch_group_enter|dispatch_group_leave 必须要配对使用
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        NSLog(@"1----%@",[NSThread currentThread]);
        
        //离开群组
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        NSLog(@"2----%@",[NSThread currentThread]);
    
        //离开群组
        dispatch_group_leave(group);
    });
    
    
    //拦截通知
    //问题?该方法是阻塞的吗?  内部本身是异步的
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"-------dispatch_group_notify-------");
//    });
    
    //等待.死等. 直到队列组中所有的任务都执行完毕之后才能执行
    //阻塞的
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"----end----");
    
}

-(void)group3
{
    /*
     1.下载图片1 开子线程
     2.下载图片2 开子线程
     3.合成图片并显示图片 开子线程
     */
    
    //-1.获得队列组
    dispatch_group_t group = dispatch_group_create();
    
    //0.获得并发队列
    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0);
    
    // 1.下载图片1 开子线程
    dispatch_group_async(group, queue,^{
        
        NSLog(@"download1---%@",[NSThread currentThread]);
        //1.1 确定url
        NSURL *url = [NSURL URLWithString:@"http://www.qbaobei.com/tuku/images/13.jpg"];
        
        //1.2 下载二进制数据
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        //1.3 转换图片
//        self.image1 = [UIImage imageWithData:imageData];
    });
    
    // 2.下载图片2 开子线程
     dispatch_group_async(group, queue,^{
         
         NSLog(@"download2---%@",[NSThread currentThread]);
         //2.1 确定url
        NSURL *url = [NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/2008919134941443_2.jpg"];
        
        //2.2 下载二进制数据
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        //2.3 转换图片
//        self.image2 = [UIImage imageWithData:imageData];
    });

    //3.合并图片
    //主线程中执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       
        NSLog(@"combie---%@",[NSThread currentThread]);
        //3.1 创建图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        //3.2 画图1
//        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
//        self.image1 = nil;
        
        //3.3 画图2
//        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
//        self.image2 = nil;
        
        //3.4 根据上下文得到一张图片
        UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
        
        //3.5 关闭上下文
        UIGraphicsEndImageContext();
        
        //3.6 更新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
        
            NSLog(@"UI----%@",[NSThread currentThread]);
//            self.imageView.image = image;
//        });
    });
    
//    dispatch_release(group)
}

-(void)test
{
   // dispatch_async(<#dispatch_queue_t queue#>, <#^(void)block#>)
    //区别:封装任务的方法(block--函数)
    /*
     第一个参数:队列
     第二个参数:参数
     第三个参数:要调用的函数的名称
     */
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, task);
}

void task(void *param)
{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
}
@end
