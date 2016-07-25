//
//  ClassNameTextViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/24.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ClassNameTextViewController.h"
#import "UpdatePersonalInfoViewController.h"

@interface ClassNameTextViewController ()

//背景图
@property (nonatomic,strong) UIImageView *classNameBackground;

//取消按钮
@property (nonatomic,strong) UIButton *classNameCancleBtn;

//完成按钮
@property (nonatomic,strong) UIButton *classNameCompleteBtn;

@end

@implementation ClassNameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    添加背景图
    [self.view addSubview:self.classNameBackground];
    
//    添加取消按钮
    [self.view addSubview:self.classNameCancleBtn];
    
//    添加完成按钮
    [self.view addSubview:self.classNameCompleteBtn];
    
//    添加班级text
    [self.view addSubview:self.classNameText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.classNameBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置取消按钮位置
    self.classNameCancleBtn.frame = CGRectMake(10, 10, 40, 40);
    
//    设置完成按钮位置
    self.classNameCompleteBtn.frame = CGRectMake(364, 10, 40, 40);
    
//    设置班级text位置
    self.classNameText.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 200);
    
}

#pragma mark - 背景图getter（）

- (UIImageView *)classNameBackground{
    if (!_classNameBackground) {
        _classNameBackground = [[UIImageView alloc]init];
//        _classNameBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _classNameBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _classNameBackground;
}

#pragma mark - 班级text取消按钮

- (UIButton *)classNameCancleBtn{
    if (!_classNameCancleBtn) {
        _classNameCancleBtn = [[UIButton alloc]init];
//        _classNameCancleBtn.layer.borderWidth = 1.0f;
//        _classNameCancleBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _classNameCancleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_classNameCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_classNameCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_classNameCancleBtn addTarget:self action:@selector(classNameCancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classNameCancleBtn;
}

- (void)classNameCancleBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 班级text完成按钮

- (UIButton *)classNameCompleteBtn{
    if (!_classNameCompleteBtn) {
        _classNameCompleteBtn = [[UIButton alloc]init];
//       _classNameCompleteBtn.layer.borderWidth = 1.0f;
//       _classNameCompleteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _classNameCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_classNameCompleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_classNameCompleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_classNameCompleteBtn addTarget:self action:@selector(classNameCompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classNameCompleteBtn;
}

- (void)classNameCompleteBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 班级text

- (UITextField *)classNameText{
    if (!_classNameText) {
        _classNameText = [[UITextField alloc]init];
        _classNameText.layer.borderWidth = 1.0f;
        _classNameText.layer.borderColor = [[UIColor blackColor]CGColor];
        _classNameText.backgroundColor = [UIColor purpleColor];
        _classNameText.text = @"这是班级";
    }
    return _classNameText;
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
