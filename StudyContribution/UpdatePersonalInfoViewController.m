//
//  UpdatePersonalInfoViewController.m
//  StudyContribution
//
//  Created by Student01 on 16/7/22.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "UpdatePersonalInfoViewController.h"
#import "CustomNavigationController.h"
#import "PersonalInfoViewController.h"

@interface UpdatePersonalInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

//背景图
@property (nonatomic,strong) UIImageView *background;

@property (nonatomic,strong) NSArray *schoolInfo;

//返回按钮
@property (nonatomic,strong) UIButton *returnBtn;

//头像图片
@property (nonatomic,strong) UIImageView *picture;

//姓名
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UITextField *nameValueText;

//年级
@property (nonatomic,strong) UILabel *gradeLabel;
@property (nonatomic,strong) UITextField *gradeValueText;

//学生信息
@property (nonatomic,strong) UITableView *studentInfoTabel;

//编辑按钮
@property (nonatomic,strong) UIButton *completeBtn;

@end

@implementation UpdatePersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    添加背景图
    [self.view addSubview:self.background];
    
//    数组初始化
    _schoolInfo = @[@"学校：",@"所在学院：",@"所在系：",@"专业名称：",@"班级：",@"学号："];
    
//    添加返回按钮
    [self.view addSubview:self.returnBtn];
    
//    添加头像picture
    [self.view addSubview:self.picture];
    
//    添加姓名
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.nameValueText];
    
//    添加年级
    [self.view addSubview:self.gradeLabel];
    [self.view addSubview:self.gradeValueText];
    
//    初始化TableView
    _studentInfoTabel = [[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x - 187, self.view.center.y - 140, 374, 390) style:UITableViewStylePlain];
    _studentInfoTabel.scrollEnabled = NO;
    _studentInfoTabel.backgroundColor = [UIColor clearColor];
    _studentInfoTabel.layer.borderWidth = 1.0f;
    _studentInfoTabel.layer.borderColor = [[UIColor whiteColor]CGColor];
//    设置cell无下划线
    _studentInfoTabel.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_studentInfoTabel];
    _studentInfoTabel.dataSource = self;
    _studentInfoTabel.delegate = self;
    _studentInfoTabel.showsVerticalScrollIndicator = NO;
    
//    添加编辑按钮
    [self.view addSubview:self.completeBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 隐藏小键盘 

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_nameValueText resignFirstResponder];
    [_gradeValueText resignFirstResponder];
}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _background.image = [UIImage imageNamed:@"学霸捐-编辑信息-3"];
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
    PersonalInfoViewController *personalVC = [[PersonalInfoViewController alloc]init];
    [self.navigationController pushViewController:personalVC animated:YES];
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

#pragma mark - 名字

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

- (UITextField *)nameValueText{
    if (!_nameValueText) {
        _nameValueText = [[UITextField alloc]initWithFrame:CGRectMake(300, 62, 100, 50)];
//        _nameValueText.layer.borderWidth = 1.0f;
//        _nameValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _nameValueText.font = [UIFont systemFontOfSize:26.5];
        _nameValueText.textColor = [UIColor whiteColor];
        _nameValueText.text = @"周颖英";
    }
    return _nameValueText;
}

#pragma mark - 年级

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

- (UITextField *)gradeValueText{
    if (!_gradeValueText) {
        _gradeValueText = [[UITextField alloc]initWithFrame:CGRectMake(300, 142, 100, 50)];
//        _gradeValueText.layer.borderWidth = 1.0f;
//        _gradeValueText.layer.borderColor = [[UIColor blackColor]CGColor];
        _gradeValueText.font = [UIFont systemFontOfSize:26.5];
        _gradeValueText.textColor = [UIColor whiteColor];
        _gradeValueText.text = @" 大二";
    }
    return _gradeValueText;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

//        cell.layer.borderWidth = 1.0f;
//        cell.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 131, 40)];
//        label.layer.borderWidth = 1.0f;
//        label.layer.borderColor = [[UIColor whiteColor]CGColor];
        label.font = [UIFont systemFontOfSize:26];
        label.text = _schoolInfo[indexPath.row];
        [cell.contentView addSubview:label];
        
//        横线picture
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(2, 52, 370, 4.4)];
//        imageView.layer.borderWidth = 1.0f;
//        imageView.layer.borderColor = [[UIColor blackColor]CGColor];
        imageView.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
        [cell.contentView addSubview:imageView];
    }
    
    
    return cell;
}

//点击每一行时如何响应
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else if(indexPath.section == 1){
    }
}

#pragma mark - 编辑按钮

- (UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [[UIButton alloc]initWithFrame:CGRectMake(312, 648, 80, 40)];
        
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
    PersonalInfoViewController *updatePersonInfoVC = [[PersonalInfoViewController alloc]init];
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
