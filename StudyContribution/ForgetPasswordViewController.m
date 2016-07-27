//
//  ForgetPasswordViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/13.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "LoginView.h"
#import "BaseInfoSave.h"

//引入第三方头文件
#import <SMS_SDK/SMSSDK.h>
#import "UIView+Toast.h"
#import "MBProgressHUD.h"
@interface ForgetPasswordViewController ()

@property (nonatomic,strong) UIButton *nextbtn;
@property(nonatomic,strong)LoginView *loginV;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置控件
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_loginV];
    self.view.backgroundColor = [UIColor whiteColor];
    [_loginV.leftBtn addTarget:self action:@selector(leftbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_loginV.nextbtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_loginV.nextbtn setTitle:@"重置" forState:UIControlStateNormal];
}
-(void)nextBtnClick
{
    if ( _loginV.setPasswordTextF.text .length != 0 && _loginV.confirmPasswordTextF.text.length != 0 &&_loginV.setPasswordTextF.text != _loginV.confirmPasswordTextF.text) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        hud.label.text = NSLocalizedString(@"两次密码不一致！", @"HUD done title");
        [hud hideAnimated:YES afterDelay:3.f];
    }
    else if(_loginV.setPasswordTextF.text .length != 0 &&  _loginV.confirmPasswordTextF.text.length != 0)
    {
        [[BaseInfoSave sharedInstance] saveOneInfoWithTel:_loginV.telTextF.text apassword:_loginV.setPasswordTextF.text];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
//左按钮单击事件
-(void)leftbtnClick
{
    [self.navigationController popViewControllerAnimated:YES ];
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
@end