//
//  CHNsInvacation.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHNsInvacation.h"
#import "XMGOperation.h"

@interface CHNsInvacation ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation CHNsInvacation


#pragma mark ----------------------
#pragma mark Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self customWithQueue];
}

#pragma mark ----------------------
#pragma mark Methods

-(void)invocationOperationWithQueue
{
    //1.创建操作,封装任务
    /*
     第一个参数:目标对象 self
     第二个参数:调用方法的名称
     第三个参数:前面方法需要接受的参数 nil
     */
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download2) object:nil];
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download3) object:nil];
    
    //2.创建队列
    /*
     GCD:
     串行类型:create & 主队列
     并发类型:create & 全局并发队列
     NSOperation:
     主队列:   [NSOperationQueue mainQueue] 和GCD中的主队列一样,串行队列
     非主队列: [[NSOperationQueue alloc]init]  非常特殊(同时具备并发和串行的功能)
     //默认情况下,非主队列是并发队列
     */
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //3.添加操作到队列中
    [queue addOperation:op1];   //内部已经调用了[op1 start]
    [queue addOperation:op2];
    [queue addOperation:op3];
}

-(void)blockOperationWithQueue{
    //1.创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1----%@",[NSThread currentThread]);
       
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2----%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3----%@",[NSThread currentThread]);
    }];
    
    //追加任务
    [op2 addExecutionBlock:^{
        NSLog(@"4----%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        NSLog(@"5----%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        NSLog(@"6----%@",[NSThread currentThread]);
    }];
    

    
    //2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //2.设置队列的最大并发数
      /*
       非主队列中的任务默认是并发执行的，可以通过设置队列的最大并发数来控制该队列中的任务是并发执行还是串行执行的
       当最大并发数==1 任务串行执行
       当最大并发数>1 任务并发执行
       系统默认的最大并发数 == -1 （默认是并发执行的）
       当最大并发数 == 0 不会执行任务操作
       */
    queue.maxConcurrentOperationCount = 1;
    
    //3.添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    //简便方法
    //1)创建操作,2)添加操作到队列中
    [queue addOperationWithBlock:^{
        NSLog(@"7----%@",[NSThread currentThread]);
    }];
    
}

-(void)customWithQueue
{
    //1.封装操作
    XMGOperation *op1 = [[XMGOperation alloc]init];
    XMGOperation *op2 = [[XMGOperation alloc]init];
    
    //2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //3.添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    
}


-(void)download1{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}

-(void)download2{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}


-(void)download3{
    NSLog(@"%s----%@",__func__,[NSThread currentThread]);
}



- (void)startBtnClick:(id)sender{
    //1.创建队列
    //默认是并发队列
    self.queue = [[NSOperationQueue alloc]init];
    
    //2.设置最大并发数量 maxConcurrentOperationCount
    self.queue.maxConcurrentOperationCount = 1;
    
    XMGOperation *op1 = [[XMGOperation alloc]init];
    
    //4.添加到队列
    [self.queue addOperation:op1];
}

- (void)suspendBtnClick:(id)sender{
    //暂停,是可以恢复
    /*
     队列中的任务也是有状态的:已经执行完毕的 | 正在执行 | 排队等待状态
     */
    //不能暂停当前正在处于执行状态的任务
    [self.queue setSuspended:YES];
}

- (void)goOnBtnClick:(id)sender{
    //继续执行
    [self.queue setSuspended:NO];
}

- (void)cancelBtnClick:(id)sender{
    //取消,不可以恢复
    //该方法内部调用了所有操作的cancel方法
    [self.queue cancelAllOperations];
}



#pragma 操作依赖和监听
-(void)OperationDependenciesAndListening{
   //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    NSOperationQueue *queue2 = [[NSOperationQueue alloc]init];
    
    //2.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4---%@",[NSThread currentThread]);
    }];
    
    //操作监听
    op3.completionBlock = ^{
        NSLog(@"++++客官,来看我吧------%@",[NSThread currentThread]);
    };
    
    //添加操作依赖
    //注意点:不能循环依赖
    //可以跨队列依赖
    [op1 addDependency:op4];
//    [op4 addDependency:op1];
    
    [op2 addDependency:op3];
    
    //添加操作到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue2 addOperation:op4];
}


#pragma 进程间通信
-(void)download{
    //http://s15.sinaimg.cn/bmiddle/4c0b78455061c1b7f1d0e
    
    //1.开子线程下载图片
    //1.1 非主队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //1.2 封装操作
    NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:@"http://s15.sinaimg.cn/bmiddle/4c0b78455061c1b7f1d0e"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        NSLog(@"download---%@",[NSThread currentThread]);
        
        //3.更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.imageView.image = image;
            NSLog(@"UI---%@",[NSThread currentThread]);
        }];
        
    }];
    
    //2.添加操作到队列
    [queue addOperation:download];
}

/*
 1.下载图片1
 2.下载图片2
 3.合并图片
 */
