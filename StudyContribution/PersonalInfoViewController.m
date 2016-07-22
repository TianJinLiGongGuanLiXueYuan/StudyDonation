//
//  PersonalInfoViewController.m
//  StudyContribution
//
//  Created by Student01 on 16/7/22.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "CustomNavigationController.h"
#import "SettingViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface PersonalInfoViewController ()

//背景图
@property (nonatomic,strong) UIImageView *background;

//返回按钮
@property (nonatomic,strong) UIButton *returnBtn;

//头像图片
@property (nonatomic,strong) UIImageView *picture;

//姓名
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *nameValueLabel;

//年级
@property (nonatomic,strong) UILabel *gradeLabel;
@property (nonatomic,strong) UILabel *gradeValueLabel;

//学校label
@property (nonatomic,strong) UILabel *schoolLabel;
@property (nonatomic,strong) UILabel *schoolValueLabel;

//学院label
@property (nonatomic,strong) UILabel *collegeLabel;
@property (nonatomic,strong) UILabel *collegeValueLabel;

//所在系label
@property (nonatomic,strong) UILabel *deptLabel;
@property (nonatomic,strong) UILabel *deptValueLabel;

//专业名称label
@property (nonatomic,strong) UILabel *specialtyLabel;
@property (nonatomic,strong) UILabel *specialtyValueLabel;

//班级label
@property (nonatomic,strong) UILabel *classLabel;
@property (nonatomic,strong) UILabel *classValueLabel;

//学号label
@property (nonatomic,strong) UILabel *studentIdLabel;
@property (nonatomic,strong) UILabel *studentIdValueLabel;

//编辑按钮
@property (nonatomic,strong) UIButton *editBtn;

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.background];
    
//    添加返回按钮
    [self.view addSubview:self.returnBtn];
    
//    添加头像picture
    [self.view addSubview:self.picture];
    
//    添加姓名label
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.nameValueLabel];
    
//    添加年级label
    [self.view addSubview:self.gradeLabel];
    [self.view addSubview:self.gradeValueLabel];
    
//    添加学校label
    [self.view addSubview:self.schoolLabel];
    [self.view addSubview:self.schoolValueLabel];
    
//    添加学院label
    [self.view addSubview:self.collegeLabel];
    [self.view addSubview:self.collegeValueLabel];
    
//    添加所在系label
    [self.view addSubview:self.deptLabel];
    [self.view addSubview:self.deptValueLabel];
    
//    添加专业label
    [self.view addSubview:self.specialtyLabel];
    [self.view addSubview:self.specialtyValueLabel];
    
//    添加班级label
    [self.view addSubview:self.classLabel];
    [self.view addSubview:self.classValueLabel];
    
//    添加学号label
    [self.view addSubview:self.studentIdLabel];
    [self.view addSubview:self.studentIdValueLabel];
    
//    添加编辑按钮
    [self.view addSubview:self.editBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _background.image = [UIImage imageNamed:@"学霸捐-个人信息"];
    }
    return _background;
}

#pragma mark - 返回按钮

- (UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 40, 45)];
//        _returnBtn.layer.borderWidth = 1;
//        _returnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _returnBtn.backgroundColor = [UIColor clearColor];
        [_returnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}

- (void)returnBtnClick{
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - 头像图片

- (UIImageView *)picture{
    if (!_picture) {
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(50, 46.5, 102.4, 145)];
//        _picture.layer.borderWidth = 1.0f;
//        _picture.layer.borderColor = [[UIColor blackColor]CGColor];
        _picture.image = [UIImage imageNamed:@"学霸捐-头像"];
    }
    return _picture;
}

#pragma mark - 名字label

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(185, 62, 100, 50)];
//        _nameLabel.layer.borderWidth = 1.0f;
//        _nameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _nameLabel.font = [UIFont systemFontOfSize:26.5];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"姓名：";
    }
    return _nameLabel;
}

