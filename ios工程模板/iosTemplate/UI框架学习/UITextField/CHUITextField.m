//
//  CHUITextField.m
//  iosTemplate
//
//  Created by 陈火灿 on 2020/8/31.
//  Copyright © 2020 陈火灿. All rights reserved.
//

#import "CHUITextField.h"

@interface CHUITextField ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;



@end

@implementation CHUITextField

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
}

/// 是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   return YES;
}
//开始编辑时调用(成为第一响应者)
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
//是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

//当结束编辑时调用
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%s",__func__);
}
//是否允许改变文本框内容(拦截用户输入)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}



@end
