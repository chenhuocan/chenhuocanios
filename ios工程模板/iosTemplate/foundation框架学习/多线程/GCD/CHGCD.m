//
//  CHGCD.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHGCD.h"

@interface CHGCD ()

@end

@implementation CHGCD

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ----------------------
#pragma Events
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [NSThread detachNewThreadSelector:@selector(syncMain) toTarget:self withObject:nil];
    
    [self asyncConcurrent];
}

#pragma mark ----------------------
#pragma Methods
//异步函数+并发队列:会开启多条线程,队列中的任务是并发执行
-(void)asyncConcurrent{
    //1.创建队列
    /*
     第一个参数:C语言的字符串,标签
     第二个参数:队列的类型
        DISPATCH_QUEUE_CONCURRENT:并发
        DISPATCH_QUEUE_SERIAL:串行
     */
    //dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_CONCURRENT);
    
    //获得全局并发队列
    /*
     第一个参数:优先级
     第二个参数:
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"---satrt----");
    
    //2.1>封装任务2>添加任务到队列中
    /*
     第一个参数:队列
     第二个参数:要执行的任务
     */
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
     NSLog(@"---end----");
}

//异步函数+串行队列:会开线程,开一条线程,队列中的任务是串行执行的
-(void)asyncSerial{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_SERIAL);

    //2.封装操作
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//同步函数+并发队列:不会开线程,任务是串行执行的
-(void)syncConcurrent{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"---start---");
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
     NSLog(@"---end---");
}

//同步函数+串行队列:不会开线程,任务是串行执行的
-(void)syncSerial{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_SERIAL);
    
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//异步函数+主队列:所有任务都在主线程中执行,不会开线程
-(void)asyncMain{
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();

    //2.异步函数
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//同步函数+主队列:死锁
//注意:如果该方法在子线程中执行,那么所有的任务在主线程中执行,
-(void)syncMain{
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"start----");
    //2.同步函数
    //同步函数:立刻马上执行,如果我没有执行完毕,那么后面的也别想执行
    //异步函数:如果我没有执行完毕,那么后面的也可以执行
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
    NSLog(@"end---");
}


#pragma GCD进程中通信

-(void)communicationInGCDProcess{
    //1.创建子线程下载图片
    //DISPATCH_QUEUE_PRIORITY_DEFAULT 0
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        //1.1 确定url
        NSURL *url = [NSURL URLWithString:@"http://a.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=da0ec79c738da9774e7a8e2f8561d42f/c83d70cf3bc79f3d6842e09fbaa1cd11738b29f9.jpg"];
        
        //1.2 下载二进制数据到本地
       NSData *imageData =  [NSData dataWithContentsOfURL:url];
        
        //1.3 转换图片
        UIImage *image = [UIImage imageWithData:imageData];
        
        NSLog(@"download----%@",[NSThread currentThread]);
        
        //更新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.imageView.image = image;
             NSLog(@"UI----%@",[NSThread currentThread]);
        });
        
    });
}



#pragma 常用函数
-(void)delay{
//延迟执行
    
    //1. 延迟执行的第一种方法
    //[self performSelector:@selector(task) withObject:nil afterDelay:2.0];
    
    //2.延迟执行的第二种方法
    //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(task) userInfo:nil repeats:YES];
    
    //3.GCD
//    dispatch_queue_t queue = dispatch_get_main_queue();
     dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
     第一个参数:DISPATCH_TIME_NOW 从现在开始计算时间
     第二个参数:延迟的时间 2.0 GCD时间单位:纳秒
     第三个参数:队列
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"GCD----%@",[NSThread currentThread]);
    });

}
//一次性代码
//不能放在懒加载中的,应用场景:单例模式
-(void)once{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"---once----");
    });
}
@end
