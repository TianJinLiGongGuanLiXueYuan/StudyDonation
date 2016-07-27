//
//  PersonalInfoViewController.m
//  StudyContribution
//
//  Created by Student01 on 16/7/22.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "CustomNavigationController.h"
#import "personalInfoCell.h"
#import "SettingViewController.h"

@interface PersonalInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isequal;
}
@property (nonatomic,strong) NSArray *personalInfo;
@property (nonatomic,strong) NSArray *temporaryArr;

//背景图
@property (nonatomic,strong) UIImageView *personalBackground;

//返回按钮
@property (nonatomic,strong) UIButton *personReturnBtn;

//头像图片
@property (nonatomic,strong) UIImageView *personalPicture;
@property (nonatomic,strong) UIButton *pictureBtn;

//姓名
@property (nonatomic,strong) UILabel *personalNameLabel;
@property (nonatomic,strong) UITextField *personalNameValueText;
@property (nonatomic,strong) UIImageView *personInfoNameLevel;

//年级
@property (nonatomic,strong) UILabel *personalGradeLabel;
@property (nonatomic,strong) UITextField *personalGradeValueText;
@property (nonatomic,strong) UIImageView *personInfoGradeLevel;

//学生信息
@property (nonatomic,strong) UITableView *personInfoTableView;

@property (nonatomic,strong) personalInfoCell *personalCell;

//编辑按钮
@property (nonatomic,strong) UIButton *editBtn;

//编辑按钮下横线
@property (nonatomic,strong) UIImageView *editBtnLevel;

@end

@implementation PersonalInfoViewController

#pragma mark - 初始化级添加控件

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isequal = NO;
    
//    数组初始化
    _personalInfo = @[@"学校：",@"所在学院：",@"所在系：",@"专业名称：",@"班级：",@"学号："];
    _temporaryArr = @[@"天津财经大学",@"理工学院",@"信息科学与技术系",@"计科",@"计科1301",@"201311146"];
    
//    添加背景图
    [self.view addSubview:self.personalBackground];
    
//    添加返回按钮
    [self.view addSubview:self.personReturnBtn];
    
//    添加头像picture
    [self.view addSubview:self.personalPicture];
    [self.view addSubview:self.pictureBtn];
    
//    添加姓名
    [self.view addSubview:self.personalNameLabel];
    [self.view addSubview:self.personalNameValueText];
    [self.view addSubview:self.personInfoNameLevel];
    
//    添加年级
    [self.view addSubview:self.personalGradeLabel];
    [self.view addSubview:self.personalGradeValueText];
    [self.view addSubview:self.personInfoGradeLevel];
    
//    初始化TableView
    _personInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x - 186.5, self.view.center.y - 140, 390, 390) style:UITableViewStylePlain];
//    设置tableview不能滑动
    _personInfoTableView.scrollEnabled = NO;    
    _personInfoTableView.backgroundColor = [UIColor clearColor];
//    _studentInfoTabel.layer.borderWidth = 1.0f;
//    _studentInfoTabel.layer.borderColor = [[UIColor whiteColor]CGColor];
    //    设置cell无下划线
    _personInfoTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_personInfoTableView];
    _personInfoTableView.dataSource = self;
    _personInfoTableView.delegate = self;
    _personInfoTableView.showsVerticalScrollIndicator = NO;

//    添加编辑按钮
    [self.view addSubview:self.editBtn];
    
//    编辑按钮下横线
    [self.view addSubview:self.editBtnLevel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置控件位置

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.personalBackground.frame = [UIScreen mainScreen].bounds;
    
//    设置返回按钮位置
    self.personReturnBtn.frame = CGRectMake(5, 10, 40, 45);
    
//    设置头像位置
    self.personalPicture.frame = CGRectMake(50, 46.5, 102.4, 145);
    self.pictureBtn.frame = CGRectMake(50, 46.5, 102.4, 145);
    
//    设置名字了label位置
    self.personalNameLabel.frame = CGRectMake(185, 62, 100, 50);
    
//    设置名字text位置
    self.personalNameValueText.frame = CGRectMake(300, 62, 100, 50);
    
//    设置名字了label下横线位置
    self.personInfoNameLevel.frame = CGRectMake(183, 110, 213, 4.4);
    
//    设置年级label位置
    self.personalGradeLabel.frame = CGRectMake(185, 142, 80, 50);
    
//    设置年级text位置
    self.personalGradeValueText.frame =CGRectMake(300, 142, 100, 50);
    
//    设置年级label下横线位置
    self.personInfoGradeLevel.frame = CGRectMake(183, 188, 213, 4.4);
    
//    设置编辑按钮位置
    self.editBtn.frame = CGRectMake(312, 648, 80, 40);
    
//    设置编辑按钮下横线位置
    self.editBtnLevel.frame = CGRectMake(314, 685, 78, 4.4);
    
}
#pragma mark - 背景图getter（）

- (UIImageView *)personalBackground{
    if (!_personalBackground) {
        _personalBackground = [[UIImageView alloc]init];
//        _personalBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _personalBackground.image = [UIImage imageNamed:@"personalInfo"];
    }
    return _personalBackground;
}

#pragma mark - 返回按钮getter（）

