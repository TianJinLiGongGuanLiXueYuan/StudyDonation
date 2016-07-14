//
//  moreViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "moreViewController.h"
#import "anymoreViewController.h"

#define leftMargin 40
#define upMargin 150
#define vHight 50
#define labelWidth 70
#define textFiledWidth 250
#define intervalDistance 50

@interface moreViewController ()
@property (nonatomic,strong) UIButton *nextbtn;
//@property (nonatomic,strong) UIButton *gobackbtn;

@property (nonatomic,strong) UILabel *universityLab;
@property (nonatomic,strong) UILabel *cshoolLab;
@property (nonatomic,strong) UILabel *classLab;
@property (nonatomic,strong) UILabel *stuNumLab;

@property (nonatomic,strong)UITextField*universityTextF;
@property (nonatomic,strong)UITextField *cshoolTextF;
@property (nonatomic,strong)UITextField*classTextF;
@property (nonatomic,strong)UITextField *stuNumTextF;

@end

@implementation moreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    //设置页面标题
    self.navitionBar.title_label.text = @"基本信息";
    
    //设置导航栏左边的按钮
    [self.navitionBar.left_btn setTitle:@"上一步" forState:UIControlStateNormal];
    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    //设置控件
    [self.view addSubview:self.nextbtn];
    
    [self.view addSubview:self.universityLab];
    [self.view addSubview:self.cshoolLab];
    [self.view addSubview:self.classLab];
    [self.view addSubview:self.stuNumLab];
    
    [self.view addSubview:self.universityTextF];
    [self.view addSubview:self.cshoolTextF];
    [self.view addSubview:self.classTextF];
    [self.view addSubview:self.stuNumTextF];
    
    
    //  [self.view addSubview:self.gobackbtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.nextbtn.frame = CGRectMake(10, 10, 100, 100);
    // self.gobackbtn.frame = CGRectMake(150, 10, 100, 100);
    
}



#pragma mark - 界面控件

//所在学校
-(UILabel *)universityLab
{
    if (!_universityLab)
    {
        _universityLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin, labelWidth, vHight)];
        _universityLab.text = @"所在院校";
    }
    return _universityLab;
}


-(UITextField *)universityTextF
{
    if (!_universityTextF) {
        _universityTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin, textFiledWidth, vHight)];
        _universityTextF.backgroundColor = [UIColor lightGrayColor];
        _universityTextF.borderStyle = UITextBorderStyleLine;
    }
    return _universityTextF;
}


//所在院系
-(UILabel *)cshoolLab
{
    if (!_cshoolLab)
    {
        _cshoolLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin + vHight + intervalDistance, labelWidth, vHight)];
        _cshoolLab.text = @"所在院系";
    }
    return _cshoolLab;
}


-(UITextField *)cshoolTextF
{
    if (!_cshoolTextF) {
        _cshoolTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin + vHight + intervalDistance, textFiledWidth, vHight)];
        _cshoolTextF.backgroundColor = [UIColor lightGrayColor];
        _cshoolTextF.borderStyle = UITextBorderStyleLine;
    }
    return _cshoolTextF;
}

//所在班级
-(UILabel *)classLab
{
    if (!_classLab)
    {
        _classLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin + 2*vHight + 2*intervalDistance, labelWidth, vHight)];
        _classLab.text = @"所在班级";
    }
    return _classLab;
}


-(UITextField *)classTextF
{
    if (!_classTextF) {
        _classTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin + 2*vHight + 2*intervalDistance, textFiledWidth, vHight)];
        _classTextF.backgroundColor = [UIColor lightGrayColor];
        _classTextF.borderStyle = UITextBorderStyleLine;
    }
    return _classTextF;
}


//学号
-(UILabel *)stuNumLab
{
    if (!_stuNumLab)
    {
        _stuNumLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, upMargin + 3*vHight + 3*intervalDistance, labelWidth, vHight)];
        _stuNumLab.text = @"学号";
    }
    return _stuNumLab;
}


-(UITextField *)stuNumTextF
{
    if (!_stuNumTextF) {
        _stuNumTextF = [[UITextField alloc]initWithFrame:CGRectMake(leftMargin+labelWidth, upMargin + 3*vHight + 3*intervalDistance, textFiledWidth, vHight)];
        _stuNumTextF.backgroundColor = [UIColor lightGrayColor];
        _stuNumTextF.borderStyle = UITextBorderStyleLine;
    }
    return _stuNumTextF;
}


//下一步  按钮
-(UIButton *)nextbtn
{
    if(!_nextbtn)
    {
        _nextbtn = [[UIButton alloc] init];
        _nextbtn.frame = CGRectMake(leftMargin, upMargin + 4*vHight + 4*intervalDistance, textFiledWidth + labelWidth, vHight);
        [_nextbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
        [_nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _nextbtn.backgroundColor = [UIColor purpleColor];
    }
    return _nextbtn;
}




#pragma mark - 单击事件

//下一步 按钮单击事件
-(void)nextbtnclick
{
    anymoreViewController *anymoreVC = [[anymoreViewController alloc] init];
    
    [self.navigationController pushViewController:anymoreVC animated:YES];
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}


//导航栏左按钮事件
-(void)leftbtnClick
{
    //[super leftbtnClick];
    [self.navigationController popViewControllerAnimated:YES];
    // NSLog(@"dsafsd");
}
@end
