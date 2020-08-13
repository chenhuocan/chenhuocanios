//
//  CHPerson.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/10.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CHDog;
@interface CHPerson : NSObject
/** 姓名 */
@property (nonatomic, copy) NSString *name;

/** 钱 */
@property (nonatomic, assign) float money;

/** 狗 */
@property (nonatomic,strong) CHDog *dog;

/** 序号 */
@property (nonatomic,copy) NSString *no;

- (void)printAge;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)personWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
