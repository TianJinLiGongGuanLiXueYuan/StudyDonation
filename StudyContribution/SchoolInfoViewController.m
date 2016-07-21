//
//  SchoolInfoViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/19.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "SchoolInfoViewController.h"

#define TextWidth 300
#define TextHeight 200
#define BtnWidth 200
#define BtnHeight 50
#define XMarginText 57
#define YMarginText 70
#define XMarginBtn 107
#define YMargin 368

@interface SchoolInfoViewController ()

@property (nonatomic,strong) UITextView *schoolDetailText;

@property (nonatomic,strong) UIButton *schoolUpdateBtn;
@property (nonatomic,strong) UIButton *departmentsUpdateBtn;
@property (nonatomic,strong) UIButton *classUpdateBtn;
@property (nonatomic,strong) UIButton *studentIdUpdateBtn;

@property (nonatomic,strong) UIButton *confirmBtn;

@end

@implementation SchoolInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.schoolUpdateBtn];
    [self.view addSubview:self.departmentsUpdateBtn];
    [self.view addSubview:self.classUpdateBtn];
    [self.view addSubview:self.studentIdUpdateBtn];
    
    [self.view addSubview:self.confirmBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.view addSubview:self.schoolDetailText];
}

#pragma mark - 学校详细信息Text

- (UITextView *)schoolDetailText{
    if (!_schoolDetailText) {
        _schoolDetailText = [[UITextView alloc]initWithFrame:CGRectMake(XMarginText, YMarginText, TextWidth, TextHeight)];
        _schoolDetailText.editable = NO;
        
        //        文字置顶
        self.automaticallyAdjustsScrollViewInsets = NO;
        _schoolDetailText.font = [UIFont systemFontOfSize:20];
        _schoolDetailText.backgroundColor = [UIColor grayColor];
        _schoolDetailText.textAlignment = NSTextAlignmentCenter;
        _schoolDetailText.text = @"xxx大学\n                        -xxx学院\n姓名：xxx\n学好：0000000\n学校信息介绍";
    }
    return _schoolDetailText;
}

#pragma mark - 学校修改按钮

- (UIButton *)schoolUpdateBtn{
    if (!_schoolUpdateBtn) {
        _schoolUpdateBtn = [[UIButton alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin - 60, BtnWidth, BtnHeight)];
        
        //        _schoolUpdateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        //        设置圆角
        _schoolUpdateBtn.layer.cornerRadius = 5;
        
        _schoolUpdateBtn.backgroundColor = [UIColor purpleColor];
        [_schoolUpdateBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_schoolUpdateBtn setTitle:@"学校修改" forState:UIControlStateNormal];
        [_schoolUpdateBtn addTarget:self action:@selector(schoolUpdateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _schoolUpdateBtn;
}

- (void)schoolUpdateBtnClick{
    
}

#pragma mark - 院系修改按钮

- (UIButton *)departmentsUpdateBtn{
    if (!_departmentsUpdateBtn) {
        _departmentsUpdateBtn = [[UIButton alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin , BtnWidth, BtnHeight)];
        
        _departmentsUpdateBtn.layer.cornerRadius = 5;
        
        _departmentsUpdateBtn.backgroundColor = [UIColor blueColor];
        [_departmentsUpdateBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_departmentsUpdateBtn setTitle:@"院系修改" forState:UIControlStateNormal];
        [_departmentsUpdateBtn addTarget:self action:@selector(departmentsUpdateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _departmentsUpdateBtn;
}

- (void)departmentsUpdateBtnClick{
    
}

#pragma mark - 班级修改按钮

- (UIButton *)classUpdateBtn{
    if (!_classUpdateBtn) {
        _classUpdateBtn = [[UIButton alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin + 60, BtnWidth, BtnHeight)];
        
        _classUpdateBtn.layer.cornerRadius = 5;
        
        _classUpdateBtn.backgroundColor = [UIColor orangeColor];
        [_classUpdateBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_classUpdateBtn setTitle:@"班级修改" forState:UIControlStateNormal];
        [_classUpdateBtn addTarget:self action:@selector(classUpdateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classUpdateBtn;
}

- (void)classUpdateBtnClick{
    
}

#pragma mark - 学号修改按钮

- (UIButton *)studentIdUpdateBtn{
    if (!_studentIdUpdateBtn) {
        _studentIdUpdateBtn = [[UIButton alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin + 120, BtnWidth, BtnHeight)];
        
        _studentIdUpdateBtn.layer.cornerRadius = 5;
        
        _studentIdUpdateBtn.backgroundColor = [UIColor redColor];
        [_studentIdUpdateBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_studentIdUpdateBtn setTitle:@"学号修改" forState:UIControlStateNormal];
        [_studentIdUpdateBtn addTarget:self action:@selector(studentIdUpdateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _studentIdUpdateBtn;
}

- (void)studentIdUpdateBtnClick{
    
}

#pragma mark - 确认修改按钮
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin + 230, BtnWidth, BtnHeight)];
        
        _confirmBtn.layer.cornerRadius = 5;
        
        _confirmBtn.backgroundColor = [UIColor brownColor];
        [_confirmBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (void)confirmBtnClick{
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
