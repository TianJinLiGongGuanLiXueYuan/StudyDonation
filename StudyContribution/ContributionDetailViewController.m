//
//  LoginViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "ContributionDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MoreDetailViewController.h"
#import "CustomNavigationController.h"
#import "classInRecordCell.h"
#import "contributionRecordCell.h"
#import "contributionBtnCell.h"

@interface ContributionDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL sceletState;
}
//背景图
@property (nonatomic,strong) UIImageView *contributionBackground;

//临时数据
@property (nonatomic,strong) NSArray *dateArr;
@property (nonatomic,strong) NSArray *countArr;
@property (nonatomic,strong) NSArray *moneyArr;

//返回按钮
@property (nonatomic,strong) UIButton *contributionReturnBtn;

//两个数据表
@property (strong,nonatomic) UITableView *classInfo;
@property (strong,nonatomic) UITableView *detailInfo;

//上课记录按钮和捐献纪录按钮
@property (nonatomic,strong) UIButton *classInRecordBtn;
@property (nonatomic,strong) UIButton *contributionRecordBtn;

//当前可捐献lebel
@property (nonatomic,strong) UILabel *contributionInfo;

//金钱图片
@property (nonatomic,strong) UIImageView *moneyImage;

//可捐献钱数
@property (nonatomic,strong) UILabel *moneyCount;

//确定捐献按钮
@property (nonatomic,strong) UIButton *confirmContributionBtn;

//全选按钮
@property (nonatomic,strong) UIButton *selectAllBtn;


@property (nonatomic,strong) NSIndexPath *nowIndexPath;

@property (nonatomic,strong) classInRecordCell *classInRecordcell;
@property (nonatomic,strong) contributionRecordCell *contributionRecordcell;

@end


@implementation ContributionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    sceletState = NO;

    
    [self.view addSubview:self.contributionBackground];
    
    _dateArr = @[@"7月21日",@"7月23日",@"7月25日",@"7月26日",@"7月27日",@"7月29日"];
    _countArr = @[@"三单",@"一单",@"四单",@"三单",@"一单",@"二单"];
    _moneyArr = @[@"三分钱",@"一分钱",@"四分钱",@"三分钱",@"一分钱",@"二分钱"];
    
    [self.view addSubview:self.contributionReturnBtn];
    
    [self.view addSubview:self.classInRecordBtn];
    [self.view addSubview:self.contributionRecordBtn];
//上课信息
    _classInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x - 181,self.view.center.y - 250, 363, 360) style:UITableViewStylePlain];
    _classInfo.backgroundColor = [UIColor clearColor];
//    _classInfo.layer.borderWidth = 2.0f;
//    _classInfo.layer.borderColor = [[UIColor blackColor]CGColor];
    _classInfo.backgroundColor = [UIColor clearColor];
    _classInfo.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_classInfo];
    _classInfo.delegate = self;
    _classInfo.dataSource = self;
    _classInfo.showsVerticalScrollIndicator = NO;
    
////捐赠信息
    _detailInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x - 181,self.view.center.y - 250, 363, 360) style:UITableViewStylePlain];
    _detailInfo.backgroundColor = [UIColor blackColor];
//    _detailInfo.layer.borderWidth = 2.0f;
//    _detailInfo.layer.borderColor = [[UIColor whiteColor]CGColor];
    _detailInfo.backgroundColor = [UIColor clearColor];
    _detailInfo.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_detailInfo];
    _detailInfo.delegate = self;
    _detailInfo.dataSource = self;
    _detailInfo.showsVerticalScrollIndicator = NO;
    _detailInfo.hidden=YES;
    
    [self.view addSubview:self.contributionInfo];
    [self.view addSubview:self.moneyImage];
    [self.view addSubview:self.moneyCount];
    [self.view addSubview:self.confirmContributionBtn];
    [self.view addSubview:self.selectAllBtn];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

