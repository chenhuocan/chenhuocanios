//
//  CHHeight.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/9.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHHeight.h"
#import "CHStatusCellTableViewCell.h"
#import "CHStatusModule.h"
#import "MJExtension.h"

@interface CHHeight ()
/** 所有的微博数据 */
@property (nonatomic, strong) NSArray *statuses;
@end


/// <#Description#>
@implementation CHHeight

- (NSArray *)statuses{
    if (!_statuses) {
        _statuses = [CHStatusModule mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CHStatusCellTableViewCell class] forCellReuseIdentifier:@"status"];
}

#pragma mark - 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 访问缓存池
     CHStatusCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"status"];
     // 传递模型数据
     cell.status = self.statuses[indexPath.row];
    return cell;
}


#pragma mark - 代理方法
// 得出方案:在这个方法返回之前就要计算cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    CHStatusModule *status = self.statuses[indexPath.row];
    
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
    CGFloat textH = [status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    CGRect text_LabelFrame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat cellHeight = 0;
    /** 配图 */
    if (status.picture) { // 有配图
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(text_LabelFrame) + space;
        CGRect pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        cellHeight = CGRectGetMaxY(pictureImageViewFrame) + space;
    } else {
        cellHeight = CGRectGetMaxY(text_LabelFrame) + space;
    }

    return cellHeight;
}

@end
