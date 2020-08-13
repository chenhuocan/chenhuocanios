//
//  CHXIBTgCell.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHXIBTgCell.h"
#import "CHCellModule.h"
@interface CHXIBTgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation CHXIBTgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // 初始化代码 可以改变xib 上的控件上的属性，在页面展示出来之前
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTg:(CHCellModule *)tg {
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",tg.price ];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
    
}

@end
