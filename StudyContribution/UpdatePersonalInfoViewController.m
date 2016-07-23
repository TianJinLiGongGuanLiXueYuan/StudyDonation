//
//  UpdatePersonalInfoViewController.m
//  StudyContribution
//
//  Created by Student01 on 16/7/22.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "UpdatePersonalInfoViewController.h"
#import "CustomNavigationController.h"
#import "personalInfoCell.h"
#import "PersonalInfoViewController.h"

@interface UpdatePersonalInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

//背景图
@property (nonatomic,strong) UIImageView *updatePersonalBackground;

@property (nonatomic,strong) NSArray *updatePersonalInfoInfo;
@property (nonatomic,strong) NSArray *updateTemporaryArr;

//返回按钮
@property (nonatomic,strong) UIButton *updatePersonReturnBtn;

//头像图片
@property (nonatomic,strong) UIImageView *updatePersonalPicture;

//姓名
@property (nonatomic,strong) UILabel *updatePersonalNameLabel;
@property (nonatomic,strong) UITextField *updatePersonalNameValueText;
@property (nonatomic,strong) UIImageView *updatePersonInfoNameLevel;

//年级
@property (nonatomic,strong) UILabel *updatePersonalGradeLabel;
@property (nonatomic,strong) UITextField *updatePersonalGradeValueText;
@property (nonatomic,strong) UIImageView *updatePersonInfoGradeLevel;

//学生信息
@property (nonatomic,strong) UITableView *updatePersonInfoTableView;

//编辑按钮
@property (nonatomic,strong) UIButton *completeBtn;
@property (nonatomic,strong) UIImageView *completeLevel;

@end

@implementation UpdatePersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    添加背景图
    [self.view addSubview:self.updatePersonalBackground];
    
//    数组初始化
    _updatePersonalInfoInfo = @[@"学校：",@"所在学院：",@"所在系：",@"专业名称：",@"班级：",@"学号："];
    _updateTemporaryArr = @[@"天津财经大学",@"理工学院",@"信息科学与技术系",@"计科",@"计科1301",@"201311146"];
    
//    添加返回按钮
    [self.view addSubview:self.updatePersonReturnBtn];
    
//    添加头像picture
    [self.view addSubview:self.updatePersonalPicture];
    
//    添加姓名
    [self.view addSubview:self.updatePersonalNameLabel];
    [self.view addSubview:self.updatePersonalNameValueText];
    [self.view addSubview:self.updatePersonInfoNameLevel];
    
//    添加年级
    [self.view addSubview:self.updatePersonalGradeLabel];
    [self.view addSubview:self.updatePersonalGradeValueText];
    [self.view addSubview:self.updatePersonInfoGradeLevel];
    
//    初始化TableView
    _updatePersonInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x - 186.5, self.view.center.y - 140, 390, 390) style:UITableViewStylePlain];
    _updatePersonInfoTableView.scrollEnabled = NO;
    _updatePersonInfoTableView.backgroundColor = [UIColor clearColor];
//    _updatePersonInfoTableView.layer.borderWidth = 1.0f;
//    _updatePersonInfoTableView.layer.borderColor = [[UIColor whiteColor]CGColor];
//    设置cell无下划线
    _updatePersonInfoTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_updatePersonInfoTableView];
    _updatePersonInfoTableView.dataSource = self;
    _updatePersonInfoTableView.delegate = self;
    _updatePersonInfoTableView.showsVerticalScrollIndicator = NO;
    
//    添加编辑按钮
    [self.view addSubview:self.completeBtn];
    [self.view addSubview:self.completeLevel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.updatePersonalBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置返回按钮位置
    self.updatePersonReturnBtn.frame = CGRectMake(5, 10, 40, 45);
    
//    设置头像位置
    self.updatePersonalPicture.frame = CGRectMake(50, 46.5, 102.4, 145);
    
//    设置名字了label位置
    self.updatePersonInfoNameLevel.frame = CGRectMake(185, 62, 100, 50);
    
//    设置名字text位置
    self.updatePersonalNameValueText.frame = CGRectMake(300, 62, 100, 50);
    
//    设置名字了label下横线位置
    self.updatePersonInfoNameLevel.frame = CGRectMake(183, 110, 213, 4.4);
    
//    设置年级label位置
    self.updatePersonalGradeLabel.frame = CGRectMake(185, 142, 80, 50);
    
//    设置年级text位置
    self.updatePersonalGradeValueText.frame =CGRectMake(300, 142, 100, 50);
    
//    设置年级label下横线位置
    self.updatePersonInfoGradeLevel.frame = CGRectMake(183, 188, 213, 4.4);
    
//    设置编辑按钮位置
    self.completeBtn.frame = CGRectMake(312, 648, 80, 40);
    
//    设置编辑按钮下横线位置
    self.completeLevel.frame = CGRectMake(314, 685, 78, 4.4);
    
}

#pragma mark - 隐藏小键盘 

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_updatePersonalNameValueText resignFirstResponder];
    [_updatePersonalGradeValueText resignFirstResponder];
}

#pragma mark - 背景图getter（）

- (UIImageView *)updatePersonalBackground{
    if (!_updatePersonalBackground) {
        _updatePersonalBackground = [[UIImageView alloc]init];
//        _updatePersonalBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _updatePersonalBackground.image = [UIImage imageNamed:@"setEdit"];
    }
    return _updatePersonalBackground;
}

