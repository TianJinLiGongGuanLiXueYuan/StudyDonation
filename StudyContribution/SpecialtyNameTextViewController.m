//
//  SpecialtyNameTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "SpecialtyNameTextViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface SpecialtyNameTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *specialtyNameBackground;

//取消按钮
@property (nonatomic,strong) UIButton *specialtyNameCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *specialtyNameCompleteBtn;

@end

@implementation SpecialtyNameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.specialtyNameBackground];
    
//    添加取消按钮
    [self.view addSubview:self.specialtyNameCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.specialtyNameCompleteBtn];
    
//    添加专业名称text
    [self.view addSubview:self.specialtyNameText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.specialtyNameBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.specialtyNameCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.specialtyNameCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置专业名称text位置
    self.specialtyNameText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)specialtyNameBackground{
    if (!_specialtyNameBackground) {
        _specialtyNameBackground = [[UIImageView alloc]init];
//        _specialtyNameBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _specialtyNameBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _specialtyNameBackground;
}

#pragma mark - 专业名称取消按钮

- (UIButton *)specialtyNameCancleBtn{
    if (!_specialtyNameCancleBtn) {
        _specialtyNameCancleBtn = [[UIButton alloc]init];
//        _specialtyNameCancleBtn.layer.borderWidth = 1.0f;
//        _specialtyNameCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _specialtyNameCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_specialtyNameCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_specialtyNameCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_specialtyNameCancleBtn addTarget:self action:@selector(specialtyNameCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _specialtyNameCancleBtn;
}

- (void)specialtyNameCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 专业名称完成按钮

- (UIButton *)specialtyNameCompleteBtn{
    if (!_specialtyNameCompleteBtn) {
        _specialtyNameCompleteBtn = [[UIButton alloc]init];
//       _specialtyNameCompleteBtn.layer.borderWidth = 1.0f;
//        _specialtyNameCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _specialtyNameCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_specialtyNameCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_specialtyNameCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_specialtyNameCompleteBtn addTarget:self action:@selector(specialtyNameCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _specialtyNameCompleteBtn;
}

- (void)specialtyNameCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 专业名称text

- (UITextField *)specialtyNameText{
    if (!_specialtyNameText) {
        _specialtyNameText = [[UITextField alloc]init];
        _specialtyNameText.layer.borderWidth = 1.0f;
        _specialtyNameText.layer.borderColor = [[UIColor blackColor]CGColor];
        _specialtyNameText.backgroundColor = [UIColor purpleColor];
        _specialtyNameText.text = @"这是专业";
    }
    return _specialtyNameText;
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
