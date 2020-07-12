//
//  XIBView.h
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XIBView : UIView
// 提供set方法
- (void)setIcon: (NSString *)icon;
- (void)setName: (NSString *)name;

// 提供快速创建方法
+ (instancetype)shopView;
@end

NS_ASSUME_NONNULL_END
