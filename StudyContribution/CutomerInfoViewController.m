//
//  CustomerInfoViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/19.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "CustomerInfoViewController.h"
#import "CustomNavigationController.h"
#import "SchoolInfoViewController.h"
#import "SettingViewController.h"

#define XMargin 107
#define YMargin 368

@interface CustomerInfoViewController ()

@property (nonatomic,strong) UILabel *nickname;
@property (nonatomic,strong) UILabel *schoolInfo;
@property (nonatomic,strong) UILabel *personalSignature;

@property (nonatomic,strong) UIButton *updatebtn;

//临时使用
@property (nonatomic,strong) UIButton *btn1;


@end

@implementation CustomerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.nickname];
    [self.view addSubview:self.schoolInfo];
    [self.view addSubview:self.personalSignature];
    
    [self.view addSubview:self.updatebtn];
    
    [self.view addSubview:self.btn1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 昵称label
- (UILabel *)nickname{
    if (!_nickname) {
        _nickname = [[UILabel alloc]initWithFrame:CGRectMake(XMargin, YMargin - 160, 200, 50)];
        _nickname.backgroundColor = [UIColor grayColor];
        _nickname.text = @"昵称";
        _nickname.textAlignment = NSTextAlignmentCenter;
    }
    return _nickname;
}

#pragma mark - 学校信息label

- (UILabel *)schoolInfo{
    if (!_schoolInfo) {
        _schoolInfo = [[UILabel alloc]initWithFrame:CGRectMake(XMargin-50, YMargin - 100, 300, 200)];
        _schoolInfo.backgroundColor = [UIColor purpleColor];
        _schoolInfo.font = [UIFont systemFontOfSize:25];
        _schoolInfo.textAlignment = NSTextAlignmentCenter;
        _schoolInfo.text = @"学校信息";
    }
    return _schoolInfo;
}

#pragma mark - 个人签名label

- (UILabel *)personalSignature{
    if (!_personalSignature) {
        _personalSignature = [[UILabel alloc]initWithFrame:CGRectMake(XMargin, YMargin + 110, 200, 50)];
        _personalSignature.backgroundColor = [UIColor orangeColor];
        _personalSignature.text = @"个人签名";
        _personalSignature.textAlignment = NSTextAlignmentCenter;
    }
    return _personalSignature;
}

#pragma mark - 修改信息

- (UIButton *)updatebtn{
    if (!_updatebtn) {
        _updatebtn = [[UIButton alloc]initWithFrame:CGRectMake(XMargin + 150, YMargin + 50, 100, 50)];
        
        _updatebtn.layer.cornerRadius = 5;
        
        _updatebtn.backgroundColor = [UIColor redColor];
        [_updatebtn setTitle:@"修改信息" forState:UIControlStateNormal];
        [_updatebtn addTarget:self action:@selector(updatebtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updatebtn;
}

- (void)updatebtnClick{
    SchoolInfoViewController *schoolInfoVC = [[SchoolInfoViewController alloc]init];
    CustomNavigationController *nav = [[CustomNavigationController alloc]initWithRootViewController:schoolInfoVC];
    ApplicationDelegate.window.rootViewController = nav;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark - 临时使用

- (UIButton *)btn1{
    if (!_btn1) {
        _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(107, 590, 200, 100)];
        _btn1.backgroundColor = [UIColor grayColor];
        [_btn1 setTitle:@"临时使用" forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (void)btn1Click{
    SettingViewController *setVC = [[SettingViewController alloc]init];
    CustomNavigationController *nav = [[CustomNavigationController alloc]initWithRootViewController:setVC];
    ApplicationDelegate.window.rootViewController = nav;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
