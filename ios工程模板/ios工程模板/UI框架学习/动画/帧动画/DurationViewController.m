//
//  DurationViewController.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "DurationViewController.h"

@interface DurationViewController ()
@property(nonatomic,weak) UILabel *label;
@end

@implementation DurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.label];
    [self showHubInfo:@"你们好"];
}


- (void)showHubInfo:(NSString *)hubInfo
{
    // 3.1.改变指示器上面显示的文字
    self.label.text = hubInfo;
    
    // 3.2.出现动画和消失动画
    [UIView animateWithDuration:1.0 animations:^{
        self.label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.label.alpha = 0.0;
        } completion:nil];
    }];
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
