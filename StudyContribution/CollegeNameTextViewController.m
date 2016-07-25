//
//  CollegeNameTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "CollegeNameTextViewController.h"
#import "UpdatePersonalInfoViewController.h"


@interface CollegeNameTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *collegeNameBackground;

//取消按钮
@property (nonatomic,strong) UIButton *collegeNameCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *collegeNameCompleteBtn;

@end

@implementation CollegeNameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.collegeNameBackground];
    
//    添加取消按钮
    [self.view addSubview:self.collegeNameCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.collegeNameCompleteBtn];
    
//    添加学院名称text
    [self.view addSubview:self.collegeNameText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.collegeNameBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.collegeNameCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.collegeNameCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置学院名称text位置
    self.collegeNameText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)collegeNameBackground{
    if (!_collegeNameBackground) {
        _collegeNameBackground = [[UIImageView alloc]init];
//        _collegeNameBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _collegeNameBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _collegeNameBackground;
}

#pragma mark - 学院名称取消按钮

- (UIButton *)collegeNameCancleBtn{
    if (!_collegeNameCancleBtn) {
        _collegeNameCancleBtn = [[UIButton alloc]init];
//        _collegeNameCancleBtn.layer.borderWidth = 1.0f;
//        _collegeNameCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _collegeNameCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_collegeNameCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_collegeNameCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_collegeNameCancleBtn addTarget:self action:@selector(schoolNameCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collegeNameCancleBtn;
}

- (void)schoolNameCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学院名称完成按钮

- (UIButton *)collegeNameCompleteBtn{
    if (!_collegeNameCompleteBtn) {
        _collegeNameCompleteBtn = [[UIButton alloc]init];
//        _collegeNameCompleteBtn.layer.borderWidth = 1.0f;
//        _collegeNameCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _collegeNameCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_collegeNameCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_collegeNameCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_collegeNameCompleteBtn addTarget:self action:@selector(collegeNameCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collegeNameCompleteBtn;
}

- (void)collegeNameCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学院名称text

- (UITextField *)collegeNameText{
    if (!_collegeNameText) {
        _collegeNameText = [[UITextField alloc]init];
        _collegeNameText.layer.borderWidth = 1.0f;
        _collegeNameText.layer.borderColor = [[UIColor blackColor]CGColor];
        _collegeNameText.backgroundColor = [UIColor purpleColor];
        _collegeNameText.text = @"这是学院";
    }
    return _collegeNameText;
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
