//
//  LogupViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "LogupViewController.h"
#import "moreViewController.h"

#define leftMargin 40
#define upMargin 150
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250

@interface LogupViewController ()

@property (nonatomic,strong) UIButton *nextbtn;

@property (nonatomic,strong) UILabel *telLab;
@property (nonatomic,strong) UILabel *verifyLab;
@property (nonatomic,strong) UITextField *telTextF;
@property (nonatomic,strong) UITextField *verifyTexF;
@property (nonatomic,strong) UIButton *inputBtn;

@end

@implementation LogupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navitionBar.title_label.text = @"绑定手机";
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nextbtn];
    
    [self.view addSubview:self.telLab];
    [self.view addSubview:self.teltexF];
    [self.view addSubview:self.inputBtn];
    [self.view addSubview:self.verifyLab];
    [self.view addSubview:self.verifyTexF];
    
    self.navitionBar.left_btn.titleLabel.text = @"绑定手机";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.nextbtn.frame = CGRectMake(100, 300, 100, 100);
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
    moreViewController *moreVC = [[moreViewController alloc] init];
    
    [self.navigationController pushViewController:moreVC animated:YES];
    
//    [self presentViewController:moreVC animated:YES completion:^{
//        
//        
//    }];
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}
@end