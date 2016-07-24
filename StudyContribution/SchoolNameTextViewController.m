//
//  SchoolNameTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "SchoolNameTextViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface SchoolNameTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *schoolNameBackground;

//取消按钮
@property (nonatomic,strong) UIButton *schoolNameCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *schoolNameCompleteBtn;

@end

@implementation SchoolNameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.schoolNameBackground];
    
//    添加取消按钮
    [self.view addSubview:self.schoolNameCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.schoolNameCompleteBtn];
    
//    添加学校名字text
    [self.view addSubview:self.schoolNameText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.schoolNameBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.schoolNameCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.schoolNameCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置学校名字text位置
    self.schoolNameText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)schoolNameBackground{
    if (!_schoolNameBackground) {
        _schoolNameBackground = [[UIImageView alloc]init];
//        _schoolNameBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _schoolNameBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _schoolNameBackground;
}

#pragma mark - 学校名字取消按钮

- (UIButton *)schoolNameCancleBtn{
    if (!_schoolNameCancleBtn) {
        _schoolNameCancleBtn = [[UIButton alloc]init];
//        _schoolNameCancleBtn.layer.borderWidth = 1.0f;
//        _schoolNameCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _schoolNameCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_schoolNameCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_schoolNameCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_schoolNameCancleBtn addTarget:self action:@selector(schoolNameCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _schoolNameCancleBtn;
}

- (void)schoolNameCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学校名字完成按钮

- (UIButton *)schoolNameCompleteBtn{
    if (!_schoolNameCompleteBtn) {
        _schoolNameCompleteBtn = [[UIButton alloc]init];
//        _schoolNameCompleteBtn.layer.borderWidth = 1.0f;
//        _schoolNameCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _schoolNameCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_schoolNameCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_schoolNameCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_schoolNameCompleteBtn addTarget:self action:@selector(schoolNameCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _schoolNameCompleteBtn;
}

- (void)schoolNameCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学校名字text

- (UITextField *)schoolNameText{
    if (!_schoolNameText) {
        _schoolNameText = [[UITextField alloc]init];
        _schoolNameText.layer.borderWidth = 1.0f;
        _schoolNameText.layer.borderColor = [[UIColor blackColor]CGColor];
        _schoolNameText.backgroundColor = [UIColor purpleColor];
        _schoolNameText.text = @"这是学校名字";
    }
    return _schoolNameText;
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