- (UILabel *)nameValueLabel{
    if (!_nameValueLabel) {
        _nameValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 62, 100, 50)];
//        _nameValueLabel.layer.borderWidth = 1.0f;
//        _nameValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _nameValueLabel.font = [UIFont systemFontOfSize:26.5];
        _nameValueLabel.textColor = [UIColor whiteColor];
        _nameValueLabel.text = @"周颖英";
    }
    return _nameValueLabel;
}

#pragma mark - 年级label

- (UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(185, 142, 80, 50)];
//        _gradeLabel.layer.borderWidth = 1.0f;
//        _gradeLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _gradeLabel.font = [UIFont systemFontOfSize:26.5];
        _gradeLabel.textColor = [UIColor whiteColor];
        _gradeLabel.text = @"年级：";
    }
    return _gradeLabel;
}

- (UILabel *)gradeValueLabel{
    if (!_gradeValueLabel) {
        _gradeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 142, 100, 50)];
//        _gradeValueLabel.layer.borderWidth = 1.0f;
//        _gradeValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _gradeValueLabel.font = [UIFont systemFontOfSize:26.5];
        _gradeValueLabel.textColor = [UIColor whiteColor];
        _gradeValueLabel.text = @" 大二";
    }
    return _gradeValueLabel;
}

#pragma mark - 学校label

- (UILabel *)schoolLabel{
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 235, 135, 50)];
//        _schoolLabel.layer.borderWidth = 1.0f;
//        _schoolLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _schoolLabel.font = [UIFont systemFontOfSize:26.5];
        _schoolLabel.textColor = [UIColor whiteColor];
        _schoolLabel.text = @"学校：";
    }
    return _schoolLabel;
}

- (UILabel *)schoolValueLabel{
    if (!_schoolValueLabel) {
        _schoolValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 235, 220, 50)];
//        _schoolValueLabel.layer.borderWidth = 1.0f;
//        _schoolValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _schoolValueLabel.textAlignment = NSTextAlignmentRight;
        _schoolValueLabel.font = [UIFont systemFontOfSize:26.5];
        _schoolValueLabel.textColor = [UIColor whiteColor];
        _schoolValueLabel.text = @"天津财经大学";
    }
    return _schoolValueLabel;
}

#pragma mark - 学院label

- (UILabel *)collegeLabel{
    if (!_collegeLabel) {
        _collegeLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 301, 135, 50)];
//        _collegeLabel.layer.borderWidth = 1.0f;
//        _collegeLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _collegeLabel.font = [UIFont systemFontOfSize:26.5];
        _collegeLabel.textColor = [UIColor whiteColor];
        _collegeLabel.text = @"所在学院：";
    }
    return _collegeLabel;
}

- (UILabel *)collegeValueLabel{
    if (!_collegeValueLabel) {
        _collegeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 301, 220, 50)];
//        _collegeValueLabel.layer.borderWidth = 1.0f;
//        _collegeValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _collegeValueLabel.textAlignment = NSTextAlignmentRight;
        _collegeValueLabel.font = [UIFont systemFontOfSize:26.5];
        _collegeValueLabel.textColor = [UIColor whiteColor];
        _collegeValueLabel.text = @"理工学院";
    }
    return _collegeValueLabel;
}

#pragma mark - 所在系label

- (UILabel *)deptLabel{
    if (!_deptLabel) {
        _deptLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 368, 135, 50)];
//        _deptLabel.layer.borderWidth = 1.0f;
//        _deptLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _deptLabel.font = [UIFont systemFontOfSize:26.5];
        _deptLabel.textColor = [UIColor whiteColor];
        _deptLabel.text = @"所在系：";
    }
    return _deptLabel;
}

- (UILabel *)deptValueLabel{
    if (!_deptValueLabel) {
        _deptValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 368, 220, 50)];
