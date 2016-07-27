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
#import "ButtonCell.h"
#import "classInRecordCell.h"
#import "contributionRecordCell.h"
#import "contributionBtnCell.h"

@interface ContributionDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL sceletState;
}


@property (nonatomic,strong) UIImageView *contributionBackground;

@property (nonatomic,strong) NSArray *dateArr;
@property (nonatomic,strong) NSArray *countArr;
@property (nonatomic,strong) NSArray *moneyArr;

@property (nonatomic,strong) UIButton *contributionReturnBtn;

@property (strong,nonatomic) UITableView *classInfo;
@property (strong,nonatomic) UITableView *detailInfo;

@property (nonatomic,strong) NSIndexPath *nowIndexPath;

@property (nonatomic,strong) classInRecordCell *classInRecordcell;
@property (nonatomic,strong) ButtonCell *BtnCell;
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

//上课信息
    _classInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x-181,self.view.center.y-310, 363, 620) style:UITableViewStylePlain];
    _classInfo.layer.cornerRadius = 5.0f;
    _classInfo.backgroundColor = [UIColor clearColor];
    _classInfo.layer.borderWidth = 2;
    _classInfo.layer.borderColor = [[UIColor whiteColor]CGColor];
    _classInfo.backgroundColor = [UIColor clearColor];
    _classInfo.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_classInfo];
    _classInfo.delegate = self;
    _classInfo.dataSource = self;
    _classInfo.showsVerticalScrollIndicator = NO;
    
////捐赠信息
    _detailInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x-181,self.view.center.y-310, 363, 620) style:UITableViewStylePlain];
    _detailInfo.layer.cornerRadius = 5.0f;
    _detailInfo.backgroundColor = [UIColor clearColor];
    _detailInfo.layer.borderWidth = 2;
    _detailInfo.layer.borderColor = [[UIColor whiteColor]CGColor];
    _detailInfo.backgroundColor = [UIColor clearColor];
    _detailInfo.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_detailInfo];
    _detailInfo.delegate = self;
    _detailInfo.dataSource = self;
    _detailInfo.showsVerticalScrollIndicator = NO;
    _detailInfo.hidden=YES;
   
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
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    return 1;
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 60;
    }
    return 0;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.00001f;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 60;
    }
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if ([tableView isEqual:_classInfo]) {
            _BtnCell=[[ButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BtnCell"];
//        _BtnCell.layer.borderWidth = 1.0f;
//        _BtnCell.layer.borderColor = [[UIColor blackColor]CGColor];
            _BtnCell.classInRecordBtn.backgroundColor = [UIColor whiteColor];
            [_BtnCell.classInRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _BtnCell.contributionRecordBtn.backgroundColor = [UIColor clearColor];
            [_BtnCell.contributionRecordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_BtnCell.classInRecordBtn addTarget:self action:@selector(classInRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [_BtnCell.contributionRecordBtn addTarget:self action:@selector(contributionRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
            _BtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return _BtnCell;
        }else if ([tableView isEqual:_detailInfo]){
                _BtnCell=[[ButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BtnCell"];
                //        _BtnCell.layer.borderWidth = 1.0f;
                //        _BtnCell.layer.borderColor = [[UIColor blackColor]CGColor];
                _BtnCell.classInRecordBtn.backgroundColor = [UIColor clearColor];
                [_BtnCell.classInRecordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                _BtnCell.contributionRecordBtn.backgroundColor = [UIColor whiteColor];
                [_BtnCell.contributionRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_BtnCell.classInRecordBtn addTarget:self action:@selector(classInRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [_BtnCell.contributionRecordBtn addTarget:self action:@selector(contributionRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
                _BtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
                return _BtnCell;
        }
    }
    return nil;
}

//设置每行cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_classInfo]) {        
        if (indexPath.section == 0) {
            _classInRecordcell=[[classInRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BtnCell"];
            _classInRecordcell.backgroundColor = [UIColor clearColor];
            _classInRecordcell.selectionStyle = UITableViewCellSelectionStyleNone;
            _classInRecordcell.classInDateLabel.text = _dateArr[indexPath.row];
            _classInRecordcell.classInDetailLabel.text = _countArr[indexPath.row];
            _classInRecordcell.tickImage.image = [UIImage imageNamed:@"学霸捐－白对勾"];
            if(sceletState == YES){
                [_classInRecordcell seleteMode];
            }
            
            
            return _classInRecordcell;
        }else{
            contributionBtnCell *contributionBtncell=[[contributionBtnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BtnCell"];
            contributionBtncell.backgroundColor = [UIColor clearColor];
            contributionBtncell.selectionStyle = UITableViewCellSelectionStyleNone;
            [contributionBtncell.confirmContributionBtn addTarget:self action:@selector(confirmContributionBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [contributionBtncell.selectAllBtn addTarget:self action:@selector(selectAllBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
            return contributionBtncell;
        }
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

#pragma mark - 上课记录点击按钮点击事件

- (void)classInRecordBtnClick{
    _classInfo.hidden = NO;
    _detailInfo.hidden = YES;
}

#pragma mark - 捐赠记录点击按钮点击事件

- (void)contributionRecordBtnClick{
    _classInfo.hidden = YES;
    _detailInfo.hidden = NO;
}


#pragma mark - 确定捐献按钮
- (void)confirmContributionBtnClick{
    
}

#pragma mark - 全选按钮
- (void)selectAllBtnBtnClick{
    sceletState = !sceletState;
    [self.classInfo reloadData];
}
@end
