//
//  ClassInfoViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/14.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ClassInfoViewController.h"

@interface ClassInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@end
@implementation ClassInfoViewController
-(void)left_btnclick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}
 - (void)viewDidLoad
 {
     [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
     [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
       [super viewDidLoad];
         // 设置tableView的数据源
         self.TableView.dataSource = self;
     _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
     [self.view addSubview:_TableView];
     _TableView.delegate = self;
     _TableView.dataSource = self;
    
     }
 #pragma mark - UITableViewDataSource
 /**
    20  *  1.告诉tableview一共有多少组
    21  */
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
         NSLog(@"numberOfRowsInSection %ld", section);
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
     NSLog(@"cellForRowAtIndexPath %ld %ld", (long)indexPath.section, indexPath.row);
    
     //    indexPath.section; // 第几组
     //    indexPath.row; // 第几行
        // 1.创建cell
       UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
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
  
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
         // return @"标题";
         if (0 == section) {
                 return @"近期课程及详情";
             }else
                 {
                         return @"下次课程时间及地点";
                     }
     }
//第section组底部显示什么标题
 - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
 {
         if (0 == section) {
                 return @"之前的课程都学会了吗？课后要复习哦~";
             }else
                 {
                        return @"作为学霸一定要去上课啊~加油！";
                     }
    }
@end

