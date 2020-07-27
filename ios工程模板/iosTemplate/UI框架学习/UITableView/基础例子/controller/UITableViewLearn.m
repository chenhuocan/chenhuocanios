//
//  UITableViewLearn.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/7/14.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "UITableViewLearn.h"
#import "CHCarGroup.h" //引入模型
#import "CHCar.h"
#import "MJExtension.h"
@interface UITableViewLearn ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *carGroups; // 所有的车数据

@end

@implementation UITableViewLearn

//NSString *ID = @"wine";
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self carGroups];
    // 设置数据源
    self.tableView.dataSource = self;
    // 设置代理
    self.tableView.delegate = self;
    
    
//    // tableView 基本属性
//    //设置tableView每一行cell的高度
//    self.tableView.rowHeight = 100;
//    // 设置tableView每一组的尾部高度
//    self.tableView.sectionFooterHeight = 100;
//    // 设置tableView每一组的头部高度
//    self.tableView.sectionHeaderHeight = 100;
//
//    // 设置分割线的颜色
//    self.tableView.separatorColor = [UIColor redColor];
//    // 设置分割线的样式
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    // 设置表头控件
//    self.tableView.tableHeaderView = [[UISwitch alloc] init];
//    // 设置表尾控件
//    self.tableView.tableFooterView = [[UISwitch alloc] init];
//    设置索引条的文字颜色 ---------- 重点 索引条功能
    self.tableView.sectionIndexColor = [UIColor redColor];
    // 设置索引条的背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
    
  // 根据ID 这个标识 注册对应的cell类型 为UITableViewCell(只注册一次)  优化方式二 通过注册方式
  //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}
// 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}


#pragma mark ---UITableViewDataSource

/// tableView一共有多少组数据
/// @param tableView <#tableView description#>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}


/// tableView第section组有多少行
/// @param tableView <#tableView description#>
/// @param section <#section description#>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section == 0) { // 第0组
//           return 2;
//       } else if (section == 1){ // 第1组
//           return 6;
//       } else { // 最后 一组
//           return 1;
//       }
    CHCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

/// tableView每一行显示的内容(tableView每一行都是UITableViewCell或者它的子类)
/// @param tableView <#tableView description#>
/// @param indexPath <#indexPath description#>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    //性能优化---传统方式
    // 0、 定义一个重用的标识
    static NSString *cellID = @"为cell取名字";
    // 1、去缓存池中取是否可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    // 2、如果缓存池没有可循环利用的cell,自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    // 1.去缓存池中取是否有可循环利用的cell  优化方式二 通过注册方式
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3、设置数据

    
    //  没有性能优化的创建方式
    //  UITableViewCell *cell = [[UITableViewCell alloc] init];
    //  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    // 设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 取出indexPath.secton这组的组模型
    CHCarGroup * group = self.carGroups[indexPath.section];
    // 取出indexPath.row对应的车模型
    CHCar *car = group.cars[indexPath.row];
    //设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@",car.name];
//    cell.detailTextLabel.textColor = [UIColor orangeColor];
//       if (indexPath.section == 0) { // 第0组
//           if (indexPath.row == 0) { // 第0组第0行
//               cell.textLabel.text = @"通用";
//           } else if (indexPath.row == 1){ // 第0组第1行
//               cell.textLabel.text = @"隐私";
//           }
//       } else {
//           cell.textLabel.text = [NSString stringWithFormat:@"%ld组%zd行-其他数据",indexPath.section,indexPath.row];
//       }
//
    
    // 设置右边显示的指示控件
    cell.accessoryView = [[UISwitch alloc] init];
    // 设置选中样式
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    // 设置cell的背景View
    // backgroundView的优先级 > backgroundColor
    //    UIView *bg = [[UIView alloc] init];
    //    bg.backgroundColor = [UIColor blueColor];
    //    cell.backgroundView = bg;
        
    // 设置cell的背景颜色
    //    cell.backgroundColor = [UIColor redColor];
        
    // 设置cell选中时候的背景view
    //    UIView *selectedBg = [[UIView alloc] init];
    //    selectedBg.backgroundColor = [UIColor greenColor];
    //    cell.selectedBackgroundView =  selectedBg;
    return cell;
    
}

