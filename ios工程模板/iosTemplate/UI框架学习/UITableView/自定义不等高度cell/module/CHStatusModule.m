//
//  CHStatusModule.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHStatusModule.h"

@implementation CHStatusModule

- (CGFloat)cellHeight {
    if(_cellHeight == 0){
        CGFloat space = 10;
        /** 图像 */
        CGFloat iconX = space;
        CGFloat iconY = space;
        CGFloat iconWH = 30;
        CGRect iconImageViewFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        /** 正文 */
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(iconImageViewFrame) + space;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
        NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        // 最大宽度是textW,高度不限制
        CGSize textSize = CGSizeMake(textW, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
        CGRect text_LabelFrame = CGRectMake(textX, textY, textW, textH);
        
        /** 配图 */
        if (self.picture) { // 有配图
            CGFloat pictureWH = 100;
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(text_LabelFrame) + space;
            CGRect pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
            _cellHeight = CGRectGetMaxY(pictureImageViewFrame) + space;
        } else {
            _cellHeight = CGRectGetMaxY(text_LabelFrame) + space;
        }
    }
    return _cellHeight;
}
@end
