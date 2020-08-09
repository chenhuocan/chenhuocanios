//
//  CHStatusCellTableViewCell.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CHStatusModule;
@interface CHStatusCellTableViewCell : UITableViewCell
/** 微博模型 */
@property (nonatomic, strong) CHStatusModule *status;

@end

NS_ASSUME_NONNULL_END
