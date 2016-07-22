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

@property(nonatomic,strong)UIImage *usernameimage;
@property(nonatomic,strong)UIImage *passwordimage;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.view addSubview:self.userNameLab];
    [self.view addSubview:self.passwordLab];
    
    [self.view addSubview:self.userNameTextF ];
    [self.view addSubview:self.passwordTextF];
    
    [self.view addSubview:self.forgetBtn];
    
    [self.view addSubview:self.loginupbtn];
    [self.view addSubview:self.gobackbtn];
    
    //用户密码字典
    _mutableDic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"123",@"123",@"002",@"002",@"003",@"003",nil];
    
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




- (void) login {
    
    //1.得到用户名和密码
    NSString *name = self.userNameTextF.text;
    NSString *pass = self.passwordTextF.text;
    //2.判断用户名和密码是否正确
//    if ([name isEqual:@"123"] && [pass isEqual:[_mutableDic objectForKey:@"123"]]) {
    
        regeisterViewController *regeisterVC=[[regeisterViewController alloc]init];
   
        
    
        CustomNavigationController *nav2=[[CustomNavigationController alloc]initWithRootViewController:regeisterVC];
            
        ApplicationDelegate.window.rootViewController=nav2;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
//    else{
    
        //错误提示框
        NSString *message  = @"用户名或密码错误，请重新输入";
        //a.对话框主体
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"错误" message:message preferredStyle:UIAlertControllerStyleAlert];
        //b.对话框下边确定按钮 参数1 按钮标题 参数2 按钮样式
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        //c.把按钮添加到弹出框中
        [alert addAction:sureAction];
        //d.弹出对话框
        [self presentViewController:alert animated:YES completion:nil];
        
//    }
    
}

#pragma mark - 登陆界面控件 getter  方法

//手机号label
-(UIImage *)usernameimage
{
    if(!_userNameLab)
    {
        _usernameimage = [[UIImage alloc]init];
        
    }
    return _usernameimage;
    
}

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
        _userNameTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
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
        _passwordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
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
        [_gobackbtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [_gobackbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _gobackbtn.backgroundColor = [UIColor purpleColor];
        [_gobackbtn setTitle:@"登录" forState:UIControlStateNormal];
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


//忘记密码按钮
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


#pragma mark - 单击事件
//加载tabbar
-(void)loginbtnClick
{
    //    ApplicationDelegate.window;
    //    ((AppDelegate *)[UIApplication sharedApplication].delegate)
    //    ApplicationDelegate.window.root
    
    
    
    regeisterViewController *regeisterVC=[[regeisterViewController alloc]init];
    
    

    CustomNavigationController *nav2=[[CustomNavigationController alloc]initWithRootViewController:regeisterVC];
    ApplicationDelegate.window.rootViewController=nav2;
    
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
