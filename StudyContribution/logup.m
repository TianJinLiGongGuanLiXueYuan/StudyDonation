//
//  logup.m
//  StudyContribution
//
//  Created by Surprised on 16/7/18.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "logup.h"
#import <QuartzCore/QuartzCore.h>
#import "anymoreViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define hight [UIScreen mainScreen].bounds.size.height
@implementation logup

@synthesize universityBtn;
@synthesize schoolBtn;
@synthesize classBtn;
@synthesize stuNumBtn;
@synthesize universityTextF;
@synthesize schoolTextF;
@synthesize classTextF;
@synthesize stuNumTextF;
@synthesize nextbtn;
@synthesize lineOne;
@synthesize lineTwo;
@synthesize lineThree;
@synthesize lineFour;
@synthesize borderIV;
@synthesize leftBtn;
@synthesize titleLab;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
        UIImageView *backGround = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, hight)];
        backGround.image = [UIImage imageNamed:@"背景"];
        [self addSubview:backGround];
        [self addSubview:self.universityBtn];
        [self addSubview:self.schoolBtn];
        [self addSubview:self.classBtn];
        [self addSubview:self.stuNumBtn];
        [self addSubview:self.universityTextF];
        [self addSubview:self.schoolTextF];
        [self addSubview:self.classTextF];
        [self addSubview:self.stuNumTextF];
        [self addSubview:self.nextbtn];
        [self addSubview:self.lineOne];
        [self addSubview:self.lineTwo];
        [self addSubview:self.lineThree];
        [self addSubview:self.lineFour];
        [self addSubview:self.borderIV];
        [self addSubview:self.leftBtn];
        [self addSubview:self.titleLab];
        //手势，收起键盘
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tap];
    }
    return self;
}
#pragma mark - 界面控件
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
        [titleLab setText:@"基本信息"];
        [titleLab setTextAlignment:NSTextAlignmentCenter];
        [titleLab setTextColor:[UIColor whiteColor]];
    }
    return titleLab;
}
//所在学校
-(UIButton *)universityBtn
{
    if(!universityBtn)
    {
        universityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.10*hight, 0.3*width, 0.06*hight)];
        universityBtn.backgroundColor = [UIColor clearColor];
        [universityBtn setTitle:@"所在学校  |" forState:UIControlStateNormal];
        universityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        universityBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [universityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        universityBtn.layer.cornerRadius = 5;
        universityBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return universityBtn;
}

