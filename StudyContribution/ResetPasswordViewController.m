
//  anymoreViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "regeisterViewController.h"
#import "BaseInfoSave.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHight [UIScreen mainScreen].bounds.size.height

@interface ResetPasswordViewController ()

@property (nonatomic,strong) UIButton *go_homebtn;
@property(nonatomic,strong)UIButton*setPasswordBtn;
@property(nonatomic,strong)UIButton *confirmPasswordBtn;
@property(nonatomic,strong)UITextField *setPasswordTextF;
@property(nonatomic,strong)UITextField *confirmPasswordTextF;
@property(nonatomic,strong)UILabel *backgroundLab;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIImageView *lineOne;
@property(nonatomic,strong)UIImageView *lineTwo;
@property(nonatomic,strong)UIImageView *borderIV;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel* titleLab;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    UIImageView *backGround = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHight)];
    backGround.image = [UIImage imageNamed:@"背景"];
    //设置标题
//    self.navitionBar.title_label.text = @"密码重置";
//    
//    //设置导航栏左按钮
//    [self.navitionBar.left_btn setTitle:@"上一步" forState:UIControlStateNormal];
//    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
    //设置控件
    [self.view addSubview:backGround];
    //    [self.view addSubview:self.backgroundLab];
    [self.view addSubview:self.borderIV];
    [self.view addSubview:self.go_homebtn];
    [self.view addSubview:self.setPasswordBtn];
    [self.view addSubview:self.setPasswordTextF];
    [self.view addSubview:self.confirmPasswordBtn];
    [self.view addSubview:self.confirmPasswordTextF];
    [self.view addSubview:self.lineOne];
    [self.view addSubview:self.lineTwo];
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.titleLab];
    //    [self.view addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - 界面控件
-(UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 25, 70, 30)];
        _leftBtn.backgroundColor = [UIColor clearColor];
        [_leftBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0.3*screenWidth, 25, 0.4*screenWidth, 30)];
        [_titleLab setText:@"设置密码"];
        [_titleLab setTextAlignment:NSTextAlignmentCenter];
        [_titleLab setTextColor:[UIColor whiteColor]];
    }
    return _titleLab;
}
//输入密码
-(UIButton *)setPasswordBtn
{
    if(!_setPasswordBtn){
        _setPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*screenWidth, 0.10*screenHight, 0.3*screenWidth, 0.06*screenHight)];
        _setPasswordBtn.backgroundColor = [UIColor clearColor];
        [_setPasswordBtn setTitle:@"输入密码 |" forState:UIControlStateNormal];
        _setPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _setPasswordBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_setPasswordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _setPasswordBtn.layer.cornerRadius = 5;
        _setPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _setPasswordBtn;
}
-(UITextField *)setPasswordTextF
{
    if (!_setPasswordTextF) {
        _setPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.36*screenWidth, 0.10*screenHight, 0.45*screenWidth, 0.06*screenHight)];
        _setPasswordTextF.backgroundColor = [UIColor clearColor];
        _setPasswordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _setPasswordTextF.layer.cornerRadius = 5;
        _setPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
        _setPasswordTextF.secureTextEntry = YES;
        [_setPasswordTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _setPasswordTextF.font = [UIFont systemFontOfSize:20];
        [_setPasswordTextF setTextColor:[UIColor whiteColor]];
    }
    return _setPasswordTextF;
}

-(UIImageView *)lineOne
{
    if(!_lineOne)
    {
        _lineOne = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*screenWidth, 0.16*screenHight, 0.8*screenWidth, 0.004*screenHight)];
        _lineOne.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _lineOne;
}
//确认密码
-(UIButton *)confirmPasswordBtn
{
    if(!_confirmPasswordBtn){
        _confirmPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*screenWidth, 0.164*screenHight, 0.3*screenWidth, 0.06*screenHight)];
        _confirmPasswordBtn.backgroundColor = [UIColor clearColor];
        [_confirmPasswordBtn setTitle:@"确认密码 |" forState:UIControlStateNormal];
        _confirmPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _confirmPasswordBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_confirmPasswordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmPasswordBtn.layer.cornerRadius = 5;
        _confirmPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:20];}
    return _confirmPasswordBtn;
}
-(UITextField *)confirmPasswordTextF
{
    if (!_confirmPasswordTextF) {
        _confirmPasswordTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.36*screenWidth, 0.164*screenHight, 0.45*screenWidth, 0.06*screenHight)];
        _confirmPasswordTextF.backgroundColor = [UIColor clearColor];
        _confirmPasswordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _confirmPasswordTextF.layer.cornerRadius = 5;
        _confirmPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
        _confirmPasswordTextF.secureTextEntry = YES;
        [_confirmPasswordTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _confirmPasswordTextF.font = [UIFont systemFontOfSize:20];
        [_confirmPasswordTextF setTextColor:[UIColor whiteColor]];
    }
    return _confirmPasswordTextF;
}

