//
//  CHCellModule.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/29.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHCellModule : NSObject
/** 图标 */
@property (nonatomic, copy) NSString *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 价格 */
@property (nonatomic, copy) NSString *price;

/** 购买数 */
@property (nonatomic, copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