/// tableView每一组的头部标题
/// @param tableView <#tableView description#>
/// @param section <#section description#>
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//           return @"德系品牌";
//       } else {
//           return @"日系品牌";
//       }
    CHCarGroup *group = self.carGroups[section];
    // return group.header;
    return group.title;
}



/// tableView每一组的尾部标题 
/// @param tableView <#tableView description#>
/// @param section <#section description#>
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//          return @"德系品牌GHGHGHGHGHG";
//      } else {
//          return @"日系品牌HJHJHJKUUUUUU";
//      }
//
    // 取出第section组的组模型
    CHCarGroup *group = self.carGroups[section];
    return group.footer;
}

/**
 *  返回索引条的文字
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *titles = [NSMutableArray array];
//    for (CHGCarGroup *group in self.carGroups) {
//        [titles addObject:group.title];
//    }
//
//    return titles;
    
    // 抽取self.carGroups 这个数组中每一个元素(CHGCarGroup对象)的title属性的值,放在一个新的数组中返回
    return [self.carGroups valueForKeyPath:@"title"];
}



#pragma mark ---UITableViewDelegate


/// 选中了某一行cell就会调用这个方法
/// @param tableView <#tableView description#>
/// @param indexPath <#indexPath description#>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了:%ld",indexPath.row);
}

/// 取消选中了某一行cell就会调用这个方法
/// @param tableView <#tableView description#>
/// @param indexPath <#indexPath description#>
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"取消选中了:%ld",indexPath.row);
}


///  返回每一组显示的头部控件
/// @param tableView <#tableView description#>
/// @param section <#section description#>
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return [UIButton buttonWithType:UIButtonTypeContactAdd];
//}

/// 返回每一组显示的尾部控件
/// @param tableView <#tableView description#>
/// @param section <#section description#>
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
// return [UIButton buttonWithType:UIButtonTypeContactAdd];
//}


/// 返回每一组的头部高度
/// @param tableView <#tableView description#>
/// @param section <#section description#>
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 100;
//}


/// 返回每一组的尾部高度
/// @param tableView <#tableView description#>
/// @param section <#section description#>
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 100;
//}

/// 返回每一行cell的高度
/// @param tableView <#tableView description#>
/// @param indexPath <#indexPath description#>
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row % 2 == 0) {
//        return 100;
//    } else {
//        return 50;
//    }
//}
#pragma mark 模拟数据处理 懒加载
/********************************************************
1> plist解析:
以后遇到像这种复杂的plist,一层一层的往下解析.
最终的目的就是将所有的字典转成模型.
如果plist中字典在一个数组中,将来转出来的模型也放在一个数组中.
也就是将字典数组转成模型数组.

2> plist的好处:方便管理数据
*******************************************************/

/// 懒加载
- (NSArray *)carGroups {
    if(!_carGroups) {
        // 1. 加载字典数组
        //  NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil]];
    
        //        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cars" ofType:@"plist"]];
        //        // 2.字典数组->模型数组
        //        NSMutableArray *temp = [NSMutableArray array];
        //        for (NSDictionary *carGroupDict in dictArray) {
        //            CHCarGroup *group = [CHCarGroup carGroupWithDict:carGroupDict];
        //            [temp addObject:group];
        //        }
        //        _carGroups = temp;
        
        [CHCarGroup mj_setupObjectClassInArray:^NSDictionary *{
             return @{@"cars" : [CHCar class]};
        }];
        _carGroups = [CHCarGroup mj_objectArrayWithFilename:@"cars.plist"];
    }
    return _carGroups;
}
@end
