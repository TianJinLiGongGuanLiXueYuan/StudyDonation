//
//  DepartmentNameTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "DepartmentNameTextViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface DepartmentNameTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *departmentNameBackground;

//取消按钮
@property (nonatomic,strong) UIButton *departmentNameCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *departmentNameCompleteBtn;

@end

@implementation DepartmentNameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.departmentNameBackground];
    
//    添加取消按钮
    [self.view addSubview:self.departmentNameCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.departmentNameCompleteBtn];
    
//    添加所在系名称text
    [self.view addSubview:self.departmentNameText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.departmentNameBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.departmentNameCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.departmentNameCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置所在系名称text位置
    self.departmentNameText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)departmentNameBackground{
    if (!_departmentNameBackground) {
        _departmentNameBackground = [[UIImageView alloc]init];
//        _departmentNameBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _departmentNameBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _departmentNameBackground;
}

#pragma mark - 所在系名称取消按钮

- (UIButton *)departmentNameCancleBtn{
    if (!_departmentNameCancleBtn) {
        _departmentNameCancleBtn = [[UIButton alloc]init];
//        _departmentNameCancleBtn.layer.borderWidth = 1.0f;
//        _departmentNameCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _departmentNameCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_departmentNameCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_departmentNameCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_departmentNameCancleBtn addTarget:self action:@selector(departmentNameCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _departmentNameCancleBtn;
}

- (void)departmentNameCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 所在系名称完成按钮

- (UIButton *)departmentNameCompleteBtn{
    if (!_departmentNameCompleteBtn) {
        _departmentNameCompleteBtn = [[UIButton alloc]init];
//        _departmentNameCompleteBtn.layer.borderWidth = 1.0f;
//        _departmentNameCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _departmentNameCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_departmentNameCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_departmentNameCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_departmentNameCompleteBtn addTarget:self action:@selector(departmentNameCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _departmentNameCompleteBtn;
}

- (void)departmentNameCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 所在系名称text

- (UITextField *)departmentNameText{
    if (!_departmentNameText) {
        _departmentNameText = [[UITextField alloc]init];
        _departmentNameText.layer.borderWidth = 1.0f;
        _departmentNameText.layer.borderColor = [[UIColor blackColor]CGColor];
        _departmentNameText.backgroundColor = [UIColor purpleColor];
        _departmentNameText.text = @"这是所在系";
    }
    return _departmentNameText;
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
