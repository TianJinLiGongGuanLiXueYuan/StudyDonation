//
//  ResetPasswordViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/14.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "LoginViewController.h"
#import "regeisterViewController.h"

#define leftMargin 40
#define upMargin 150
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250
#define intervalDistance 50

@interface ResetPasswordViewController ()

@property (nonatomic,strong) UIButton *go_homebtn;

@property(nonatomic,strong)UILabel *setPasswordLab;
@property(nonatomic,strong)UILabel *confirmPasswordLab;

@property(nonatomic,strong)UITextField *setPasswordTextF;
@property(nonatomic,strong)UITextField *confirmPasswordTextF;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    
    //设置标题
    self.navitionBar.title_label.text = @"重置密码";
    
    //设置导航栏左按钮
    [self.navitionBar.left_btn setTitle:@"上一步" forState:UIControlStateNormal];
    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置控件
    [self.view addSubview:self.go_homebtn];
    
    [self.view addSubview:self.setPasswordLab];
    [self.view addSubview:self.setPasswordTextF];
    
    [self.view addSubview:self.confirmPasswordLab];
    [self.view addSubview:self.confirmPasswordTextF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.go_homebtn.frame = CGRectMake(100, 10, 100, 100);
}

#pragma mark - 界面控件

//密码
-(UILabel *)setPasswordLab
{
    if (!_setPasswordLab)
    {
        _setPasswordLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin, labelWidth, vHight)];
        _setPasswordLab.text = @"输入密码";
    }
    return _setPasswordLab;
}


-(UITextField *)setPasswordTextF
{
    if (!_setPasswordTextF) {
        _setPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin, textFiledWidth, vHight)];
        _setPasswordTextF.backgroundColor = [UIColor lightGrayColor];
        _setPasswordTextF.borderStyle = UITextBorderStyleLine;
    }
    return _setPasswordTextF;
}


//确认密码
-(UILabel *)confirmPasswordLab
{
    if (!_confirmPasswordLab)
    {
        _confirmPasswordLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin + vHight + intervalDistance, labelWidth, vHight)];
        _confirmPasswordLab.text = @"确认密码";
    }
    return _confirmPasswordLab;
}


-(UITextField *)confirmPasswordTextF
{
    if (!_confirmPasswordTextF) {
        _confirmPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin + vHight + intervalDistance, textFiledWidth, vHight)];
        _confirmPasswordTextF.backgroundColor = [UIColor lightGrayColor];
        _confirmPasswordTextF.borderStyle = UITextBorderStyleLine;
    }
    return _confirmPasswordTextF;
}



-(UIButton *)go_homebtn
{
    if(!_go_homebtn)
    {
        _go_homebtn = [[UIButton alloc] init];
        _go_homebtn.frame = CGRectMake(leftMargin, upMargin + 2*vHight + 4*intervalDistance, textFiledWidth + labelWidth, vHight);
        _go_homebtn.backgroundColor = [UIColor purpleColor];
        [_go_homebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_go_homebtn setTitle:@"确认重置" forState:UIControlStateNormal];
        [_go_homebtn addTarget:self action:@selector(gohomebtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _go_homebtn;
}


#pragma mark - 单击事件

-(void)gohomebtnclick
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    //[self presentViewController:loginVC animated:YES completion:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

//左按钮单击事件
-(void)leftbtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
