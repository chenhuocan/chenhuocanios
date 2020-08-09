//
//  CHStatusModule.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHStatusModule : NSObject
/** 图像 */
@property (nonatomic, copy) NSString *icon;

/** 昵称 */
@property (nonatomic, copy) NSString *name;

/** 正文(内容) */
@property (nonatomic, copy) NSString *text;

/** VIP */
@property (nonatomic, assign, getter=isVip) BOOL vip;

/** 配图 */
@property (nonatomic, copy) NSString *picture;
@end

NS_ASSUME_NONNULL_END