//    设置背景图位置
    self.contributionBackground.frame = [UIScreen mainScreen].bounds;
    
    self.classInRecordBtn.frame = CGRectMake(self.view.center.x - 181, self.view.center.y - 310, self.classInfo.bounds.size.width / 2, 60);
    self.contributionRecordBtn.frame = CGRectMake(self.view.center.x, self.view.center.y - 310, self.classInfo.bounds.size.width / 2, 60);
    
    self.contributionInfo.frame = CGRectMake(30, 500, 200, 50);
    self.moneyImage.frame = CGRectMake(240, 500, 30, 50);
    self.moneyCount.frame = CGRectMake(280, 500 ,100, 50);
    self.confirmContributionBtn.frame = CGRectMake(115, 572, 150, 50);
    self.selectAllBtn.frame = CGRectMake(270, 600, 100, 50);

}
#pragma mark - 背景图getter（）

- (UIImageView *)contributionBackground{
    if (!_contributionBackground) {
        _contributionBackground = [[UIImageView alloc]init];
        _contributionBackground.image = [UIImage imageNamed:@"学霸捐-设置"];
    }
    return _contributionBackground;
}

#pragma mark - 返回按钮getter（）

- (UIButton *)contributionReturnBtn{
    if (!_contributionReturnBtn) {
        _contributionReturnBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 45, 45)];
        
