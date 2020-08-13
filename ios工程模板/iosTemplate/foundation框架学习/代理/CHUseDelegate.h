//
//  CHUseDelegate.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 第一步
@protocol CHUseDelegate <NSObject>

// 可选的实现方法
@optional
- (void)CHUseGetString:( NSString*)str;
//必须的实现方法

@required
- (void)CHUseString:( NSString*)str;
@end

@interface CHUseDelegate : UIView
/** 第二步  代理属性*/
@property (nonatomic, weak) id<CHUseDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
