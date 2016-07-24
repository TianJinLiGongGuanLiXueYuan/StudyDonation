//
//  LogupViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "LogupViewController.h"
#import "LoginView.h"
#import "BaseInfoSave.h"

//引入第三方头文件
#import <SMS_SDK/SMSSDK.h>

//引入hub头文件
#import "UIView+Toast.h"
#import "MBProgressHUD.h"

@interface LogupViewController ()

@property (nonatomic,strong) UIButton *nextbtn;
@property(nonatomic,strong)LoginView *loginV;
@end

@implementation LogupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置控件
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_loginV];
    self.view.backgroundColor = [UIColor whiteColor];
    [_loginV.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_loginV.nextbtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
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
//-(void)nextBtnClick
//{
//    //验证验证码是否正确。
//    [SMSSDK commitVerificationCode:_loginV.verifyTexF.text phoneNumber:_loginV.telTextF.text zone:@"86" result:^(NSError *error) {
//        //验证成功，打开下一页。
//        if (!error) {
//            NSLog(@"验证成功");
//          //  [self.navigationController pushViewController:moreVC animated:YES];
//        }
//        else
//        {
//            UILabel *remindError = [[UILabel alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height-10, 200, 50)];
//            remindError.text = @"验证码错误。";
//            remindError.textColor = [UIColor redColor];
//            _loginV.verifyTexF.text = @"";
////            NSString *s = @"验证码错误";
////            [self.navigationController.view makeToast:s duration:3.0 position:CSToastPositionCenter title:nil image:nil style:nil completion:nil];
//            
//            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//            // Set the custom view mode to show any view.
//            hud.mode = MBProgressHUDModeCustomView;
//            // Set an image view with a checkmark.
//            UIImage *image = [[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//            hud.customView = [[UIImageView alloc] initWithImage:image];
//            // Looks a bit nicer if we make it square.
//            hud.square = YES;
//            // Optional label text.
//            hud.label.text = NSLocalizedString(@"验证码错误！", @"HUD done title");
//            [hud hideAnimated:YES afterDelay:3.f];
//            
//            NSLog(@"错误信息:%@",error);
//        }
//    }];
//}

#pragma mark - 单击事件
//左按钮单击事件

-(void)leftBtnClick
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
