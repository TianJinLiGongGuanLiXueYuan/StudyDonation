//
//  CustomerInfoViewController.m
//  StudyContribution
//
//  Created by Student01 on 16/7/21.
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

@end

@implementation CustomerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nickname];
    [self.view addSubview:self.schoolInfo];
    [self.view addSubview:self.personalSignature];
    
    [self.view addSubview:self.updatebtn];
    
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
    [self.navigationController pushViewController:schoolInfoVC animated:YES];
}


#pragma mark - 返回按钮

-(void)left_btnclick
{
    [self.navigationController popViewControllerAnimated:YES];
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
