//
//  CHTgCellTableViewCell.h
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/28.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CHCellModule;

@interface CHTgCell : UITableViewCell

/** 团购模型 */
@property (nonatomic, strong) CHCellModule *tg;
@end

NS_ASSUME_NONNULL_END
