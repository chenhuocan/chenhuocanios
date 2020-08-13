//
//  CHDelegate.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHDelegate.h"
#import "CHUseDelegate.h"

@interface CHDelegate ()<CHUseDelegate>

@end

@implementation CHDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    CHUseDelegate * use = [[CHUseDelegate alloc] init];
    use.delegate = self;
}


#pragma mark - CHUseDelegate

- (void)CHUseGetString:(NSString *)str {
    
}

- (void)CHUseSetString:(NSString *)str{
    
}
@end
