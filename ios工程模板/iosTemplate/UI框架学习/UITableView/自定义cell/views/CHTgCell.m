//
//  CHTgCellTableViewCell.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/28.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHTgCell.h"
#import "CHCellModule.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
//如果您想使用不带“mas_”前缀的圬工，请定义此常量
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
//如果希望为默认语法启用自动装箱，请定义此常量
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
@interface CHTgCell ()
/** 图标 */
@property (nonatomic,weak) UIImageView *iconImageView;
/** 标题 */
@property (nonatomic,weak) UILabel *titleLabel;
/** 价格 */
@property (nonatomic, weak) UILabel *priceLabel;
/** 购买数 */
@property (nonatomic, weak) UILabel *buyCountLabel;

@end

@implementation CHTgCell

// 在这个方法中添加左右的子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 图标
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        // 标题
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        // 价格
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview: priceLabel];
        self.priceLabel = priceLabel;
        
        // 购买数
        UILabel *buyCountLabel = [[UILabel alloc] init];
        buyCountLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
// 设置所有的子控件的frame
- (void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat space = 10;
//    CGFloat contentViewW = self.contentView.frame.size.width;
//    CGFloat contentViewH = self.contentView.frame.size.height;
//    // 图标
//    CGFloat iconX = space;
//    CGFloat iconY = space;
//    CGFloat iconW = 80;
//    CGFloat iconH = contentViewH - 2*space;
//
//    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//
//    // 标题
//    CGFloat titleX = iconX + iconW + space;
//    CGFloat titleY = iconY;
//    CGFloat titleW = contentViewW - titleX - space;
//    CGFloat titleH = 20;
//    self.titleLabel.frame =  CGRectMake(titleX, titleY, titleW, titleH);
//
//    // 价格
//    CGFloat priceW = 100;
//    CGFloat priceH = 15;
//    CGFloat priceX = titleX;
//    CGFloat priceY = iconY + iconH - priceH;
//    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
//
//    //购买数
//    CGFloat buyW = 150;
//    CGFloat buyH = 14;
//    CGFloat buyX = contentViewW - buyW - space;
//    CGFloat buyY = iconY + iconH - buyH;
//    self.buyCountLabel.frame = CGRectMake(buyX, buyY, buyW, buyH);
    
    // 自适应布局绘制界面
    CGFloat spcae = 10;
    /** 图标 */
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(spcae);
        make.bottom.equalTo(self.contentView).offset(-spcae);
        make.width.equalTo(80);
    }];
    
    /** 标题 */
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.top);
        make.left.equalTo(self.iconImageView.right).offset(spcae);
        make.right.equalTo(self.contentView).offset(-spcae);
        make.height.equalTo(20);
    }];
    /** 价格 */
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.left);
        make.bottom.equalTo(self.iconImageView.bottom);
        make.size.equalTo(CGSizeMake(100, 15));
    }];
    /** 购买数 */
    [self.buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImageView.bottom);
        make.right.equalTo(self.titleLabel.right);
        make.size.equalTo(CGSizeMake(150, 14));
        
    }];
    
    
}

/**
 *  设置子控件的数据
 */
- (void)setTg:(CHCellModule *)tg{
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",tg.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];

}

@end
