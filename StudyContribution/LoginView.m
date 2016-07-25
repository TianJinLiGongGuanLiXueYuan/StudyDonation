//
//  LoginView.m
//  StudyContribution
//
//  Created by Surprised on 16/7/16.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "LoginView.h"
#import "QuartzCore/QuartzCore.h"

//引入第三方头文件
#import <SMS_SDK/SMSSDK.h>
#import "MBProgressHUD.h"

#define width [UIScreen mainScreen].bounds.size.width
#define hight [UIScreen mainScreen].bounds.size.height
@implementation LoginView

@synthesize nextbtn;
@synthesize telTextF;
@synthesize verifyTexF;
@synthesize inputBtn;
@synthesize loginV;
@synthesize leftBtn;
@synthesize setPasswordTextF;
@synthesize confirmPasswordTextF;
@synthesize boederTwo;
@synthesize borderOne;
@synthesize btnBg;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *customBackgournd = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, hight)];
        customBackgournd.image = [UIImage imageNamed:@"注册(改)"];
        [self addSubview:customBackgournd];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"学霸捐- 注册"]];
        [self addSubview:self.btnBg];
        [self addSubview:self.telTextF];
        [self addSubview:self.inputBtn];
        [self addSubview:self.boederTwo];
        [self addSubview:self.nextbtn];
        [self addSubview:self.borderOne];
        [self addSubview:self.verifyTexF];
        [self addSubview:self.leftBtn];
        [self addSubview:self.setPasswordTextF];
        [self addSubview:self.confirmPasswordTextF];
        
        //手势，收起键盘
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark - view上控件getters
-(UIButton *)leftBtn
{
    if (!leftBtn) {
        leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 25, 70, 30)];
        leftBtn.backgroundColor = [UIColor clearColor];
    }
    return leftBtn;
}
-(UIImageView *)btnBg
{
    if (!btnBg) {
        btnBg = [[UIImageView alloc]initWithFrame:CGRectMake(0.03*width, 25, 0.043*width, 0.075*width)];
        btnBg.image = [UIImage imageNamed:@"返回"];
    }
    return btnBg;
}
//手机号textfiled
-(UITextField *)telTextF
{
    if(!telTextF)
    {
        telTextF = [[UITextField alloc]init];
        telTextF.frame = CGRectMake(0.33*width, 0.293*hight, 0.53*width, 0.06*hight);
        telTextF.backgroundColor = [UIColor clearColor];
        telTextF.placeholder = @"请输入手机号";
        telTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        telTextF.keyboardType = UIKeyboardTypeNumberPad;
//        telTextF.textAlignment = NSTextAlignmentLeft;
        [telTextF setValue:[UIColor colorWithWhite:0.9 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
        [telTextF setValue:[UIFont boldSystemFontOfSize:22] forKeyPath:@"_placeholderLabel.font"];
        [telTextF setTextColor:[UIColor whiteColor]];
        telTextF.font = [UIFont systemFontOfSize:22];
        telTextF.tag = 1;
//        telTextF.layer.cornerRadius = 5;
//        [telTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return telTextF;
}
//验证码verifyTextF
-(UITextField *)verifyTexF
{
    if(!verifyTexF)
    {
        verifyTexF = [[UITextField alloc]init];
        verifyTexF.frame = CGRectMake(0.33*width, 0.385*hight, 0.3*width, 0.06*hight);
        verifyTexF.backgroundColor = [UIColor clearColor];
        verifyTexF.placeholder = @"填写验证码";
        verifyTexF.clearButtonMode = UITextFieldViewModeWhileEditing;
        verifyTexF.keyboardType = UIKeyboardTypeNumberPad;
//        [verifyTexF setTextAlignment:NSTextAlignmentCenter];
        [verifyTexF setValue:[UIColor colorWithWhite:0.9 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
        [verifyTexF setValue:[UIFont boldSystemFontOfSize:22] forKeyPath:@"_placeholderLabel.font"];
        [verifyTexF setTextColor:[UIColor whiteColor]];
        verifyTexF.font = [UIFont systemFontOfSize:22];
        verifyTexF.tag = 2;
//        verifyTexF.layer.cornerRadius = 5;
        [verifyTexF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return verifyTexF;
}
-(UIImageView *)borderOne
{
    if (!borderOne) {
        borderOne = [[UIImageView alloc]initWithFrame:CGRectMake(0.695*width, 0.396*hight, 0.2*width, 0.035*hight)];
        borderOne.image = [UIImage imageNamed:@"验证码按钮框"];
    }
    return borderOne;
}
//发送验证码
-(UIButton *)inputBtn
{
    if(!inputBtn)
    {
        inputBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.695*width, 0.396*hight, 0.2*width, 0.035*hight)];
        [inputBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        inputBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [inputBtn setBackgroundColor:[UIColor clearColor]];
        inputBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        inputBtn.enabled = NO;
//        inputBtn.alpha = 0.4;
        inputBtn.layer.cornerRadius = 5;
        [inputBtn addTarget:self action:@selector(inputBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return inputBtn;
}

//设置密码Tf
-(UITextField *)setPasswordTextF
{
    if (!setPasswordTextF) {
        setPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.33*width, 0.47*hight, 0.53*width, 0.06*hight)];
        setPasswordTextF.backgroundColor = [UIColor clearColor];
        setPasswordTextF.placeholder = @"请输入密码";
        setPasswordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
//        setPasswordTextF.layer.cornerRadius = 5;
        [setPasswordTextF setValue:[UIColor colorWithWhite:0.9 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
        [setPasswordTextF setValue:[UIFont boldSystemFontOfSize:22] forKeyPath:@"_placeholderLabel.font"];
        setPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
        setPasswordTextF.secureTextEntry = YES;
//        [setPasswordTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        setPasswordTextF.font = [UIFont systemFontOfSize:22];
        [setPasswordTextF setTextColor:[UIColor whiteColor]];
        setPasswordTextF.tag = 3;
        setPasswordTextF.userInteractionEnabled = NO;
    }
    return setPasswordTextF;
}
//确认密码
-(UITextField *)confirmPasswordTextF
{
    if (!confirmPasswordTextF) {
        confirmPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.33*width, 0.549*hight, 0.53*width, 0.06*hight)];
        confirmPasswordTextF.backgroundColor = [UIColor clearColor];
        confirmPasswordTextF.placeholder = @"请再次输入密码";
        confirmPasswordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        //        confirmPasswordTextF.layer.cornerRadius = 5;
        [confirmPasswordTextF setValue:[UIColor colorWithWhite:0.9 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
        [confirmPasswordTextF setValue:[UIFont boldSystemFontOfSize:22] forKeyPath:@"_placeholderLabel.font"];
        confirmPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
        confirmPasswordTextF.secureTextEntry = YES;
//        [confirmPasswordTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        confirmPasswordTextF.font = [UIFont systemFontOfSize:22];
        [confirmPasswordTextF setTextColor:[UIColor whiteColor]];
        confirmPasswordTextF.tag = 4;
        confirmPasswordTextF.userInteractionEnabled = NO;
    }
    return confirmPasswordTextF;
}
-(UIImageView *)boederTwo
{
    if (!boederTwo) {
        boederTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0.245*width, 0.716*hight, 0.48*width, 0.055*hight)];
        boederTwo.image = [UIImage imageNamed:@"学霸捐－登陆框"];
    }
    return boederTwo;
}
//注册按钮
-(UIButton *)nextbtn
{
    if (!nextbtn) {
        nextbtn = [[UIButton alloc]init];
        nextbtn.frame = CGRectMake(0.245*width, 0.716*hight, 0.48*width, 0.055*hight);
        [nextbtn setTitle:@"注册" forState:UIControlStateNormal];
        nextbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [nextbtn setBackgroundColor:[UIColor clearColor]];
        nextbtn.titleLabel.font = [UIFont systemFontOfSize:25];
        //        nextbtn.enabled = NO;
        //        nextbtn.alpha = 0.4;
        nextbtn.layer.cornerRadius = 5;
//        [nextbtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return nextbtn;
}
#pragma mark - 单机事件

-(void)inputBtnClick
{
    NSString *phoneNum =  telTextF.text;
    //NSLog(@"%lu",(unsigned long)phoneNum.length);
    if([LoginView isMobile:phoneNum])
    {
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNum
                                       zone:@"86"
                           customIdentifier:nil
                                     result:^(NSError *error){
                                         if (!error)
                                         {
                                             NSLog(@"获取验证码成功");
                                             MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
                                             // Set the custom view mode to show any view.
                                             hud.mode = MBProgressHUDModeCustomView;
                                             // Set an image view with a checkmark.
                                             UIImage *image = [[UIImage imageNamed:@"学霸捐－白对勾"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                                             hud.customView = [[UIImageView alloc] initWithImage:image];
                                             // Looks a bit nicer if we make it square.
                                             hud.square = YES;
                                             // Optional label text.
                                             hud.label.text = NSLocalizedString(@"验证码已发送", @"HUD done title");
                                             [hud hideAnimated:YES afterDelay:3.f];
                                         }
                                         else
                                         {
                                             NSLog(@"错误信息：%@",error);
                                             MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
                                             // Set the custom view mode to show any view.
                                             hud.mode = MBProgressHUDModeCustomView;
                                             // Set an image view with a checkmark.
                                             UIImage *image = [[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                                             hud.customView = [[UIImageView alloc] initWithImage:image];
                                             // Looks a bit nicer if we make it square.
                                             hud.square = YES;
                                             // Optional label text.
                                             hud.label.text = NSLocalizedString(@"未知错误！", @"HUD done title");
                                             [hud hideAnimated:YES afterDelay:3.f];
                                         }
                                     }
         ];
        __block NSInteger timer = 59;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(_timer, ^{
            if(timer <= 0)
            {
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [inputBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                    [inputBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
                    inputBtn.alpha = 1;
                    inputBtn.userInteractionEnabled = YES;
                });
            }
            else
            {
                int seconds = timer % 60;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [inputBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                    [inputBtn setTitleColor:[UIColor lightGrayColor]forState:UIControlStateNormal];
                    inputBtn.alpha = 0.8;
                    inputBtn.userInteractionEnabled = NO;
                });
                timer--;
            }
        });
        dispatch_resume(_timer);
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        hud.label.text = NSLocalizedString(@"手机号输入错误！", @"HUD done title");
        [hud hideAnimated:YES afterDelay:3.f];
    }
}


#pragma mark - 监听事件
-(void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"%@%@",setPasswordTextF.text,confirmPasswordTextF.text);
        if (textField.text.length == 4) {
            //验证验证码是否正确。
            [SMSSDK commitVerificationCode:verifyTexF.text phoneNumber:telTextF.text zone:@"86" result:^(NSError *error) {
                if (!error) {
                    NSLog(@"验证成功");
                    setPasswordTextF.userInteractionEnabled = YES;
                    confirmPasswordTextF.userInteractionEnabled = YES;
                }
                else
                {
                    UILabel *remindError = [[UILabel alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height-10, 200, 50)];
                    remindError.text = @"验证码错误。";
                    remindError.textColor = [UIColor redColor];
                    verifyTexF.text = @"";
                    //            NSString *s = @"验证码错误";
                    //            [self.navigationController.view makeToast:s duration:3.0 position:CSToastPositionCenter title:nil image:nil style:nil completion:nil];
                    
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
                    // Set the custom view mode to show any view.
                    hud.mode = MBProgressHUDModeCustomView;
                    // Set an image view with a checkmark.
                    UIImage *image = [[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                    hud.customView = [[UIImageView alloc] initWithImage:image];
                    // Looks a bit nicer if we make it square.
                    hud.square = YES;
                    // Optional label text.
                    hud.label.text = NSLocalizedString(@"验证码错误！", @"HUD done title");
                    [hud hideAnimated:YES afterDelay:3.f];
                    
                    NSLog(@"错误信息:%@",error);
                }
            }];
        }
}
//-(void)textFieldDidChange:(UITextField *)theTextField
//{
//   // NSLog(@"%@",theTextField.text);
//    if(theTextField.tag == 1)
//    {
//        if([LoginView isMobile: theTextField.text])
//        {
//           // NSLog(@"%@",telTextF.text);
//            inputBtn.enabled = YES;
//            inputBtn.alpha = 1;
//        }
//        else
//        {
//            inputBtn.enabled = NO;
//            inputBtn.alpha = 0.3;
//        }
//    }
//    else if(theTextField.tag == 2)
//    {
//        if(theTextField.text.length == 4)
//        {
//            //NSLog(@"%@",telTextF.text);
//            nextbtn.enabled = YES;
//            nextbtn.alpha = 1;
//        }
//        else
//        {
//            nextbtn.enabled = NO;
//            nextbtn.alpha = 0.3;
//        }
//    }
//}

#pragma mark - 手势触发事件
-(void)viewTapped:(UITapGestureRecognizer*)tap
{
    [self endEditing:YES];
}

#pragma mark - 正则表达式验证手机号

+ (BOOL) isMobile:(NSString *)mobileNumbel
{
             /**
              * 手机号码
              * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
              * 联通：130,131,132,152,155,156,185,186
              * 电信：133,1349,153,180,189,181(增加)
              */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";

    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";

    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNumbel]
         || [regextestcm evaluateWithObject:mobileNumbel]
         || [regextestct evaluateWithObject:mobileNumbel]
         || [regextestcu evaluateWithObject:mobileNumbel]))
    {
        return YES;
    }
    return NO;
}


@end