#pragma mark - 返回按钮getter（）

- (UIButton *)updatePersonReturnBtn{
    if (!_updatePersonReturnBtn) {
        _updatePersonReturnBtn = [[UIButton alloc]init];
//        _updatePersonReturnBtn.layer.borderWidth = 1;
//        _updatePersonReturnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _updatePersonReturnBtn.backgroundColor = [UIColor clearColor];
        [_updatePersonReturnBtn addTarget:self action:@selector(updatePersonReturnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updatePersonReturnBtn;
}

- (void)updatePersonReturnBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 头像图片getter（）

- (UIImageView *)updatePersonalPicture{
    if (!_updatePersonalPicture) {
        _updatePersonalPicture = [[UIImageView alloc]init];
//        _updatePersonalPicture.layer.borderWidth = 1.0f;
//        _updatePersonalPicture.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonalPicture.image = [UIImage imageNamed:@"学霸捐-头像"];
    }
    return _updatePersonalPicture;
}

#pragma mark - 名字getter（）

- (UILabel *)updatePersonalNameLabel{
    if (!_updatePersonalNameLabel) {
        _updatePersonalNameLabel = [[UILabel alloc]init];
//        _updatePersonalNameLabel.layer.borderWidth = 1.0f;
//        _updatePersonalNameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonalNameLabel.font = [UIFont systemFontOfSize:26.5];
        _updatePersonalNameLabel.textColor = [UIColor whiteColor];
        _updatePersonalNameLabel.text = @"姓名：";
    }
    return _updatePersonalNameLabel;
}

- (UITextField *)updatePersonalNameValueText{
    if (!_updatePersonalNameValueText) {
        _updatePersonalNameValueText = [[UITextField alloc]init];
//        _updatePersonalNameValueText.layer.borderWidth = 1.0f;
//        _updatePersonalNameValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonalNameValueText.font = [UIFont systemFontOfSize:26.5];
        _updatePersonalNameValueText.textColor = [UIColor whiteColor];
        _updatePersonalNameValueText.text = @"周颖英";
    }
    return _updatePersonalNameValueText;
}

//横线picture
- (UIImageView *)updatePersonInfoNameLevel{
    if (!_updatePersonInfoNameLevel) {
        _updatePersonInfoNameLevel = [[UIImageView alloc]init];
//        _updatePersonInfoNameLevel.layer.borderWidth = 1.0f;
//        _updatePersonInfoNameLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonInfoNameLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _updatePersonInfoNameLevel;
}

#pragma mark - 年级getter（）

- (UILabel *)updatePersonalGradeLabel{
    if (!_updatePersonalGradeLabel) {
        _updatePersonalGradeLabel = [[UILabel alloc]init];
//        _updatePersonalGradeLabel.layer.borderWidth = 1.0f;
//        _updatePersonalGradeLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonalGradeLabel.font = [UIFont systemFontOfSize:26.5];
        _updatePersonalGradeLabel.textColor = [UIColor whiteColor];
        _updatePersonalGradeLabel.text = @"年级：";
    }
    return _updatePersonalGradeLabel;
}

- (UITextField *)updatePersonalGradeValueText{
    if (!_updatePersonalGradeValueText) {
        _updatePersonalGradeValueText = [[UITextField alloc]init];
//        _updatePersonalGradeValueText.layer.borderWidth = 1.0f;
//        _updatePersonalGradeValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonalGradeValueText.font = [UIFont systemFontOfSize:26.5];
        _updatePersonalGradeValueText.textColor = [UIColor whiteColor];
        _updatePersonalGradeValueText.text = @" 大二";
    }
    return _updatePersonalGradeValueText;
}

//横线picture
- (UIImageView *)updatePersonInfoGradeLevel{
    if (!_updatePersonInfoGradeLevel) {
        _updatePersonInfoGradeLevel = [[UIImageView alloc]init];
//        _updatePersonInfoGradeLevel.layer.borderWidth = 1.0f;
//        _updatePersonInfoGradeLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _updatePersonInfoGradeLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _updatePersonInfoGradeLevel;
}

#pragma mark - 表视图协议


//控制表视图有多少行

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

//控制表视图每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

//控制每一行用何种样式cell显示

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    personalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[personalInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

//        cell.layer.borderWidth = 1.0f;
//        cell.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.schoolLabel.text = _updatePersonalInfoInfo[indexPath.row];
        cell.upschoolLabel.text = _updateTemporaryArr[indexPath.row];
    }
    
    
    return cell;
}

////点击每一行时如何响应
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        
//    }else if(indexPath.section == 1){
//    }
//}

#pragma mark - 编辑按钮getter（）

- (UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [[UIButton alloc]init];
        
//        _completeBtn.layer.borderWidth = 1.0f;
//        _completeBtn.layer.borderColor = [[UIColor blackColor]CGColor];
        
        _completeBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        [_completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_completeBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completeBtn;
}

- (void)completeBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

//横线picture
- (UIImageView *)completeLevel{
    if (!_completeLevel) {
        _completeLevel = [[UIImageView alloc]init];
//        _completeLevel.layer.borderWidth = 1.0f;
//        _completeLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _completeLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _completeLevel;
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