-(UIImageView *)lineTwo
{
    if(!_lineTwo)
    {
        _lineTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*screenWidth, 0.224*screenHight , 0.8*screenWidth, 0.004*screenHight)];
        _lineTwo.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _lineTwo;
}
//注册完成
-(UIButton *)go_homebtn
{
    if(!_go_homebtn)
    {
        _go_homebtn = [[UIButton alloc] init];
        _go_homebtn.frame =CGRectMake(0.2*screenWidth, 0.4*screenHight, 0.6*screenWidth, 0.07*screenHight);
        _go_homebtn.backgroundColor = [UIColor clearColor];
        [_go_homebtn setTitle:@"确认重置" forState:UIControlStateNormal];
        [_go_homebtn addTarget:self action:@selector(gohomebtnclick) forControlEvents:UIControlEventTouchUpInside];
        _go_homebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_go_homebtn setAlpha:0.4];
        [_go_homebtn setEnabled:NO];
        _go_homebtn.layer.cornerRadius = 5;
        _go_homebtn.titleLabel.font = [UIFont systemFontOfSize:25];
        [_go_homebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _go_homebtn;
}
-(UIImageView *)borderIV
{
    if (!_borderIV)
    {
        _borderIV = [[UIImageView alloc]initWithFrame: CGRectMake(0.2*screenWidth, 0.4*screenHight, 0.6*screenWidth, 0.07*screenHight)];
        _borderIV.image = [UIImage imageNamed:@"学霸捐－登陆框"];
    }
    return _borderIV;
}
////背景label
//-(UILabel *)backgroundLab
//{
//    if(!_backgroundLab)
//    {
//        _backgroundLab = [[UILabel alloc]init];
//        _backgroundLab.frame = CGRectMake(0.15*screenWidth, 0.125*screenHight+64, 0.7*screenWidth, 0.05*screenHight);
//        _backgroundLab.backgroundColor = [UIColor whiteColor];
//    }
//    return _backgroundLab;
//}
////画一条线
//-(UIImageView *)imageView
//{
//    if(!_imageView)
//    {
//        _imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
//        UIGraphicsBeginImageContext(_imageView.frame.size);
//        CGFloat h = _imageView.frame.size.height;
//        CGFloat w = _imageView.frame.size.width;
//        [_imageView.image drawInRect:CGRectMake(0, 0, h, w)];
//        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
//        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 0.3);  //线宽
//        CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
//        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.5, 0.5, 0.5, 1.0);  //颜色
//        CGContextBeginPath(UIGraphicsGetCurrentContext());
//        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0.16*screenWidth, 0.15*screenHight+64);  //起点坐标
//        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 0.84*screenWidth, 0.15*screenHight+64);   //终点坐标
//        CGContextStrokePath(UIGraphicsGetCurrentContext());
//        _imageView.image=UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//    }
//    return _imageView;
//}
#pragma mark - 判断密码是否一致
-(void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"%@%@",_setPasswordTextF.text,_confirmPasswordTextF.text);
    if(_setPasswordTextF.text.length != 0 && _confirmPasswordTextF.text.length != 0)
    {
        [_go_homebtn setAlpha:1.0];
        [_go_homebtn setEnabled:YES];
    }
    else
    {
        [_go_homebtn setAlpha:0.4];
        [_go_homebtn setEnabled:NO];
    }
}
#pragma mark - 单击事件
-(void)gohomebtnclick
{
    if ([_setPasswordTextF.text isEqualToString:_confirmPasswordTextF.text])
    {
        NSLog(@"%@%@",_setPasswordTextF.text,_confirmPasswordTextF.text);
        [[BaseInfoSave sharedInstance] savePassword:_setPasswordTextF.text];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [_go_homebtn setAlpha:0.4];
        [_go_homebtn setEnabled:NO];
    }
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

//左按钮单击事件
-(void)leftbtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
