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
@end
@implementation ClassInfoViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}
 - (void)viewDidLoad
 {
     [self.view addSubview:self.background];
     [self.view addSubview:self.returnBtn];
     
            [super viewDidLoad];
         // 设置tableView的数据源
         self.TableView.dataSource = self;
     _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
     _TableView.backgroundColor = [UIColor clearColor];
     [self.view addSubview:_TableView];
     _TableView.delegate = self;
     _TableView.dataSource = self;
     [self.view addSubview:self.timetableBtn];
//     [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
//     [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];

    
     }
//-(void)left_btnclick
//{
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
#pragma mark - 返回按钮

- (UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 45, 45)];
        
        //        _returnBtn.layer.borderWidth = 1.0f;
        //        _returnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _returnBtn.backgroundColor = [UIColor clearColor];
        
        [_returnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}

- (void)returnBtnClick{
    regeisterViewController *regeisterVC = [[ regeisterViewController alloc]init];
    [self.navigationController pushViewController:regeisterVC animated:YES];
}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        
         _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _background.image = [UIImage imageNamed:@"124"];
    }
    return _background;
}
 #pragma mark - UITableViewDataSource
 /**
    20  *  1.告诉tableview一共有多少组
    21  */
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
 /**
      *  2.第section组有多少行
      */
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
         NSLog(@"numberOfRowsInSection %d", section);
         if (0 == section) {
                 // 第0组有多少行
                 return 4;
             }else
                 {
                         // 第1组有多少行
                         return 1;
                     }
     }
 /**
      *  3.告知系统每一行显示什么内容
      */
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSLog(@"cellForRowAtIndexPath %d %d", indexPath.section, indexPath.row);
    
     //    indexPath.section; // 第几组
     //    indexPath.row; // 第几行
        // 1.创建cell
       UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
     cell.backgroundColor = [UIColor clearColor];
     
         // 2.设置数据
         // cell.textLabel.text = @"";
         // 判断是第几组的第几行
         if (0 == indexPath.section) { // 第0组
                 if (0 == indexPath.row) // 第0组第0行
                     {
                             cell.textLabel.text = @"大英4 四教203 30分钟前";
                         }else if (1 == indexPath.row) // 第0组第1行
                             {
                                     cell.textLabel.text = @"大物 一教211 2小时前";
                                 
                                 }else if (2 == indexPath.row)
                                 {
                                     cell.textLabel.text = @"高等数学 一教101 一天前";
                                 }else if (3== indexPath.row)
                                 {
                                     cell.textLabel.text = @"软件工程导论 一教309 一天前";
                                 }else if (4== indexPath.row)
                                 {
                                     cell.textLabel.text = @"高等数学 一教211 两天前";
                                 }

        
             }else if (1 == indexPath.section) // 第1组
                 {
                         if (0 == indexPath.row) { // 第0组第0行
                                 cell.textLabel.text = @"线性代数 四教303 50分钟后";
                             }
                     }
    
         // 3.返回要显示的控件
         return cell;
    
     }
// 第section组头部显示什么标题

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, 40)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10,2, 200, 30)];
        if (0 == section) {
            label.text=@"近期课程详情";
        
        }else{
            label.text=@"下次课程时间及地点";
           
        }
    label.textColor=[UIColor whiteColor];
    [view addSubview:label];
    
    return view;
}


// - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
// {
//     UILabel *label=[[UILabel alloc]init];
//     return label;
////         // return @"标题";
////         if (0 == section) {
////                 return @"近期课程及详情";
////                         }else
////                 {
////                         return @"下次课程时间及地点";
////                     }
//     
//     }
//第section组底部显示什么标题
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, 40)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10,2, 200, 30)];
    if (0 == section) {
        label.text=@"课后要复习哦~";
        
    }else{
        label.text=@"学霸一定要去上课啊~";
        
    }
    label.textColor=[UIColor whiteColor];
    [view addSubview:label];
    
    return view;
}
// - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
// {
//         if (0 == section) {
//             
//                 return @"之前的课程都学会了吗？课后要复习哦~";
//             
//             
//             
//             }else
//                 {
//                        return @"作为学霸一定要去上课啊~加油！";
//                     }
//    }

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    if (section == 0)
//    {
//        
//        UILabel *label1=[[UILabel alloc]init];
//        
//        label1.text=@"近期课程及详情";
//        
//        label1.textColor = [UIColor whiteColor];
////        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//        
//        return label1 ;
//    }
//    else
//    {
//        UILabel *label1=[[UILabel alloc]init];
//        
//        label1.text=@"我是好人";
//        
//        label1.textColor = [UIColor whiteColor];
//        
//        return label1 ;
//    }
//    
//    
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    
//    if (section == 0)
//        
//    {
//        
//        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 620, 60)];
//        
//        label2.text=@"我是好人";
//        
//        label2.textColor = [UIColor whiteColor];
//        
//        return label2 ;
//        
//    }
//    
//    
//    else
//        
//    {
//        
//        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//        
//        label2.text=@"我是程序员";
//        
//        label2.textColor = [UIColor whiteColor];
//
//        
//        return label2 ;
//        
//    }
//    
//}
//-(void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section
//{
//    view.tintColor = [UIColor whiteColor];
// 
//}
//-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
//{
//    view.tintColor = [UIColor whiteColor];
//}
-(UIButton *)timetableBtn
{
    if (!_timetableBtn)
    {
        _timetableBtn = [[UIButton alloc]initWithFrame:CGRectMake(180,180,100,50)];
        _timetableBtn.center = CGPointMake(self.view.center.x, 600);
        [_timetableBtn setTitle:@"课程表" forState:UIControlStateNormal];
        [_timetableBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_timetableBtn addTarget:self action:@selector(timetableBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //  [_forgetBtn addTarget:self action:@selector(forgetbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timetableBtn;
}

- (void)timetableBtnClick{
    timetable *timetb = [[timetable alloc]init];
    [self.navigationController pushViewController:timetb animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  44;
}

    - (CGFloat)tableView:(UITableView *)tableView heightForFootInSection:(NSInteger)section{
        return  44;

}

@end

