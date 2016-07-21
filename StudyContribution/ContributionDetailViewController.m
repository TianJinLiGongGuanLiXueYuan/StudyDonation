//
//  LoginViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "ContributionDetailViewController.h"
#import "MoreDetailViewController.h"
#import "CustomNavigationController.h"

@interface ContributionDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *detailInfo;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) UIButton *confirmbtn;
@property(nonatomic,strong)UILabel *donationLab;
@property(nonatomic,strong)UITextField *donationTextF;
@property(nonatomic,strong)UIButton *moreBtn;

@end

@implementation ContributionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _detailInfo=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    [self.view addSubview:_detailInfo];
    _detailInfo.delegate = self;
    _detailInfo.dataSource = self;
    _detailInfo.showsVerticalScrollIndicator = NO;
    _detailInfo.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _dataSource=@[@"可捐赠纪录1",@"可捐赠纪录2",@"可捐赠纪录3",@"可捐赠纪录4",@"可捐赠纪录5"];
    
    [self.view addSubview:self.confirmbtn];
    
    [self.view addSubview:self.donationLab];
    
    [self.view addSubview:self.donationTextF];
    
    [self.view addSubview:self.moreBtn];
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

#pragma 表视图协议

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 150;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 20;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
}
//设置每行cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.textLabel.text=_dataSource[indexPath.row];
    }
    cell.textLabel.text=_dataSource[indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:cell.textLabel];
    
    return cell;
}

#pragma 捐赠按钮

-(UIButton *)confirmbtn
{
    if(!_confirmbtn)
    {
        _confirmbtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100,50)];
        _confirmbtn.center = CGPointMake(self.view.center.x, 550);
        [_confirmbtn setTitle:@"确认捐赠" forState:UIControlStateNormal];
        _confirmbtn.backgroundColor = [UIColor purpleColor];
        //   [_confirmbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmbtn;
}

#pragma 捐赠label and textfield
-(UILabel *)donationLab
{
    if(!_donationLab)
    {
        _donationLab = [[UILabel alloc]initWithFrame:CGRectMake(100,450,100,25)];
        //  _donationLab = UILineBreakModeWordWrap;
        _donationLab.numberOfLines = 0;
        _donationLab.text = @"捐赠数量";
    }
    return _donationLab;
}

-(UITextField *)donationTextF
{
    if(!_donationTextF)
    {
        _donationTextF = [[UITextField alloc]initWithFrame:CGRectMake(200,450,100,25)];
        _donationTextF.backgroundColor = [UIColor lightGrayColor];
        _donationTextF.borderStyle = UITextBorderStyleLine;
        _donationTextF.secureTextEntry=YES;
    }
    return _donationTextF;
}


#pragma 更多记录
-(UIButton *)moreBtn
{
    if (!_moreBtn)
    {
        _moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(180,180,100,50)];
        _moreBtn.center = CGPointMake(self.view.center.x, 600);
        [_moreBtn setTitle:@"更多记录" forState:UIControlStateNormal];
        [_moreBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //  [_forgetBtn addTarget:self action:@selector(forgetbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

- (void)moreBtnClick{
    MoreDetailViewController *moreVC = [[MoreDetailViewController alloc]init];
    [self.navigationController pushViewController:moreVC animated:YES];
}


@end
