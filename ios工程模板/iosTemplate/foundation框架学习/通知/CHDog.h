//
//  CHDog.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/10.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHDog : NSObject
// 姓名
@property (nonatomic,copy) NSString *name;

// 价格
@property (nonatomic,assign) float price;
@end

NS_ASSUME_NONNULL_END
