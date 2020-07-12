//
//  XIBController.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "XIBController.h"

@interface XIBController ()

@end

@implementation XIBController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示 xib
//    UIView *xibView = [[[NSBundle mainBundle] loadNibNamed:@"XIBView" owner:nil options:nil] firstObject];
//    xibView.frame = CGRectMake(0, 100, 200, 50);
//    [self.view addSubview: xibView];
    
    // 方式二
    UINib *nib = [UINib nibWithNibName:@"XIBView" bundle:nil];
    UIView *xibView = [[nib instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview: xibView];
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

@end
