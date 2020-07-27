//
//  CHCarGroup.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/27.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHCarGroup : NSObject

@property (nonatomic,copy) NSString *header;

@property (nonatomic,copy) NSString * footer;

@property (nonatomic,strong) NSArray *cars;

@property (nonatomic ,copy)NSString * title;

+ (instancetype) carGroupWithDict:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END