- (UIButton *)personReturnBtn{
    if (!_personReturnBtn) {
        _personReturnBtn = [[UIButton alloc]init];
//        _personReturnBtn.layer.borderWidth = 1;
//        _personReturnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _personReturnBtn.backgroundColor = [UIColor clearColor];
        [_personReturnBtn addTarget:self action:@selector(personReturnBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personReturnBtn;
}

- (void)personReturnBtnBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 头像图片getter（）

- (UIImageView *)personalPicture{
    if (!_personalPicture) {
        _personalPicture = [[UIImageView alloc]init];
//        _personalPicture.layer.borderWidth = 1.0f;
//        _personalPicture.layer.borderColor = [[UIColor blackColor]CGColor];
        _personalPicture.image = [UIImage imageNamed:@"学霸捐-头像"];
    }
    return _personalPicture;
}

- (UIButton *)pictureBtn{
    if (!_pictureBtn) {
        _pictureBtn = [[UIButton alloc]init];
        //        _pictureBtn.layer.borderWidth = 1;
        //        _pictureBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _pictureBtn.backgroundColor = [UIColor clearColor];
        [_pictureBtn addTarget:self action:@selector(pictureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pictureBtn;
}

- (void)pictureBtnClick{
    NSLog(@"头像点击事件");
}

#pragma mark - 名字getter（）

- (UILabel *)personalNameLabel{
    if (!_personalNameLabel) {
        _personalNameLabel = [[UILabel alloc]init];
//        _personalNameLabel.layer.borderWidth = 1.0f;
//        _personalNameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _personalNameLabel.font = [UIFont systemFontOfSize:26.5];
        _personalNameLabel.textColor = [UIColor whiteColor];
        _personalNameLabel.text = @"姓名：";
    }
    return _personalNameLabel;
}

- (UITextField *)personalNameValueText{
    if (!_personalNameValueText) {
        _personalNameValueText = [[UITextField alloc]init];
//        _personalNameValueText.layer.borderWidth = 1.0f;
//        _personalNameValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _personalNameValueText.font = [UIFont systemFontOfSize:26.5];
        _personalNameValueText.textColor = [UIColor whiteColor];
        _personalNameValueText.text = @"周颖英";
    }
    return _personalNameValueText;
}

//横线picture
- (UIImageView *)personInfoNameLevel{
    if (!_personInfoNameLevel) {
        _personInfoNameLevel = [[UIImageView alloc]init];
//        _personInfoNameLevel.layer.borderWidth = 1.0f;
//        _personInfoNameLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _personInfoNameLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _personInfoNameLevel;
}

#pragma mark - 年级getter（）

- (UILabel *)personalGradeLabel{
    if (!_personalGradeLabel) {
        _personalGradeLabel = [[UILabel alloc]init];
//        _personalGradeLabel.layer.borderWidth = 1.0f;
//        _personalGradeLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _personalGradeLabel.font = [UIFont systemFontOfSize:26.5];
        _personalGradeLabel.textColor = [UIColor whiteColor];
        _personalGradeLabel.text = @"年级：";
    }
    return _personalGradeLabel;
}

- (UITextField *)personalGradeValueText{
    if (!_personalGradeValueText) {
        _personalGradeValueText = [[UITextField alloc]init];
//        _personalGradeValueText.layer.borderWidth = 1.0f;
//        _personalGradeValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _personalGradeValueText.font = [UIFont systemFontOfSize:26.5];
        _personalGradeValueText.textColor = [UIColor whiteColor];
        _personalGradeValueText.text = @" 大二";
    }
    return _personalGradeValueText;
}

//横线picture
- (UIImageView *)personInfoGradeLevel{
    if (!_personInfoGradeLevel) {
        _personInfoGradeLevel = [[UIImageView alloc]init];
//        _personInfoGradeLevel.layer.borderWidth = 1.0f;
//        _personInfoGradeLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _personInfoGradeLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _personInfoGradeLevel;
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
    _personalCell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (_personalCell == nil) {
        _personalCell = [[personalInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            
//        _personalCell.layer.borderWidth = 1.0f;
//        _personalCell.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _personalCell.backgroundColor = [UIColor clearColor];
        
//        设置当前cell选中无样式
        _personalCell.selectionStyle = UITableViewCellSelectionStyleNone;
                
        _personalCell.schoolLabel.text = _personalInfo[indexPath.row];
        _personalCell.schoolText.text = _temporaryArr[indexPath.row];
        
        [_personalCell noEnableEting];

//        if(isequal == YES){
//            [_personalCell enableEting];
//        }else{
//            [_personalCell noEnableEting];
//        }
    }
    
    
    return _personalCell;
}

////点击每一行时如何响应
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        
//    }else if(indexPath.section == 1){
//    }
//}

#pragma mark - 编辑按钮getter（）

- (UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]init];
        
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
    isequal = !isequal;
//    [self.personInfoTableView ];
}

#pragma mark - 编辑按钮下横线

- (UIImageView *)editBtnLevel{
    if (!_editBtnLevel) {
        _editBtnLevel = [[UIImageView alloc]init];
        
//        _editBtnLevel.layer.borderWidth = 1.0f;
//        _editBtnLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _editBtnLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _editBtnLevel;
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
