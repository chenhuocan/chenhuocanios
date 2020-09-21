//
//  CHNSURLConnetion.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/9/12.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHNSURLConnetion.h"

@interface CHNSURLConnetion ()<NSURLConnectionDataDelegate>

@end

@implementation CHNSURLConnetion

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)post{
    //1.确定请求路径
    
    NSString *urlStr = @"http://120.25.226.186:32812/登录2";
    //中文转码操作
    urlStr =  [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //2.创建一个请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    //注意:key一定要一致(用于传递数据给后台)
    [request setValue:@"ios 10.1" forHTTPHeaderField:@"User-Agent"];
    request.HTTPBody = [@"username=小码哥&pwd=520it" dataUsingEncoding:NSUTF8StringEncoding];
    //2.3请求超时
    request.timeoutInterval = 5;
    
    //3.把请求发送给服务器,发送一个异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * __nullable response, NSData * __nullable data, NSError * __nullable connectionError) {
        
        //4.解析服务器返回的数据
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"------%@",str);
    }];
}



#pragma get 的请求
/*  代码说明：该代码演示如何使用NSURLConnection发送GET请求
*      涉及知识点：
*          01 如何使用NSURLConnection发送同步请求
*          02 如何使用NSURLConnection发送异步请求（sendAsynchronousRequest）
*          03 如何使用NSURLConnection发送异步请求（使用代理的方式）
*          04 SVProgressHUD的简单使用
*          05 简单的数据解析（截取操作）
*/


/*
 请求:请求头(NSURLRequest默认包含)+请求体(GET没有)
 响应:响应头(真实类型--->NSHTTPURLResponse)+响应体(要解析的数据)
 */
#pragma mark ----------------------
#pragma mark Methods
-(void)sync
{
    /*
     GET:http://120.25.226.186:32812/login?username=123&pwd=456&type=JSON
     协议+主机地址+接口名称+?+参数1&参数2&参数3
     post:http://120.25.226.186:32812/login
     协议+主机地址+接口名称
     */
    //GET,没有请求体
    //1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    
    //2.创建请求对象
    //请求头不需要设置(默认的请求头)
    //请求方法--->默认为GET
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    //3.发送请求
    //真实类型:NSHTTPURLResponse
    NSHTTPURLResponse *response = nil;
    /*
     第一个参数:请求对象
     第二个参数:响应头信息
     第三个参数:错误信息
     返回值:响应体
     */
    //该方法是阻塞的,即如果该方法没有执行完则后面的代码将得不到执行
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    //4.解析 data--->字符串
    //NSUTF8StringEncoding
    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
    NSLog(@"%zd",response.statusCode);
}

-(void)async
{
    //1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    
    //2.创建请求对象
    //请求头不需要设置(默认的请求头)
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    //3.发送异步请求
    /*
     第一个参数:请求对象
     第二个参数:队列 决定代码块completionHandler的调用线程
     第三个参数:completionHandler 当请求完成(成功|失败)的时候回调
        response:响应头
        data:响应体
        connectionError:错误信息
     */
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
       
        //4.解析数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        NSLog(@"%zd",res.statusCode);
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

-(void)delegate
{
    //1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=123&pwd=123&type=JSON"];
    
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.设置代理,发送请求
    //3.1
    //[NSURLConnection connectionWithRequest:request delegate:self];
    
    //3.2
    //[[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    //3.3 设置代理,时候发送请求需要检查startImmediately的值
    //(startImmediately == YES 会发送 | startImmediately == NO 则需要调用start方法)
    NSURLConnection * connect = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
    
    //调用开始方法
    [connect start];
    
//    [connect cancel];//取消
}

#pragma mark ----------------------
#pragma mark NSURLConnectionDataDelegate
//1.当接收到服务器响应的时候调用
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%s",__func__);
}

//2.接收到服务器返回数据的时候调用,调用多次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
     NSLog(@"%s",__func__);
    
    //拼接数据

}
//3.当请求失败的时候调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
     NSLog(@"%s",__func__);
}

//4.请求结束的时候调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
     NSLog(@"%s",__func__);
    
//    NSLog(@"%@",[[NSString alloc]initWithData:self.resultData encoding:NSUTF8StringEncoding]);
}
@end
