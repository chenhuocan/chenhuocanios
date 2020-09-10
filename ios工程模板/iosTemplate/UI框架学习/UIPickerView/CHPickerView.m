//
//  CHPickerView.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHPickerView.h"

@interface CHPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) UIPickerView *pickView;
@end

@implementation CHPickerView

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置数据源
    self.pickView.dataSource = self;
    //2.设置代理
//    self.pickView.delegate = self;
    
}

// 总共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
// 每一列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}
// 每一列的宽度
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    return 100;
//}
// 每一行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}
//每行展示什么内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 1){
        return @"xmgxmg";
    }else{
        return @"xmg";
    }
    
}

//每行展示什么内容,带有属性的字符串,(大小,颜色,阴影,描边)
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//
//}

//每一行展示什么视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    
      return  [UIButton buttonWithType:UIButtonTypeContactAdd];
}

//当前选中的是哪一列的哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"component=%ld--row-%ld",component,row);
}

@end
