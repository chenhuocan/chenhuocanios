//
//  CHUseDelegate.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHUseDelegate.h"

@implementation CHUseDelegate

// 实现 代理回调
- (void)plusButtonClick {

    if ([self.delegate respondsToSelector:@selector(CHUseGetString:)]) {
        [self.delegate CHUseGetString:@"返回值"];
    }
    
    if ([self.delegate respondsToSelector:@selector(CHUseString:)]) {
          [self.delegate CHUseString:@"返回值"];
    }
}

@end
