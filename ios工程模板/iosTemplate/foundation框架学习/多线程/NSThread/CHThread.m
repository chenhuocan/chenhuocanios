//
//  CHThread.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHThread.h"

@interface CHThread ()
/** 售票员A */
@property (nonatomic, strong) NSThread *threadA;
/** 售票员B */
@property (nonatomic, strong) NSThread *threadB;
/** 售票员C */
@property (nonatomic, strong) NSThread *threadC;

@property (nonatomic, assign) NSInteger totalCount;
@end

@implementation CHThread

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 开启线程方式1.alloc init 创建线程,需要手动启动线程
//线程的生命周期:当任务执行完毕之后被释放掉
-(void)createNewThread{
    
    //1.创建线程
    /*
    第一个参数:目标对象  self
    第二个参数:方法选择器 调用的方法
    第三个参数:前面调用方法需要传递的参数 nil
    */
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"对象"];
       //设置属性
     threadA.name = @"线程A";
     //设置优先级  取值范围 0.0 ~ 1.0 之间 最高是1.0 默认优先级是0.5
     threadA.threadPriority = 1.0;
     
     //2.启动线程
     [threadA start];
}


//开启线程方式2.分离子线程,自动启动线程
-(void)createNewThread2{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"分离子线程"];
}

//开启线程方式3.开启一条后台线程
-(void)createNewThread3{
    [self performSelectorInBackground:@selector(run:) withObject:@"开启后台线程"];
}

-(void)run:(NSString *)param{
//    NSLog(@"---run----%@---%@",[NSThread currentThread].name,param);
    for (NSInteger i = 0; i<10000; i++) {
        NSLog(@"%zd----%@",i,[NSThread currentThread].name);
    }
}


//----------------
-(void)threadState{
    //1.创建线程,新建
      NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(task) object:nil];
      //2.启动线程,就绪<---->运行
    [thread start];
    // 当前进程
    [NSThread currentThread];
    //阻塞线程
    //[NSThread sleepForTimeInterval:2.0];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];

}
-(void)task{
    for (NSInteger i = 0; i<100 ;i++) {
        NSLog(@"%zd---%@",i,[NSThread currentThread]);
        
        if (i == 20) {
           // [NSThread exit];  //退出当前线程
            break;              //表示任务已经执行完毕.
        }
    }
}

//---------------- 线程的安全问题--经典问题买票系统

-(void)buyTicket{
    //设置中票数
    self.totalCount = 100;

    self.threadA = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadB = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadC = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];

    self.threadA.name = @"售票员A";
    self.threadB.name = @"售票员B";
    self.threadC.name = @"售票员C";

    //启动线程
    //    @synchronized()   这个主要是考虑多线程的程序，这个指令可以将{ } 内的代码限制在一个线程执行，如果当前线程没有执行完，其他的线程需要执行就得等着。
    //    @synchronized 的作用是创建一个互斥锁，保证此时没有其它线程对self对象进行修改。这个是objective-c的一个锁定令牌，防止self对象在同一时间内被其它线程访问，起到线程的保护作用。 一般在公用变量的时候使用，如单例模式或者操作类的static变量中使用。
    @synchronized(self) {
        [self.threadA start];
        [self.threadB start];
        [self.threadC start];
    }
}
-(void)saleTicket{
    while (1) {
    //锁:必须是全局唯一的
    //1.注意枷锁的位置
    //2.注意枷锁的前提条件,多线程共享同一块资源
    //3.注意加锁是需要代价的,需要耗费性能的
    //4.加锁的结果:线程同步
        
    @synchronized(self) {
        //线程1
        //线程2
        //线程3
        NSInteger count = self.totalCount;
        if (count >0) {
            
            for (NSInteger i = 0; i<1000000; i++) {
            }
            
            self.totalCount = count - 1;
            //卖出去一张票
            NSLog(@"%@卖出去了一张票,还剩下%zd张票", [NSThread currentThread].name,self.totalCount);
        }else
        {
            NSLog(@"不要回公司上班了");
            break;
        }
        }
    }
    
}

#pragma mark ---------线程之间的通信-------------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
}

#pragma mark ---------线程之间的通信-------------
#pragma Methods

//开子线程下载图片,回到主线程刷新UI
-(void)download{
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
    
    //2.根据url下载图片二进制数据到本地
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    //3.转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
    
    NSLog(@"download----%@",[NSThread currentThread]);
    
    //4.回到主线程显示UI
    /*
     第一个参数:回到主线程要调用哪个方法
     第二个参数:前面方法需要传递的参数 此处就是image
     第三个参数:是否等待
     */
    //[self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:NO];
    
//    [self performSelector:@selector(showImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    
//    self.imageView.image = image;
    NSLog(@"---end---");
}


@end
