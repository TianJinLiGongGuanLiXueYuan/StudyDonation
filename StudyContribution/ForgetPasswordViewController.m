//
//  ForgetPasswordViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/13.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ResetPasswordViewController.h"

#define leftMargin 40
#define upMargin 150
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250

@interface ForgetPasswordViewController ()

@property (nonatomic,strong) UIButton *nextbtn;
@property (nonatomic,strong) UILabel *telLab;
@property (nonatomic,strong) UILabel *verifyLab;
@property (nonatomic,strong) UITextField *telTextF;
@property (nonatomic,strong) UITextField *verifyTexF;
@property (nonatomic,strong) UIButton *inputBtn;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    // 设置页面标题
    self.navitionBar.title_label.text = @"手机验证";
    
    //设置页面左边的按钮
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    self.navitionBar.left_btn.frame = CGRectMake(0, 30, 50, 35);
    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置控件
    [self.view addSubview:self.nextbtn];
    
    [self.view addSubview:self.telLab];
    [self.view addSubview:self.teltexF];
    [self.view addSubview:self.inputBtn];
    [self.view addSubview:self.verifyLab];
    [self.view addSubview:self.verifyTexF];
    
}



#pragma mark - 界面控件

// 手机号 label
-(UILabel *)telLab
{
    if(!_telLab)
    {
        _telLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin, labelWidth, vHight)];
        _telLab.text = @"手机号";
    }
    return _telLab;
}

//手机号textfiled
-(UITextField *)teltexF
{
    if(!_telTextF)
    {
        _telTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin + labelWidth, upMargin, textFiledWidth, vHight)];
        _telTextF.backgroundColor = [UIColor lightGrayColor];
        _telTextF.borderStyle = UITextBorderStyleLine;
    }
    return _telTextF;
}

//发送验证码  按钮
-(UIButton *)inputBtn
{
    if(!_inputBtn)
    {
        _inputBtn = [[UIButton alloc] initWithFrame:CGRectMake(leftMargin, upMargin*2, textFiledWidth + labelWidth, vHight)];
        [_inputBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _inputBtn.backgroundColor = [UIColor purpleColor];
        [_inputBtn addTarget:self action:@selector(sendVerifyNum) forControlEvents:UIControlEventTouchUpInside];
    }
    return _inputBtn;
}

// 输入验证码 label
-(UILabel *)verifyLab
{
    if(!_verifyLab)
    {
        _verifyLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin*3, labelWidth, vHight)];
        _verifyLab.text = @"验证码";
    }
    return _verifyLab;
}


//验证码  textfiled
-(UITextField *)verifyTexF
{
    if(!_verifyTexF)
    {
        _verifyTexF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin + labelWidth, upMargin*3, textFiledWidth, vHight)];
        _verifyTexF.backgroundColor = [UIColor lightGrayColor];
        _verifyTexF.borderStyle = UITextBorderStyleLine;
    }
    return _verifyTexF;
}

//下一步  按钮
-(UIButton *)nextbtn
{
    if(!_nextbtn)
    {
        _nextbtn = [[UIButton alloc] initWithFrame:CGRectMake(leftMargin, upMargin*4, textFiledWidth + labelWidth, vHight)];
        [_nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextbtn.backgroundColor = [UIColor purpleColor];
        [_nextbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextbtn;
}


#pragma mark - 单机事件
-(void)sendVerifyNum
{
    
}
-(void)nextbtnclick
{
    ResetPasswordViewController *resetVC = [[ResetPasswordViewController alloc] init];
    
    [self.navigationController pushViewController:resetVC animated:YES];
    
    //    [self presentViewController:moreVC animated:YES completion:^{
    //
    //
    //    }];
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}


//左按钮单击事件
-(void)leftbtnClick
{
    [self.navigationController popViewControllerAnimated:YES ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
