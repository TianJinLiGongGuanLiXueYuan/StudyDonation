//
//  StudentIdTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "StudentIdTextViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface StudentIdTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *studentIdTextBackground;

//取消按钮
@property (nonatomic,strong) UIButton *studentIdTextCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *studentIdTextCompleteBtn;

@end

@implementation StudentIdTextViewController

#pragma mark - 初始化级添加控件

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.studentIdTextBackground];
    
//    添加取消按钮
    [self.view addSubview:self.studentIdTextCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.studentIdTextCompleteBtn];
    
//    添加学号text
    [self.view addSubview:self.studentIdText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置控件位置

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.studentIdTextBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.studentIdTextCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.studentIdTextCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置学号text位置
    self.studentIdText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)studentIdTextBackground{
    if (!_studentIdTextBackground) {
        _studentIdTextBackground = [[UIImageView alloc]init];
//        _studentIdTextBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _studentIdTextBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _studentIdTextBackground;
}

#pragma mark - 学号text取消按钮

- (UIButton *)studentIdTextCancleBtn{
    if (!_studentIdTextCancleBtn) {
        _studentIdTextCancleBtn = [[UIButton alloc]init];
//        _studentIdTextCancleBtn.layer.borderWidth = 1.0f;
//        _studentIdTextCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _studentIdTextCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_studentIdTextCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_studentIdTextCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_studentIdTextCancleBtn addTarget:self action:@selector(studentIdTextCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _studentIdTextCancleBtn;
}

- (void)studentIdTextCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学号text完成按钮

- (UIButton *)studentIdTextCompleteBtn{
    if (!_studentIdTextCompleteBtn) {
        _studentIdTextCompleteBtn = [[UIButton alloc]init];
//       _studentIdTextCompleteBtn.layer.borderWidth = 1.0f;
//       _studentIdTextCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _studentIdTextCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_studentIdTextCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_studentIdTextCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_studentIdTextCompleteBtn addTarget:self action:@selector(studentIdTextCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _studentIdTextCompleteBtn;
}

- (void)studentIdTextCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 学号text

- (UITextField *)studentIdText{
    if (!_studentIdText) {
        _studentIdText = [[UITextField alloc]init];
        _studentIdText.layer.borderWidth = 1.0f;
        _studentIdText.layer.borderColor = [[UIColor blackColor]CGColor];
        _studentIdText.backgroundColor = [UIColor purpleColor];
        _studentIdText.text = @"这是学号";
    }
    return _studentIdText;
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
