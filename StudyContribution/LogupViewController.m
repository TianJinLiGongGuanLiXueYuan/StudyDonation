//
//  LogupViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "LogupViewController.h"
#import "moreViewController.h"

//引入第三方头文件
#import <SMS_SDK/SMSSDK.h>

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
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    // 设置页面标题
    self.navitionBar.title_label.text = @"绑定手机";
    
    
    //设置页面左边的按钮
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    self.navitionBar.left_btn.frame = CGRectMake(0, 30, 50, 35);
    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    //设置控件
    [self.view addSubview:self.nextbtn];
    
    [self.view addSubview:self.telLab];
    [self.view addSubview:self.teltexF];
    [self.view addSubview:self.inputBtn];
    [self.view addSubview:self.verifyLab];
    [self.view addSubview:self.verifyTexF];
    
    //判断按钮是否可以使用
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textchange1) name:UITextFieldTextDidChangeNotification object:_telTextF];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textchange2) name:UITextFieldTextDidChangeNotification object:_verifyTexF];
    //手势，收起键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

#pragma mark - 判断按钮可使用事件
//判断按钮时 可以使用事件1
-(void)textchange1
{
    _inputBtn.enabled = self.telTextF.text.length>0;
    _inputBtn.alpha = 1;
    
}

//判断按钮时 可以使用事件2
-(void)textchange2
{
    _nextbtn.enabled = self.verifyTexF.text.length>0;
    _nextbtn.alpha = 1;
    
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
#pragma mark - 隐藏键盘事件
- (IBAction)textFieldDone:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)textBackgroundClick:(id)sender{
    [_telTextF resignFirstResponder];
    [_verifyTexF resignFirstResponder];
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
        _inputBtn.enabled = false;
        _inputBtn.alpha = 0.4;
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
        _nextbtn.enabled = false;
        _nextbtn.alpha = 0.4;
    }
    return _nextbtn;
}


#pragma mark - 单机事件
-(void)sendVerifyNum
{
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    
    NSString *phoneNum = _telTextF.text;
    
    NSLog(@"%lu",(unsigned long)phoneNum.length);
    if(phoneNum.length == 11)
    {
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNum
                                       zone:@"86"
                           customIdentifier:nil
                                     result:^(NSError *error){
                                         if (!error) {
                                             NSLog(@"获取验证码成功");
                                         } else {
                                             NSLog(@"错误信息：%@",error);
                                         }
                                     }];
    }
    else
    {
        UILabel *tishi = [[UILabel alloc]initWithFrame:CGRectMake(20, 680, 200, 50)];
        tishi.text = @"输入的手机号不正确";
        [self.view addSubview:tishi];
    }
}

//下一步按钮，单击同时验证验证码。
-(void)nextbtnclick
{
    //验证验证码是否正确。
    [SMSSDK commitVerificationCode:self.verifyTexF.text phoneNumber:_telTextF.text zone:@"86" result:^(NSError *error) {
        //验证成功，打开下一页。
        if (!error) {
            NSLog(@"验证成功");
            moreViewController *moreVC = [[moreViewController alloc] init];
            
            [self.navigationController pushViewController:moreVC animated:YES];
            
            //    [self presentViewController:moreVC animated:YES completion:^{
            //
            //
            //    }];
        }
        else
        {
            UILabel *remindError = [[UILabel alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height-10, 200, 50)];
            remindError.text = @"验证码错误。";
            remindError.textColor = [UIColor redColor];
            _verifyTexF.text = @"";
            
            NSLog(@"错误信息:%@",error);
        }
    }];
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}


//左按钮单击事件
-(void)leftbtnClick
{
    [self.navigationController popViewControllerAnimated:YES ];
}

#pragma mark - 手势触发事件
-(void)viewTapped:(UITapGestureRecognizer*)tap
{
    [self.view endEditing:YES];
}
@end
