//
//  customControl.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "customControl.h"
#import "HCCustomView.h"

@interface customControl ()

@end

@implementation customControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCCustomView * customView =  [[HCCustomView alloc] init];
    customView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:customView];
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
