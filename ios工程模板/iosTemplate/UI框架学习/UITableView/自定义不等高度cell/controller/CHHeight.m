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
    return status.cellHeight;
}

@end
