//
//  XIBView.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

/**
  xib使用注意事项:
  1> 如果一个view从xib中加载,就不能用[xxx alloc] init] 和 [xxx alloc] initWithFrame:]创建
  2> 如果一个xib经常被使用,应该提供快速构造类方法
  3> 如果一个view从xib中加载:
     用代码添加一些子控件,得在 initWithCoder: 和 awakeFromNib 创建
  4> 如果一个view从xib中加载,会调用initWithCoder: 和 awakeFromNib,不会调用init和initWithFrame:方法
*/
#import "XIBView.h"
@interface XIBView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** 测试label */
@property (nonatomic, weak) UILabel *label;
/** 毛玻璃 */
@property (nonatomic, weak) UIToolbar *toolBar;
@end
@implementation XIBView
//  如果View从xib中加载,就不会调用init和initWithFrame:方法
//- (instancetype)init {
//    if (self = [super init]) {
//
//    }
//    return self;
//}
//// 子控件的初始化
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [self initWithFrame:frame]){
//        // 创建图片的UIImageView 对象
//        // 创建标题对象(UILabel)
//        // 创建子标题对象(UIlabel)
//        // 创建跟帖对象(UIButton)
//
//        // 以前 是要在这边创建这些控件 ，但是现在在xib上创建了
//        // 就像 storyboard 拖控件 Controller文件中写控件一样
//        // uiview 对应 xib
//        // viewController 对应 storyboard
//    }
//    return self;
//}


/**
*  如果View从xib中加载,就会调用initWithCoder:方法
*  创建子控件,...
   注意: 如果子控件是从xib中创建,是处于未唤醒状态
*/

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
    // 使用xib 自定义控件后，已经在xib 拖控件了 又想在代码文件中写代码 创建控件 要在这边创建
    /*
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor grayColor];
        label.text = @"哈哈哈哈哈哈";
        [self addSubview:label];
        self.label = label;
     */
        NSLog(@"1");
    }
    return self;
}


#pragma mark - xib的加载原理
- (UIView *)loadFormNib {
    XIBView *shopView = [[XIBView alloc] initWithCoder:nil];
    shopView.frame = CGRectMake(0, 0, 80, 100);

    UIImageView *iconView = [[UIImageView alloc] initWithCoder:nil];
    iconView.backgroundColor = [UIColor greenColor];
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.tag = 100;
    [shopView addSubview:iconView];
    self.iconView = iconView;

    UILabel *label = [[UILabel alloc] initWithCoder:nil];
    label.backgroundColor = [UIColor orangeColor];
    label.tag = 200;
    [shopView addSubview:label];
    self.titleLabel = label;
     
     return shopView;
}

/**
 *  从xib中唤醒
    添加 xib中创建的子控件 的子控件
 */
- (void)awakeFromNib{
    // 往imageView上加毛玻璃
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    [self.iconView addSubview:toolBar];
    self.toolBar = toolBar;
    NSLog(@"2");
}



#pragma mark - 快速构造方法
+ (instancetype)shopView{
    // 推荐使用这种写法
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
//    return [[[NSBundle mainBundle] loadNibNamed:@"XIBView" owner:nil options:nil] firstObject];
}



#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    /*
    self.label.frame = self.bounds;
     */
    self.toolBar.frame = self.iconView.bounds;
}


#pragma mark - 设置数据
- (void)setIcon:(NSString *)icon{
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setName:(NSString *)name{
    self.titleLabel.text = name;
}
@end
