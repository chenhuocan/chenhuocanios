//
//  CHCustomTable.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/28.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHCustomTable.h"
#import "CHTgCell.h"
#import "CHCellModule.h"
#import "MJExtension.h"
#import "CHXIBTgCell.h"
@interface CHCustomTable ()
/** 所有的团购数据 */
@property (nonatomic, strong) NSArray *tgs;
@end

@implementation CHCustomTable

NSString *ID = @"tg";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    // 1 使用代码画页面
    // [self.tableView registerClass:[CHTgCell class] forCellReuseIdentifier:ID];
    //2、 使用 xib 画页面
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CHXIBTgCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    // 使用storyboard 画页面  一般不常用
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 使用代码画页面
    //CHTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 访问缓存池
    // 使用 xib 画页面
    CHXIBTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 设置数据
    cell.tg = self.tgs[indexPath.row];
    
    
    
//  通过storyboard 画页面。并不同类型cell共存
//    if (indexPath.row % 2 == 0) {
//        static NSString *ID = @"tg";
//        // 访问缓存池
//        CHXIBTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//
//        // 设置数据(传递模型)
//        cell.tg = self.tgs[indexPath.row];
//        return cell;
//    } else {
//        return [tableView dequeueReusableCellWithIdentifier:@"test"];
//    }
    return cell;
}


#pragma mark  ---请求数据
- (NSArray *) tgs {
    // 使用第三方库 字典转模型
    if(!_tgs) {
        _tgs = [CHCellModule mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

//- (NSArray *)tgs{
//    // 使用kvc 字典转模型
//    if (!_tgs) {
//
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
//
//        NSMutableArray *temp = [NSMutableArray array];
//        for (NSDictionary *tgDict in dictArray) {
//            [temp addObject:[CHCellModule tgWithDict:tgDict]];
//        }
//
//        _tgs = temp;
//    }
//    return _tgs;
//}
@end
