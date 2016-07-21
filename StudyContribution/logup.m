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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
        [self addSubview:self.universityBtn];
        [self addSubview:self.schoolBtn];
        [self addSubview:self.classBtn];
        [self addSubview:self.stuNumBtn];
        [self addSubview:self.universityTextF];
        [self addSubview:self.schoolTextF];
        [self addSubview:self.classTextF];
        [self addSubview:self.stuNumTextF];
        [self addSubview:self.nextbtn];
        //手势，收起键盘
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tap];
    }
    return self;
}
#pragma mark - 界面控件
//所在学校
-(UIButton *)universityBtn
{
    if(!universityBtn)
    {
        universityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.10*hight, 0.3*width, 0.05*hight)];
        universityBtn.backgroundColor = [UIColor whiteColor];
        [universityBtn setTitle:@"所在学校  |" forState:UIControlStateNormal];
        universityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        universityBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [universityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        universityBtn.layer.cornerRadius = 5;
    }
    return universityBtn;
}
-(UITextField *)universityTextF
{
    if (!universityTextF) {
        universityTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.35*width, 0.10*hight, 0.55*width, 0.05*hight)];
        universityTextF.backgroundColor = [UIColor whiteColor];
        universityTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        universityTextF.layer.cornerRadius = 5;
        universityTextF.leftViewMode = UITextFieldViewModeAlways;
        [universityTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return universityTextF;
}
//所在学校
-(UIButton *)schoolBtn
{
    if(!schoolBtn){
    schoolBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.17*hight, 0.3*width, 0.05*hight)];
    schoolBtn.backgroundColor = [UIColor whiteColor];
    [schoolBtn setTitle:@"所在学院  |" forState:UIControlStateNormal];
    schoolBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    schoolBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [schoolBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    schoolBtn.layer.cornerRadius = 5;}
    return schoolBtn;
}
-(UITextField *)schoolTextF
{
    if (!schoolTextF) {
        schoolTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.35*width, 0.17*hight, 0.55*width, 0.05*hight)];
        schoolTextF.backgroundColor = [UIColor whiteColor];
        schoolTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        schoolTextF.layer.cornerRadius = 5;
        schoolTextF.leftViewMode = UITextFieldViewModeAlways;
        [schoolTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return schoolTextF;
}
//所在班级
-(UIButton *)classBtn
{
    if(!classBtn){
    classBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.24*hight, 0.3*width, 0.05*hight)];
    classBtn.backgroundColor = [UIColor whiteColor];
    [classBtn setTitle:@"所在班级  |" forState:UIControlStateNormal];
    classBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    classBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [classBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    classBtn.layer.cornerRadius = 5;}
    return classBtn;
}
-(UITextField *)classTextF
{
    if (!classTextF) {
        classTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.35*width, 0.24*hight, 0.55*width, 0.05*hight)];
        classTextF.backgroundColor = [UIColor whiteColor];
        classTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        classTextF.layer.cornerRadius = 5;
        classTextF.leftViewMode = UITextFieldViewModeAlways;
        [classTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return classTextF;
}
//学号
-(UIButton *)stuNumBtn
{
    if(!stuNumBtn){
    stuNumBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*width, 0.31*hight, 0.3*width, 0.05*hight)];
    stuNumBtn.backgroundColor = [UIColor whiteColor];
    [stuNumBtn setTitle:@"学        号  |" forState:UIControlStateNormal];
    stuNumBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    stuNumBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [stuNumBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        stuNumBtn.layer.cornerRadius = 5;}
    return stuNumBtn;
}
-(UITextField *)stuNumTextF
{
    if (!stuNumTextF) {
        stuNumTextF = [[UITextField alloc]initWithFrame:CGRectMake(0.35*width, 0.31*hight, 0.55*width, 0.05*hight)];
        stuNumTextF.backgroundColor = [UIColor whiteColor];
        stuNumTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
        stuNumTextF.layer.cornerRadius = 5;
        stuNumTextF.leftViewMode = UITextFieldViewModeAlways;
        [stuNumTextF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return stuNumTextF;
}
//下一步按钮
-(UIButton *)nextbtn
{
    if (!nextbtn) {
        nextbtn = [[UIButton alloc]init];
        nextbtn.frame = CGRectMake(0.1*width, 0.45*hight, 0.8*width, 0.05*hight);
        [nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
        nextbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//文字居中显示
        [nextbtn setBackgroundColor:[UIColor cyanColor]];
        [nextbtn setAlpha:0.4];
        [nextbtn setEnabled:NO];
        nextbtn.layer.cornerRadius = 5;
    }
    return nextbtn;
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