//        _contributionReturnBtn.layer.borderWidth = 1.0f;
//        _contributionReturnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _contributionReturnBtn.backgroundColor = [UIColor clearColor];
        
        [_contributionReturnBtn addTarget:self action:@selector(contributionReturnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contributionReturnBtn;
}

- (void)contributionReturnBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma 表视图协议

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//设置每行cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_classInfo]) {
        _classInRecordcell=[[classInRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BtnCell"];
        _classInRecordcell.backgroundColor = [UIColor clearColor];
        _classInRecordcell.selectionStyle = UITableViewCellSelectionStyleNone;
        _classInRecordcell.classInDateLabel.text = _dateArr[indexPath.row];
        _classInRecordcell.classInDetailLabel.text = _countArr[indexPath.row];
        _classInRecordcell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
        if(sceletState==YES){
            [_classInRecordcell seleteMode];
        }
        return _classInRecordcell;
    }else
        if ([tableView isEqual:_detailInfo]){
            _contributionRecordcell=[[contributionRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contributionRecordCell"];
            _contributionRecordcell.backgroundColor = [UIColor clearColor];
            _contributionRecordcell.contributionRecordnDateLabel.text = _dateArr[indexPath.row];
            _contributionRecordcell.contributionRecordLabel.text = _countArr[indexPath.row];
            _contributionRecordcell.contributionRecordMoney.text = _moneyArr[indexPath.row];
            _contributionRecordcell.selectionStyle = UITableViewCellSelectionStyleNone;
        return _contributionRecordcell;
    }
    return nil;
}

//点击每一行时如何响应
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.classInfo.allowsMultipleSelectionDuringEditing = YES;
    
    _nowIndexPath = [self.classInfo indexPathForSelectedRow];
    classInRecordCell *cell = [self.classInfo cellForRowAtIndexPath:_nowIndexPath];
    
    cell.mark = !cell.mark;
    
    switch (indexPath.row) {
        case 0:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }
            
        }
            break;
            
        case 1:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }
        }
            break;
            
        case 2:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }
        }
            break;
            
        case 3:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }

        }
            break;
            
        case 4:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }
        }
            break;
            
        case 5:
        {
            if(cell.mark == NO){
                cell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            }else{
                cell.tickImage.image = [UIImage imageNamed:@"tick"];
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - 上课记录点击按钮getter（）

- (UIButton *)classInRecordBtn{
    if (!_classInRecordBtn) {
        _classInRecordBtn = [[UIButton alloc]init];
//        _classInRecordBtn.layer.borderWidth = 2.0f;
//        _classInRecordBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
//        _classInRecordBtn.layer.cornerRadius = 5.0f;
        _classInRecordBtn.backgroundColor = [UIColor whiteColor];
        [_classInRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _classInRecordBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        [_classInRecordBtn setTitle:@"上课记录" forState:UIControlStateNormal];
        [_classInRecordBtn addTarget:self action:@selector(classInRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInRecordBtn;
}

- (void)classInRecordBtnClick{
    _classInfo.hidden = NO;
    _detailInfo.hidden = YES;
    _classInRecordBtn.backgroundColor = [UIColor whiteColor];
    [_classInRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _contributionRecordBtn.backgroundColor = [UIColor clearColor];
    [_contributionRecordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}

#pragma mark - 捐献记录按钮getter（）

- (UIButton *)contributionRecordBtn{
    if (!_contributionRecordBtn) {
        _contributionRecordBtn = [[UIButton alloc]init];
//        _contributionRecordBtn.layer.cornerRadius = 5.0f;
//        _contributionRecordBtn.layer.borderWidth = 2.0f;
//        _contributionRecordBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _contributionRecordBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        _contributionRecordBtn.backgroundColor = [UIColor clearColor];
        [_contributionRecordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_contributionRecordBtn setTitle:@"捐赠记录" forState:UIControlStateNormal];
        [_contributionRecordBtn addTarget:self action:@selector(contributionRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contributionRecordBtn;
}

- (void)contributionRecordBtnClick{
    _classInfo.hidden = YES;
    _detailInfo.hidden = NO;
    _classInRecordBtn.backgroundColor = [UIColor clearColor];
    [_classInRecordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _contributionRecordBtn.backgroundColor = [UIColor whiteColor];
    [_contributionRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

#pragma mark - 当前可捐献额度label

- (UILabel *)contributionInfo{
    if (!_contributionInfo) {
        _contributionInfo = [[UILabel alloc]init];
//        _contributionInfo.layer.borderWidth = 1.0f;
//        _contributionInfo.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionInfo.textAlignment = NSTextAlignmentCenter;
        _contributionInfo.font = [UIFont systemFontOfSize:25];
        _contributionInfo.textColor = [UIColor whiteColor];
        _contributionInfo.text = @"当前可捐献额度:";
    }
    return _contributionInfo;
}

#pragma mark - 金钱图片

- (UIImageView *)moneyImage{
    if (!_moneyImage) {
        _moneyImage = [[UIImageView alloc]init];
//                _moneyImage.layer.borderWidth = 1.0f;
//                _moneyImage.layer.borderColor = [[UIColor blackColor]CGColor];
        _moneyImage.image = [UIImage imageNamed:@"money"];
    }
    return _moneyImage;
}
#pragma mark - 可捐献钱数

- (UILabel *)moneyCount{
    if (!_moneyCount) {
        _moneyCount = [[UILabel alloc]init];
//                _moneyCount.layer.borderWidth = 1.0f;
//                _moneyCount.layer.borderColor = [[UIColor blackColor]CGColor];
        _moneyCount.textAlignment = NSTextAlignmentCenter;
        _moneyCount.font = [UIFont systemFontOfSize:26];
        _moneyCount.textColor = [UIColor whiteColor];
        _moneyCount.textAlignment = NSTextAlignmentLeft;
        _moneyCount.text = @"6.66";
    }
    return _moneyCount;
}

#pragma mark - 确定捐献按钮

- (UIButton *)confirmContributionBtn{
    if (!_confirmContributionBtn) {
        _confirmContributionBtn = [[UIButton alloc]init];
        _confirmContributionBtn.layer.borderWidth = 1.0f;
        _confirmContributionBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _confirmContributionBtn.layer.cornerRadius = 5.0f;
        _confirmContributionBtn.titleLabel.font = [UIFont systemFontOfSize:26];
        [_confirmContributionBtn setTitle:@"确定捐献" forState:UIControlStateNormal];
    }
    return _confirmContributionBtn;
}

#pragma mark - 全选按钮

- (UIButton *)selectAllBtn{
    if (!_selectAllBtn) {
        _selectAllBtn = [[UIButton alloc]init];
//                _selectAllBtn.layer.borderWidth = 1.0f;
//                _selectAllBtn.layer.borderColor = [[UIColor blackColor]CGColor];
        _selectAllBtn.titleLabel.font = [UIFont systemFontOfSize:26];
        [_selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_selectAllBtn addTarget:self action:@selector(selectAllBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectAllBtn;
}

- (void)selectAllBtnBtnClick{
    sceletState = !sceletState;
    [self.classInfo reloadData];
}
@end
