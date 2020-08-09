//
//  CHStatusCellTableViewCell.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHStatusCellTableViewCell.h"
#import "CHStatusModule.h"
#define XMGTextFont [UIFont systemFontOfSize:14]
#define XMGNameFont [UIFont systemFontOfSize:14]

@interface CHStatusCellTableViewCell ()

/** 图像 */
@property (nonatomic, weak) UIImageView *iconImageView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** vip */
@property (nonatomic, weak) UIImageView *vipImageView;
/** 正文 */
@property (nonatomic, weak) UILabel *text_Label;
/** 配图 */
@property (nonatomic, weak) UIImageView *pictureImageView;
@end
@implementation CHStatusCellTableViewCell


// 添加子控件的原则:把所有有可能显示的子控件都先添加进去
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 图像 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 配图 */
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        /** vip */
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.contentMode = UIViewContentModeCenter;
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = XMGNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 正文 */
        UILabel *text_Label = [[UILabel alloc] init];
        text_Label.font = XMGTextFont;
        text_Label.numberOfLines = 0;
        [self.contentView addSubview:text_Label];
        self.text_Label = text_Label;
    }
    return self;
}
- (void)setStatus:(CHStatusModule *)status{
    _status = status;
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipImageView.hidden = NO;
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.text_Label.text = status.text;
    
    if (status.picture) { // 有配图
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    } else { // 无配图
        self.pictureImageView.hidden = YES;
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
