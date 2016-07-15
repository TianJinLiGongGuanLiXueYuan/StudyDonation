//
//  regeisterViewController.m
//  StudyContribution
//
//  Created by 刘芮东 on 16/7/12.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "regeisterViewController.h"
#import "LoginViewController.h"
#import "CustomNavigationController.h"
#import "ClassInfoViewController.h"


@interface regeisterViewController ()

@property (nonatomic,strong) UIButton *tolotin;
@property (nonatomic,strong) UIButton *classinbtn;
@property (nonatomic,strong) UIButton *classupbtn;
@property (nonatomic,strong) UILabel *classDetail;

@property (nonatomic,strong) UIButton *classinfobtn;

@end

@implementation regeisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tolotin];
    [self.view addSubview:self.classinbtn];
    [self.view addSubview:self.classupbtn];
    [self.view addSubview:self.classDetail];
    [self.view addSubview:self.classinfobtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tolotin.frame = CGRectMake(100, 100, 100, 100);
    self.classinbtn.frame = CGRectMake(self.view.bounds.size.width/2-50, self.view.bounds.size.height/2-160, 100, 100);
    self.classupbtn.frame = CGRectMake(self.view.bounds.size.width/2-50, self.view.bounds.size.height/2-50, 100, 100);
    
    self.classinfobtn.frame = CGRectMake(10,70, 100, 40);
}

-(UIButton *)tolotin
{
    if(!_tolotin)
    {
        _tolotin = [[UIButton alloc] init];
        _tolotin.backgroundColor = [UIColor blueColor];
        [_tolotin setTitle:@"到登录界面" forState:UIControlStateNormal];
        [_tolotin addTarget:self action:@selector(tolotinbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tolotin;
}

-(void)tolotinbtnclick
{
    LoginViewController *logIn=[[LoginViewController alloc]init];
    
    CustomNavigationController *nav=[[CustomNavigationController alloc]initWithRootViewController:logIn];
    ApplicationDelegate.window.rootViewController=nav;
    //    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

-(void)leftbtnClick{
    NSLog(@"aa");
}

#pragma mark - 上下课按钮配置

//class info
-(UIButton *)classinfobtn
{
    if(!_classinfobtn)
    {
        _classinfobtn = [[UIButton alloc]init];
        _classinfobtn.backgroundColor = [UIColor lightGrayColor];
        [_classinfobtn setTitle:@"课程详情" forState:UIControlStateNormal];
        [_classinfobtn addTarget:self action:@selector(classinfobtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classinfobtn;
}

-(void)classinfobtnclick
{
    ClassInfoViewController *classinfoVC = [[ClassInfoViewController alloc]init];
    [self.navigationController pushViewController:classinfoVC animated:YES];
    
}
// 上课按钮
- (UIButton *)classinbtn{
    if(!_classinbtn)
    {
        _classinbtn = [[UIButton alloc] init];
        _classinbtn.backgroundColor = [UIColor purpleColor];
        [_classinbtn setTitle:@"上课" forState:UIControlStateNormal];
        [_classinbtn addTarget:self action:@selector(classinbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classinbtn;
}

- (void)classinbtnClick{
    
}

//下课
- (UIButton *)classupbtn{
    if(!_classupbtn)
    {
        _classupbtn = [[UIButton alloc] init];
        _classupbtn.backgroundColor = [UIColor orangeColor];
        [_classupbtn setTitle:@"下课" forState:UIControlStateNormal];
        [_classupbtn addTarget:self action:@selector(classupbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classupbtn;
}

- (void)classupbtnClick{
}

#pragma mark - 当前状态

-(UILabel *)classDetail
{
    if(!_classDetail)
    {
        _classDetail = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2, 400, 200, 200)];
        _classDetail.text = @"XXX";
    }
    return _classDetail;
}

@end