-(void)comBie
{
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    __block UIImage *image1;
    __block UIImage *image2;
    //2 封装操作,下载图片1
    NSBlockOperation *download1 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:@"http://s15.sinaimg.cn/bmiddle/4c0b78455061c1b7f1d0e"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        image1 = [UIImage imageWithData:imageData];
        
        NSLog(@"download---%@",[NSThread currentThread]);
        
    }];
    
    //3 封装操作,下载图片2
    NSBlockOperation *download2 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:@"http://www.027art.com/feizhuliu/UploadFiles_6650/201109/2011091718442835.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        image2 = [UIImage imageWithData:imageData];
        
        NSLog(@"download---%@",[NSThread currentThread]);
        
    }];
    
    //4.封装合并图片的操作
    NSBlockOperation *combie = [NSBlockOperation blockOperationWithBlock:^{
        //4.1 开上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        //4.2 画图1
        [image1 drawInRect:CGRectMake(0, 0, 100, 200)];
        
        //4.3 画图2
        [image2 drawInRect:CGRectMake(100, 0, 100, 200)];
        
        //4.4 根据上下文得到图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //4.5 关闭上下文
        UIGraphicsEndImageContext();
        
        //7.更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.imageView.image = image;
            NSLog(@"UI----%@",[NSThread currentThread]);
        }];
        
    }];
    
    //5.设置依赖关系
    [combie addDependency:download1];
    [combie addDependency:download2];
    
    //6.添加操作到队列中
    [queue addOperation:download2];
    [queue addOperation:download1];
    [queue addOperation:combie];
}



#pragma 多图下载 使用 SDWebImage的基本使用，SDWebImage是对下面例子的总结开发
//下载并显示cell对应的网络图片
 /* 策略
  01 需要显示cell的图片的时候先从内存缓存中取，如果有直接用，如果没有那么就去沙盒缓存中查找
  02 如果沙盒缓存中存在，那么直接拿来用，再把该图片保存一份到内存缓存中，如果沙盒缓存中没有，那么需要下载
  03 下载图片是耗时操作，需要放到子线程中处理，为了避免重复下载图片，所以应该把下载操作也缓存
  */
-(void)downloadPhotos{
//   UIImage *image = [self.images objectForKey:appM.icon];
     UIImage *image = nil;
    if (image) {
//        cell.imageView.image = image;
//        NSLog(@"%zd处的图片使用了内存缓存中的图片",indexPath.row) ;
    }else
    {
        //保存图片到沙盒缓存
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //获得图片的名称,不能包含/
//        NSString *fileName = [appM.icon lastPathComponent];
        //拼接图片的全路径
//        NSString *fullPath = [caches stringByAppendingPathComponent:fileName];
        
        
        //检查磁盘缓存
//        NSData *imageData = [NSData dataWithContentsOfFile:fullPath];
        //废除
         NSData *imageData =  nil;
        
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
//            cell.imageView.image = image;
            
//            NSLog(@"%zd处的图片使用了磁盘缓存中的图片",indexPath.row) ;
            //把图片保存到内存缓存
//            [self.images setObject:image forKey:appM.icon];
            
//            NSLog(@"%@",fullPath);
        }else
        {
            //检查该图片时候正在下载,如果是那么久什么都捕捉,否则再添加下载任务
//            NSBlockOperation *download = [self.operations objectForKey:appM.icon];
            NSBlockOperation *download = nil;
            if (download) {
                
            }else
            {
                
                //先清空cell原来的图片
//                cell.imageView.image = [UIImage imageNamed:@"Snip20160221_306"];
                
                download = [NSBlockOperation blockOperationWithBlock:^{
//                    NSURL *url = [NSURL URLWithString:appM.icon];
//                    NSData *imageData = [NSData dataWithContentsOfURL:url];
//                    UIImage *image = [UIImage imageWithData:imageData];
                    
//                     NSLog(@"%zd--下载---",indexPath.row);
                    
                    //容错处理
                    if (image == nil) {
//                        [self.operations removeObjectForKey:appM.icon];
                        return ;
                    }
                    //演示网速慢的情况
                    //[NSThread sleepForTimeInterval:3.0];
                
                    //把图片保存到内存缓存
//                    [self.images setObject:image forKey:appM.icon];
                    
                    //NSLog(@"Download---%@",[NSThread currentThread]);
                    //线程间通信
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        
                        //cell.imageView.image = image;
                        //刷新一行
//                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                        //NSLog(@"UI---%@",[NSThread currentThread]);
                    }];
                    
                    
                    //写数据到沙盒
//                    [imageData writeToFile:fullPath atomically:YES];
                   
                    //移除图片的下载操作
//                    [self.operations removeObjectForKey:appM.icon];
                    
                }];
                
                //添加操作到操作缓存中
//                [self.operations setObject:download forKey:appM.icon];
                
                //添加操作到队列中
                [self.queue addOperation:download];
            }
            
        }
    }
}
//1.UI很不流畅 --- > 开子线程下载图片
//2.图片重复下载 ---> 先把之前已经下载的图片保存起来(字典)
//内存缓存--->磁盘缓存

//3.图片不会刷新--->刷新某行
//4.图片重复下载(图片下载需要时间,当图片还未完全下载之前,又要重新显示该图片)
//5.数据错乱 ---设置占位图片
@end
