//
//  ClassInfoViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/14.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ClassInfoViewController.h"
#import "timetable.h"
#import "regeisterViewController.h"

@interface ClassInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) UIImageView *background;
@property(nonatomic,strong)UIButton *timetableBtn;
@property (nonatomic,strong) UIButton *returnBtn;
@property (nonatomic,strong) NSArray *classArr;
@property (nonatomic,strong) NSArray *locArr;
@property (nonatomic,strong) NSArray *timeArr;
@property (nonatomic,strong) NSArray *class1Arr;
@property (nonatomic,strong) NSArray *loc1Arr;
@property (nonatomic,strong) NSArray *time1Arr;

@end
@implementation ClassInfoViewController



    
    // Dispose of any resources that can be recreated.

 - (void)viewDidLoad
 {   [super viewDidLoad];
     [self.view addSubview:self.background];
     [self.view addSubview:self.returnBtn];
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
     
     _classArr = @[@"大英",@"大物",@"现代",@"毛概",@"高数"];
     _locArr = @[@"四教201",@"一教101",@"二教203",@"四教503",@"四教304"];
     _timeArr = @[@"50分钟前",@"四小时前",@"一天前",@"一天前",@"两天前"];
     _class1Arr = @[@"高数"];
     _loc1Arr = @[@"四教304"];
     _time1Arr = @[@"一小时后"];


 // 设置tableView的数据源
     self.TableView.dataSource = self;
     _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
     _TableView.backgroundColor = [UIColor clearColor];
     

     [self.view addSubview:_TableView];
     _TableView.delegate = self;
     _TableView.dataSource = self;
     [self.view addSubview:self.timetableBtn];
     [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
     [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    
     }

#pragma mark - 返回按钮

-(void)left_btnclick
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        
         _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _background.image = [UIImage imageNamed:@"124"];
    }
    return _background;
}
 #pragma mark - UITableViewDataSource

     //告诉tableview一共有多少组
  
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor redColor];
    
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
}
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
         NSLog(@"numberOfSectionsInTableView");
         return 2;
}
   //2.第section组有多少行

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
         NSLog(@"numberOfRowsInSection %ld", (long)section);
         if (0 == section) {
                 // 第0组有多少行
                 return 5;
             }else
                 {
                         // 第1组有多少行
                         return 1;
                     }
     }

     // 3.告知系统每一行显示什么内容

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSLog(@"cellForRowAtIndexPath %ld %ld", (long)indexPath.section, (long)indexPath.row);
    
     //    indexPath.section; // 第几组
     //    indexPath.row; // 第几行
        // 1.创建cell
       UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
   
     cell.backgroundColor = [UIColor clearColor];
     [self.TableView       setSeparatorStyle:UITableViewCellSeparatorStyleNone];
     
         // 2.设置数据
         // cell.textLabel.text = @"";
         // 判断是第几组的第几行
         if (0 == indexPath.section) { // 第0组
//            if (0 == indexPath.row)
//                // 第0组第0行
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 108, 40)];
            label1.text = _classArr[indexPath.row];
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(173, 0, 108, 40)];
            label2.text = _locArr[indexPath.row];
            UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(320, 0, 108, 40)];
            label3.text = _timeArr[indexPath.row];
             
//             字典用法
//             NSDictionary *dic=[NSDictionary dictionary];
//             [dic setValue:@"aasdf" forKey:@"class"];
//             [dic setValue:@"aasdf" forKey:@""];
//             [dic setValue:@"aasdf" forKey:@"name"];
//             
//             NSString *str=dic[@"name"];
     
             [cell addSubview:label1];
             [cell addSubview:label2];
             [cell addSubview:label3];
//
             }else if (1 == indexPath.section) // 第1组
                {
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    UILabel *labela = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 108, 40)];
                    
                    labela.text = _class1Arr[indexPath.row];
                    UILabel *labelb = [[UILabel alloc]initWithFrame:CGRectMake(173, 0, 108, 40)];
                    
                    labelb.text = _loc1Arr[indexPath.row];
                    
                    UILabel *labelc = [[UILabel alloc]initWithFrame:CGRectMake(320, 0, 108, 40)];
                    labelc.text = _time1Arr[indexPath.row];
                    [cell addSubview:labela];
                    [cell addSubview:labelb];
                    [cell addSubview:labelc];
                    }
         // 3.返回要显示的控件
     
         return cell;
    
     }

// 第section组头部显示什么标题

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, 40)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10,20, 400, 30) ];
    label.textAlignment = NSTextAlignmentCenter;
    
        if (0 == section) {
            label.text=@"近期课程详情";
                   }else{
            label.text=@"下次课程时间及地点";
           
        }
    label.textColor=[UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    [view addSubview:label];
    
    return view;
}



//第section组底部显示什么标题
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, 100)];

    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10,2, self.view.bounds.size.width, 30)];
    if (0 == section) {
        label.text=@"近期课程都学会了么？课后要复习哦~";
        
    }else{
        label.text=@"作为学霸一定要去上课啊~加油！";
        
    }
    label.textColor=[UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    
    [view addSubview:label];
    
    return view;
}

-(UIButton *)timetableBtn
{
    if (!_timetableBtn)
    {
        _timetableBtn = [[UIButton alloc]initWithFrame:CGRectMake(180,180,100,50)];
        _timetableBtn.center = CGPointMake(self.view.center.x, 600);
        [_timetableBtn setTitle:@"课程表" forState:UIControlStateNormal];
        [_timetableBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_timetableBtn addTarget:self action:@selector(timetableBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _timetableBtn;
}

- (void)timetableBtnClick{
    timetable *timetb = [[timetable alloc]init];
    [self.navigationController pushViewController:timetb animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFootInSection:(NSInteger)section{
    return 50;

}
            
@end

