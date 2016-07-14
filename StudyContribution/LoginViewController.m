//
//  LoginViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "LoginViewController.h"
#import "LogupViewController.h"
#import "regeisterViewController.h"
#import "CustomNavigationController.h"
#import "ContributionDetailViewController.h"
#import "SettingViewController.h"
#import "ForgetPasswordViewController.h"
#import "CustomnavView.h"


#define leftMargin 40
#define upMargin 180
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250

@interface LoginViewController ()
@property (nonatomic,strong) UIButton *loginupbtn;
@property (nonatomic,strong) UIButton *gobackbtn;

//界面控件
@property(nonatomic,strong)UILabel *userNameLab;
@property(nonatomic,strong)UILabel *passwordLab;

@property(nonatomic,strong)UITextField *userNameTextF;
@property(nonatomic,strong)UITextField *passwordTextF;

@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *resisterBtn;
@property(nonatomic,strong)UIButton *forgetBtn;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    
    
    [self.view addSubview:self.userNameLab];
    [self.view addSubview:self.passwordLab];
    
    [self.view addSubview:self.userNameTextF];
    [self.view addSubview:self.passwordTextF];
    
    [self.view addSubview:self.forgetBtn];
    
    [self.view addSubview:self.loginupbtn];
    [self.view addSubview:self.gobackbtn];
    
    
    
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.loginupbtn.frame = CGRectMake(10, 10, 100, 100);
//    self.gobackbtn.frame = CGRectMake(150, 500, 100, 100);
}

#pragma mark - 登陆界面控件 getter  方法

//手机号label
-(UILabel *)userNameLab
{
        if(!_userNameLab)
        {
            _userNameLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin, labelWidth,vHight)];
          //  _userNameLab.lineBreakMode = UILineBreakModeWordWrap;
            _userNameLab.numberOfLines = 0;
            _userNameLab.text = @"手机号";
        }
        return _userNameLab;
}

//密码label
-(UILabel *)passwordLab
{
    if (!_passwordLab)
    {
        _passwordLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin+vHight+20, labelWidth, vHight)];
        _passwordLab.text = @"密    码";
    }
    return _passwordLab;
}

//手机号textfiled
-(UITextField *)userNameTextF
{
    if (!_userNameTextF) {
        _userNameTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin, textFiledWidth, vHight)];
        _userNameTextF.backgroundColor = [UIColor lightGrayColor];
        _userNameTextF.borderStyle = UITextBorderStyleLine;
    }
    return _userNameTextF;
}

//密码textfiled
-(UITextField *)passwordTextF
{
    if(!_passwordTextF)
    {
        _passwordTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin+vHight+20, textFiledWidth, vHight)];
        _passwordTextF.backgroundColor = [UIColor lightGrayColor];
        _passwordTextF.borderStyle = UITextBorderStyleLine;
        _passwordTextF.secureTextEntry=YES;
    }
    return _passwordTextF;
}


//登陆按钮
-(UIButton *)gobackbtn
{
    if(!_gobackbtn)
    {
        _gobackbtn = [[UIButton alloc] init];
        _gobackbtn.frame = CGRectMake(0.1*[UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height)/2,0.8*[UIScreen mainScreen].bounds.size.width, vHight);
        [_gobackbtn addTarget:self action:@selector(gobackbtnclick) forControlEvents:UIControlEventTouchUpInside];
        [_gobackbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _gobackbtn.backgroundColor = [UIColor purpleColor];
        [_gobackbtn setTitle:@"登陆" forState:UIControlStateNormal];
    }
    return _gobackbtn;
}


//注册按钮
-(UIButton *)loginupbtn
{
    if(!_loginupbtn)
    {
        _loginupbtn = [[UIButton alloc] init];
        _loginupbtn.frame = CGRectMake(leftMargin, 0.6*[UIScreen mainScreen].bounds.size.height,0.3*[UIScreen mainScreen].bounds.size.height, vHight);
        [_loginupbtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_loginupbtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginupbtn addTarget:self action:@selector(tologupbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginupbtn;
}


//忘记密码  按钮
-(UIButton *)forgetBtn
{
    if (!_forgetBtn)
    {
        _forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftMargin + 0.4*[UIScreen mainScreen].bounds.size.width, 0.6*[UIScreen mainScreen].bounds.size.height,  0.3*[UIScreen mainScreen].bounds.size.height, vHight)];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetBtn addTarget:self action:@selector(forgetbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}


#pragma mark - 单机事件
//加载tabbar
-(void)gobackbtnclick
{
//    ApplicationDelegate.window;
//    ((AppDelegate *)[UIApplication sharedApplication].delegate)
    //    ApplicationDelegate.window.root
    
    
    
    regeisterViewController *regeisterVC=[[regeisterViewController alloc]init];
    regeisterVC.title = @"vc1";
    CustomNavigationController *nc1 = [[CustomNavigationController alloc] initWithRootViewController:regeisterVC];
    
    ContributionDetailViewController *vc2 = [[ContributionDetailViewController alloc] init];
    vc2.title = @"vc2";
    vc2.view.backgroundColor = [UIColor redColor];
    CustomNavigationController *nc2 = [[CustomNavigationController alloc] initWithRootViewController:vc2];
    
    
    SettingViewController *vc3 = [[SettingViewController alloc] init];
    vc3.title = @"vc3";
    vc3.view.backgroundColor = [UIColor purpleColor];
    CustomNavigationController *nc3 = [[CustomNavigationController alloc] initWithRootViewController:vc3];
    
    
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = [NSArray arrayWithObjects:nc1, nc2, nc3, nil];
    //UITabBarController *tbc = [[UITabBarController alloc] init];
    
    NSArray *titleArr = @[@"首页",@"详情",@"设置"];
    //    NSArray *imgArr = @[@"home",@"hot",@"consulting"];
    for (int i = 0; i < titleArr.count; i ++) {
        UITabBarItem *item = tbc.tabBar.items[i];
        
        item.title = titleArr[i];
        
        //        UIImage *img = [UIImage imageNamed:imgArr[i]];
        //        item.image = [[img compressImageToSize:CGSizeMake(20, 20)]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        //
    }

    
    
//    regeisterViewController *homeVC=[[regeisterViewController alloc]init];
    ApplicationDelegate.window.rootViewController=tbc;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)tologupbtnclick
{
    LogupViewController *logupVC =[[LogupViewController alloc] init];
    [self.navigationController pushViewController:logupVC animated:YES];
    
}

-(void)forgetbtnclick
{
    ForgetPasswordViewController *forgetVC =[[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}





@end
