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

#define width [UIScreen mainScreen].bounds.size.width
#define hight [UIScreen mainScreen].bounds.size.height
@implementation LoginView

@synthesize nextbtn;
@synthesize telTextF;
@synthesize verifyTexF;
@synthesize inputBtn;
@synthesize loginV;
@synthesize lineOne;
@synthesize lineTwo;
@synthesize borderOne;
@synthesize boederTwo;
@synthesize leftBtn;
@synthesize titleLab;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景"]];
        [self addSubview:self.telTextF];
        [self addSubview:self.borderOne];
        [self addSubview:self.inputBtn];
        [self addSubview:self.boederTwo];
        [self addSubview:self.nextbtn];
        [self addSubview:self.verifyTexF];
        [self addSubview:self.lineOne];
        [self addSubview:self.lineTwo];
        [self addSubview:self.leftBtn];
        [self addSubview:self.titleLab];
        
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
        [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    }
    return leftBtn;
}
-(UILabel *)titleLab
{
    if (!titleLab) {
        titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0.3*width, 25, 0.4*width, 30)];
        [titleLab setText:@"验证手机"];
        [titleLab setTextAlignment:NSTextAlignmentCenter];
        [titleLab setTextColor:[UIColor whiteColor]];
    }
    return titleLab;
}
//手机号textfiled
-(UITextField *)telTextF
{
    if(!telTextF)
    {
        telTextF = [[UITextField alloc]init];
        telTextF.frame = CGRectMake(0.1*width, 0.12*hight, 0.8*width, 0.05*hight);
        telTextF.backgroundColor = [UIColor clearColor];
        telTextF.placeholder = @"填写手机号";
        telTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        telTextF.keyboardType = UIKeyboardTypeNumberPad;
        telTextF.textAlignment = NSTextAlignmentCenter;
        [telTextF setValue:[UIColor colorWithWhite:0.8 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
        [telTextF setValue:[UIFont boldSystemFontOfSize:25] forKeyPath:@"_placeholderLabel.font"];
        [telTextF setTextColor:[UIColor whiteColor]];
        telTextF.font = [UIFont systemFontOfSize:25];
        telTextF.tag = 1;
        telTextF.layer.cornerRadius = 5;
        [telTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return telTextF;
}

//横线1
-(UIImageView *)lineOne
{
    if(!lineOne)
    {
        lineOne = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.18*hight, 0.8*width, 0.004*hight)];
        lineOne.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineOne;
}
//验证码verifyTextF
-(UITextField *)verifyTexF
{
    if(!verifyTexF)
    {
        verifyTexF = [[UITextField alloc]init];
        verifyTexF.frame = CGRectMake(0.1*width, 0.33*hight, 0.8*width, 0.05*hight);
        verifyTexF.backgroundColor = [UIColor clearColor];
        verifyTexF.placeholder = @"填写验证码";
        verifyTexF.clearButtonMode = UITextFieldViewModeWhileEditing;
        verifyTexF.keyboardType = UIKeyboardTypeNumberPad;
        [verifyTexF setTextAlignment:NSTextAlignmentCenter];
        [verifyTexF setValue:[UIColor colorWithWhite:0.8 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
        [verifyTexF setValue:[UIFont boldSystemFontOfSize:25] forKeyPath:@"_placeholderLabel.font"];
        [verifyTexF setTextColor:[UIColor whiteColor]];
        verifyTexF.font = [UIFont systemFontOfSize:25];
        verifyTexF.tag = 2;
        verifyTexF.layer.cornerRadius = 5;
        [verifyTexF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    }
    return verifyTexF;
}

//横线2
-(UIImageView *)lineTwo
{
    if(!lineTwo)
    {
        lineTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.38*hight, 0.8*width, 0.004*hight)];
        lineTwo.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineTwo;
}

//发送验证码
-(UIButton *)inputBtn
{
    if(!inputBtn)
    {
        inputBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.1*width, 0.23*hight, 0.8*width, 0.07*hight)];
        [inputBtn setTitle:@"发送" forState:UIControlStateNormal];
        inputBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [inputBtn setBackgroundColor:[UIColor clearColor]];
        inputBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        inputBtn.enabled = NO;
        inputBtn.alpha = 0.4;
        inputBtn.layer.cornerRadius = 5;
        [inputBtn addTarget:self action:@selector(inputBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return inputBtn;
}

//边框1
-(UIImageView *)borderOne
{
    if (!borderOne)
    {
        borderOne = [[UIImageView alloc]initWithFrame: CGRectMake(0.2*width, 0.23*hight, 0.6*width, 0.07*hight)];
        borderOne.image = [UIImage imageNamed:@"学霸捐－登陆框"];
    }
    return borderOne;
}
//下一步按钮
-(UIButton *)nextbtn
{
    if (!nextbtn) {
        nextbtn = [[UIButton alloc]init];
        nextbtn.frame = CGRectMake(0.2*width, 0.41*hight, 0.6*width, 0.07*hight);
        [nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
        nextbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [nextbtn setBackgroundColor:[UIColor clearColor]];
        nextbtn.titleLabel.font = [UIFont systemFontOfSize:25];
        nextbtn.enabled = NO;
        nextbtn.alpha = 0.4;
        nextbtn.layer.cornerRadius = 5;
    }
    return nextbtn;
}

//边框2
-(UIImageView *)boederTwo
{
    if (!boederTwo)
    {
        boederTwo = [[UIImageView alloc]initWithFrame: CGRectMake(0.2*width, 0.41*hight, 0.6*width, 0.07*hight)];
        boederTwo.image = [UIImage imageNamed:@"学霸捐－登陆框"];
    }
    return boederTwo;
}

#pragma mark - 单机事件
-(void)inputBtnClick
{
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    NSString *phoneNum =  telTextF.text;
    //NSLog(@"%lu",(unsigned long)phoneNum.length);
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
                inputBtn.alpha = 0.4;
                inputBtn.userInteractionEnabled = YES;});}
        else
        {
            int seconds = timer % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                [inputBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [inputBtn setTitleColor:[UIColor lightGrayColor]forState:UIControlStateNormal];
                inputBtn.alpha = 0.4;
                inputBtn.userInteractionEnabled = NO;});
            timer--;
        }
        
    });
    
    dispatch_resume(_timer);
}
#pragma mark - 监听事件
-(void)textFieldDidChange:(UITextField *)theTextField
{
   // NSLog(@"%@",theTextField.text);
    if(theTextField.tag == 1)
    {
        if([LoginView isMobile: theTextField.text])
        {
           // NSLog(@"%@",telTextF.text);
            inputBtn.enabled = YES;
            inputBtn.alpha = 1;
        }
        else
        {
            inputBtn.enabled = NO;
            inputBtn.alpha = 0.3;
        }
    }
    else if(theTextField.tag == 2)
    {
        if(theTextField.text.length == 4)
        {
            //NSLog(@"%@",telTextF.text);
            nextbtn.enabled = YES;
            nextbtn.alpha = 1;
        }
        else
        {
            nextbtn.enabled = NO;
            nextbtn.alpha = 0.3;
        }
    }
}

#pragma mark - 手势触发事件
-(void)viewTapped:(UITapGestureRecognizer*)tap
{
    [self endEditing:YES];
}

#pragma mark - 正则表达式验证手机号
/**
  *  手机号码验证
  *
  *  @param mobileNumbel 传入的手机号码
  *
  *  @return 格式正确返回true  错误 返回fals
  */
+ (BOOL) isMobile:(NSString *)mobileNumbel
{
             /**
              * 手机号码
              * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
              * 联通：130,131,132,152,155,156,185,186
              * 电信：133,1349,153,180,189,181(增加)
              */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
              10         * 中国移动：China Mobile
              11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
              12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
              15         * 中国联通：China Unicom
              16         * 130,131,132,152,155,156,185,186
              17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
              20         * 中国电信：China Telecom
              21         * 133,1349,153,180,189,181(增加)
              22         */
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