//        _deptValueLabel.layer.borderWidth = 1.0f;
//        _deptValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _deptValueLabel.textAlignment = NSTextAlignmentRight;
        _deptValueLabel.font = [UIFont systemFontOfSize:26.5];
        _deptValueLabel.textColor = [UIColor whiteColor];
        _deptValueLabel.text = @"信息科学与技术系";
    }
    return _deptValueLabel;
}

#pragma mark - 专业label

- (UILabel *)specialtyLabel{
    if (!_specialtyLabel) {
        _specialtyLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 432.6, 135, 50)];
//        _specialtyLabel.layer.borderWidth = 1.0f;
//        _specialtyLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _specialtyLabel.font = [UIFont systemFontOfSize:26.5];
        _specialtyLabel.textColor = [UIColor whiteColor];
        _specialtyLabel.text = @"专业名称：";
    }
    return _specialtyLabel;
}

- (UILabel *)specialtyValueLabel{
    if (!_specialtyValueLabel) {
        _specialtyValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 432.6, 220, 50)];
//        _specialtyValueLabel.layer.borderWidth = 1.0f;
//        _specialtyValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _specialtyValueLabel.textAlignment = NSTextAlignmentRight;
        _specialtyValueLabel.font = [UIFont systemFontOfSize:26.5];
        _specialtyValueLabel.textColor = [UIColor whiteColor];
        _specialtyValueLabel.text = @"计科";
    }
    return _specialtyValueLabel;
}

#pragma mark - 班级label

- (UILabel *)classLabel{
    if (!_classLabel) {
        _classLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 497.1, 135, 50)];
//        _classLabel.layer.borderWidth = 1.0f;
//        _classLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classLabel.font = [UIFont systemFontOfSize:26.5];
        _classLabel.textColor = [UIColor whiteColor];
        _classLabel.text = @"班级：";
    }
    return _classLabel;
}

- (UILabel *)classValueLabel{
    if (!_classValueLabel) {
        _classValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 497.1, 220, 50)];
//        _classValueLabel.layer.borderWidth = 1.0f;
//        _classValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classValueLabel.textAlignment = NSTextAlignmentRight;
        _classValueLabel.font = [UIFont systemFontOfSize:26.5];
        _classValueLabel.textColor = [UIColor whiteColor];
        _classValueLabel.text = @"计科1301";
    }
    return _classValueLabel;
}

#pragma mark - 学号label

- (UILabel *)studentIdLabel{
    if (!_studentIdLabel) {
        _studentIdLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 562.3, 135, 50)];
//        _studentIdLabel.layer.borderWidth = 1.0f;
//        _studentIdLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _studentIdLabel.font = [UIFont systemFontOfSize:26.5];
        _studentIdLabel.textColor = [UIColor whiteColor];
        _studentIdLabel.text = @"学号：";
    }
    return _studentIdLabel;
}

- (UILabel *)studentIdValueLabel{
    if (!_studentIdValueLabel) {
        _studentIdValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(172, 562.3, 220, 50)];
//        _studentIdValueLabel.layer.borderWidth = 1.0f;
//        _studentIdValueLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _studentIdValueLabel.textAlignment = NSTextAlignmentRight;
        _studentIdValueLabel.font = [UIFont systemFontOfSize:26.5];
        _studentIdValueLabel.textColor = [UIColor whiteColor];
        _studentIdValueLabel.text = @"2013111146";
    }
    return _studentIdValueLabel;
}

#pragma mark - 编辑按钮

- (UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]initWithFrame:CGRectMake(312, 648, 80, 40)];
        
//        _editBtn.layer.borderWidth = 1.0f;
//        _editBtn.layer.borderColor = [[UIColor blackColor]CGColor];
        
        _editBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        [_editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(ediBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}

- (void)ediBtnClick{
    UpdatePersonalInfoViewController *updatePersonInfoVC = [[UpdatePersonalInfoViewController alloc]init];
    [self.navigationController pushViewController:updatePersonInfoVC animated:YES];
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
