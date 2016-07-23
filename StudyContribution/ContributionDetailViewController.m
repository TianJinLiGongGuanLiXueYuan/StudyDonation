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
@property (strong,nonatomic) UITableView *classInfo;
@property (strong,nonatomic) UITableView *detailInfo;
@property (nonatomic,strong) NSArray *dataSource1;
@property (nonatomic,strong) NSArray *dataSource0;
@property (nonatomic,strong) UIButton *confirmbtn;
@property(nonatomic,strong)UILabel *donationLab;
@property(nonatomic,strong)UILabel *donationText;
@property(nonatomic,strong)UIButton *moreBtn;
@property(nonatomic,strong)UIButton *selectAllBtn;

@property (nonatomic,strong)IBOutlet UIButton *shangke;
@property (nonatomic,strong)IBOutlet UIButton *juanzeng;

- (IBAction)shangKe:(id)sender;
- (IBAction)juanZeng:(id)sender;


@end


@implementation ContributionDetailViewController{
    int mark;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    mark=0;
    
    
//    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    UIImageView *background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    background.image = [UIImage imageNamed:@"123"];
    [self.view addSubview:background];
    
    //上课信息
    _classInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x-170,self.view.center.y-200, 340, 360) style:UITableViewStylePlain];
    _classInfo.backgroundColor = [UIColor clearColor];
    _classInfo.layer.borderWidth = 2;
    _classInfo.layer.borderColor = [[UIColor whiteColor]CGColor];
    _classInfo.backgroundColor = [UIColor clearColor];
    _classInfo.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_classInfo];
    _classInfo.delegate = self;
    _classInfo.dataSource = self;
    _classInfo.showsVerticalScrollIndicator = NO;
    
    //捐赠信息
    _detailInfo=[[UITableView alloc]initWithFrame:CGRectMake(self.view.center.x-170,self.view.center.y-200, 340, 360) style:UITableViewStylePlain];
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
    
    _dataSource1=@[@"可捐赠纪录1",@"可捐赠纪录2",@"可捐赠纪录3",@"可捐赠纪录4",@"可捐赠纪录5",@"可捐赠纪录6"];
    _dataSource0=@[@"已捐赠纪录1",@"已捐赠纪录2",@"已捐赠纪录3",@"已捐赠纪录4",@"已捐赠纪录5",@"已捐赠纪录6"];
    
    _classInfo.allowsMultipleSelection = YES;
    _detailInfo.allowsMultipleSelection = YES;
    
    [self.view addSubview:self.confirmbtn];
    
    [self.view addSubview:self.selectAllBtn];
    
    [self.view addSubview:self.donationLab];
    
    [self.view addSubview:self.donationText];
    
    [self.view addSubview:self.shangke];
    [_shangke addTarget:self action:@selector(shangKe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.juanzeng];
    [_juanzeng addTarget:self action:@selector(juanZeng:) forControlEvents:UIControlEventTouchUpInside];
    

   
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
        static NSString *identifer=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//cell选中后颜色
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            
        }
        cell.textLabel.text=_dataSource1[indexPath.row];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        [cell.contentView addSubview:cell.textLabel];//        name横线picture
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(cell.center.x-159,cell.center.y+32, 340, 2)];
        imageView1.image = [UIImage imageNamed:@"学霸捐－短横线"];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(cell.center.x+130,cell.center.y-10, 30, 30)];
        
        UIImage *image2 = [UIImage imageNamed:@"学霸捐－白对勾"];
        [btn setBackgroundImage:image2 forState:UIControlStateNormal];
        UIImage *image3 = [UIImage imageNamed:@"tick"];
        [btn setBackgroundImage:image3 forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];//打勾功能
        [cell.contentView addSubview:btn];
        
        [cell.contentView addSubview:imageView1];
        
        cell.textLabel.textColor = [UIColor whiteColor];
        return cell;
    }else
        if ([tableView isEqual:_detailInfo]){
            static NSString *identifer=@"cell";
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;//cell选中后颜色
            if (cell==nil) {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
                
            }
        cell.textLabel.text=_dataSource0[indexPath.row];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        [cell.contentView addSubview:cell.textLabel];//        name横线picture
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(cell.center.x-159,cell.center.y+32, 340, 2)];
        imageView1.image = [UIImage imageNamed:@"学霸捐－短横线"];
        [cell.contentView addSubview:imageView1];
        cell.textLabel.textColor = [UIColor whiteColor];
        return cell;
    }
//    if (mark==1) {
//        cell.textLabel.text=_dataSource1[indexPath.row];
//    }
//    else if (mark==0) {
//        cell.textLabel.text=_dataSource0[indexPath.row];
//    }
        return nil;
}

#pragma 上课记录

-(UIButton *)shangke
{
    if(!_shangke)
    {
        _shangke = [[UIButton alloc] initWithFrame:CGRectMake(100, 80, 100,25)];
        [_shangke setTitle:@"上课记录" forState:UIControlStateNormal];
        _shangke.backgroundColor = [UIColor purpleColor];
        //   [_confirmbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shangke;
}

#pragma 捐赠记录

-(UIButton *)juanzeng
{
    if(!_juanzeng)
    {
        _juanzeng = [[UIButton alloc] initWithFrame:CGRectMake(250, 80, 100,25)];
        [_juanzeng setTitle:@"捐赠记录" forState:UIControlStateNormal];
        _juanzeng.backgroundColor = [UIColor purpleColor];
//        [_confirmbtn addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _juanzeng;
}


#pragma 捐赠按钮

-(UIButton *)confirmbtn
{
    if(!_confirmbtn)
    {
        _confirmbtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 605, 100,25)];
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
        _donationLab = [[UILabel alloc]initWithFrame:CGRectMake(70,545,180,25)];
        //  _donationLab = UILineBreakModeWordWrap;
        _donationLab.numberOfLines = 0;
        _donationLab.textColor = [UIColor whiteColor];
        _donationLab.font = [UIFont systemFontOfSize:20];
        _donationLab.text = @"当前可捐赠额度：";
    }
    return _donationLab;
}

-(UILabel *)donationText
{
    if(!_donationText){
    
        _donationText = [[UILabel alloc]initWithFrame:CGRectMake(260,545,150,25)];
        _donationText.numberOfLines = 0;
        _donationText.textColor = [UIColor whiteColor];
        _donationText.font = [UIFont systemFontOfSize:20];
        _donationText.text = @"666.66";;
    }
    return _donationText;
}

#pragma choose函数
- (void)choose:(UIButton *)sender{
    if (sender.selected==YES) {
    [sender setSelected:NO];
    }else if (sender.selected==NO) {
        [sender setSelected:YES];
    }
}


#pragma 切换分页
- (void)shangKe:(id)sender{
    [_shangke setTitle:@"!!!!" forState:UIControlStateHighlighted];
    _detailInfo.hidden=YES;
    _classInfo.hidden=NO;
    }

- (void)juanZeng:(id)sender{
    [_juanzeng setTitle:@"!!!!" forState:UIControlStateHighlighted];
    _detailInfo.hidden=NO;
    _classInfo.hidden=YES;
}


// 全选
-(UIButton *)selectAllBtn{
        if(!_selectAllBtn)
                {
                    _selectAllBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 605, 100,25)];
                    [_selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
                    _selectAllBtn.backgroundColor = [UIColor purpleColor];
                    //   [_confirmbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
                }
                return _selectAllBtn;
}


- (void)selectAllBtnClick:(UIButton *)button {
    //    [self.tableView reloadData];
    for (int i = 0; i < self.dataSource0.count; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [_detailInfo selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
}


@end