-(UITextField *)universityTextF
{
    if (!universityTextF) {
        universityTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.37*width, 0.10*hight, 0.55*width, 0.06*hight)];
        universityTextF.backgroundColor = [UIColor clearColor];
        universityTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        universityTextF.layer.cornerRadius = 5;
        universityTextF.leftViewMode = UITextFieldViewModeAlways;
        [universityTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        universityTextF.font = [UIFont systemFontOfSize:20];
        [universityTextF setTextColor:[UIColor whiteColor]];
    }
    return universityTextF;
}
-(UIImageView *)lineOne
{
    if(!lineOne)
    {
        lineOne = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.16*hight, 0.8*width, 0.004*hight)];
        lineOne.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineOne;
}
//所在学校
-(UIButton *)schoolBtn
{
    if(!schoolBtn){
    schoolBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.17*hight, 0.3*width, 0.06*hight)];
    schoolBtn.backgroundColor = [UIColor clearColor];
    [schoolBtn setTitle:@"所在学院  |" forState:UIControlStateNormal];
    schoolBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    schoolBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [schoolBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    schoolBtn.layer.cornerRadius = 5;
    schoolBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return schoolBtn;
}
-(UITextField *)schoolTextF
{
    if (!schoolTextF) {
        schoolTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.37*width, 0.17*hight, 0.55*width, 0.06*hight)];
        schoolTextF.backgroundColor = [UIColor clearColor];
        schoolTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        schoolTextF.layer.cornerRadius = 5;
        schoolTextF.leftViewMode = UITextFieldViewModeAlways;
        [schoolTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        schoolTextF.font = [UIFont systemFontOfSize:20];
        [schoolTextF setTextColor:[UIColor whiteColor]];
    }
    return schoolTextF;
}
-(UIImageView *)lineTwo
{
    if(!lineTwo)
    {
        lineTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.224*hight, 0.8*width, 0.004*hight)];
        lineTwo.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineTwo;
}
//所在班级
-(UIButton *)classBtn
{
    if(!classBtn){
    classBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.228*hight, 0.3*width, 0.06*hight)];
    classBtn.backgroundColor = [UIColor clearColor];
    [classBtn setTitle:@"所在班级  |" forState:UIControlStateNormal];
    classBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    classBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [classBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    classBtn.layer.cornerRadius = 5;
        classBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return classBtn;
}
-(UITextField *)classTextF
{
    if (!classTextF) {
        classTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.37*width, 0.228*hight, 0.55*width, 0.06*hight)];
        classTextF.backgroundColor = [UIColor clearColor];
        classTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        classTextF.layer.cornerRadius = 5;
        classTextF.leftViewMode = UITextFieldViewModeAlways;
        [classTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        classTextF.font = [UIFont systemFontOfSize:20];
        [classTextF setTextColor:[UIColor whiteColor]];
    }
    return classTextF;
}
-(UIImageView *)lineThree
{
    if(!lineThree)
    {
        lineThree = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.288*hight, 0.8*width, 0.004*hight)];
        lineThree.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineThree;
}
//学号
-(UIButton *)stuNumBtn
{
    if(!stuNumBtn){
    stuNumBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.292*hight, 0.3*width, 0.06*hight)];
    stuNumBtn.backgroundColor = [UIColor clearColor];
    [stuNumBtn setTitle:@"学        号  |" forState:UIControlStateNormal];
    stuNumBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    stuNumBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [stuNumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        stuNumBtn.layer.cornerRadius = 5;
    stuNumBtn.titleLabel.font = [UIFont systemFontOfSize:20];}
    return stuNumBtn;
}
-(UITextField *)stuNumTextF
{
    if (!stuNumTextF) {
        stuNumTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.37*width, 0.292*hight, 0.55*width, 0.06*hight)];
        stuNumTextF.backgroundColor = [UIColor clearColor];
        stuNumTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        stuNumTextF.layer.cornerRadius = 5;
        stuNumTextF.leftViewMode = UITextFieldViewModeAlways;
        [stuNumTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        stuNumTextF.font = [UIFont systemFontOfSize:20];
        [stuNumTextF setTextColor:[UIColor whiteColor]];
    }
    return stuNumTextF;
}
-(UIImageView *)lineFour
{
    if(!lineFour)
    {
        lineFour = [[UIImageView alloc]initWithFrame:CGRectMake(0.1*width, 0.352*hight, 0.8*width, 0.004*hight)];
        lineFour.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return lineFour;
}
//下一步按钮
-(UIButton *)nextbtn
{
    if (!nextbtn) {
        nextbtn = [[UIButton alloc]init];
        nextbtn.frame = CGRectMake(0.1*width, 0.43*hight, 0.8*width, 0.07*hight);
        [nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
        nextbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [nextbtn setBackgroundColor:[UIColor clearColor]];
        [nextbtn setAlpha:0.4];
        [nextbtn setEnabled:NO];
        nextbtn.layer.cornerRadius = 5;
        nextbtn.titleLabel.font = [UIFont systemFontOfSize:25];
        [nextbtn.titleLabel setTextColor:[UIColor whiteColor]];
    }
    return nextbtn;
}

-(UIImageView *)borderIV
{
    if (!borderIV)
    {
        borderIV = [[UIImageView alloc]initWithFrame: CGRectMake(0.2*width, 0.43*hight, 0.6*width, 0.07*hight)];
        borderIV.image = [UIImage imageNamed:@"学霸捐－登陆框"];
    }
    return borderIV;
}
#pragma mark - 文本框监视事件
-(void)textFieldDidChange:(UITextField *)theTextField
{
    if (universityTextF.text.length != 0 &&
       schoolTextF.text.length != 0 &&
       classTextF.text.length != 0 &&
       stuNumTextF.text.length != 0 ) {
        [nextbtn setAlpha:1];
        [nextbtn setEnabled:YES];
    }
    else
    {
        [nextbtn setAlpha:0.4];
        [nextbtn setEnabled:NO];
    }
}
#pragma mark - 手势触发事件
-(void)viewTapped:(UITapGestureRecognizer*)tap
{
    [self endEditing:YES];
}
@end
