//
//  LogupViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "LogupViewController.h"
#import "moreViewController.h"
#import "LoginView.h"
#import "BaseInfoSave.h"

//引入第三方头文件
#import <SMS_SDK/SMSSDK.h>

#define leftMargin 40
#define upMargin 150
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250

@interface LogupViewController ()

@property (nonatomic,strong) UIButton *nextbtn;
@property(nonatomic,strong)LoginView *loginV;
@end

@implementation LogupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置页面标题
//    self.navitionBar.title_label.text = @"绑定手机";
//    
//    //设置页面左边的按钮
//    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
//    self.navitionBar.left_btn.frame = CGRectMake(0, 30, 50, 35);
//    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
    //设置控件
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_loginV];
    self.view.backgroundColor = [UIColor whiteColor];
    [_loginV.nextbtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _nextbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 50, 30)];
    _nextbtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_nextbtn];
    [_nextbtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [_loginV.leftBtn addTarget:self action:@selector(leftbtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)click
{
    // [BaseInfoSave sharedInstance];
    [[BaseInfoSave sharedInstance] saveTel:_loginV.telTextF.text];
    moreViewController *moreVC = [[moreViewController alloc] init];
    [self.navigationController pushViewController:moreVC animated:YES];
}

-(void)nextBtnClick
{
    //验证验证码是否正确。
    [SMSSDK commitVerificationCode:_loginV.verifyTexF.text phoneNumber:_loginV.telTextF.text zone:@"86" result:^(NSError *error) {
        //验证成功，打开下一页。
        if (!error) {
            NSLog(@"验证成功");
            [[BaseInfoSave sharedInstance] saveTel:_loginV.telTextF.text];
            moreViewController *moreVC = [[moreViewController alloc] init];
            [self.navigationController pushViewController:moreVC animated:YES];
        }
        else
        {
            UILabel *remindError = [[UILabel alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height-10, 200, 50)];
            remindError.text = @"验证码错误。";
            remindError.textColor = [UIColor redColor];
            _loginV.verifyTexF.text = @"";
            
            NSLog(@"错误信息:%@",error);
        }
    }];
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
