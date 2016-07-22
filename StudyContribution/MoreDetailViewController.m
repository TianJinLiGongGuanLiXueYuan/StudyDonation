//
//  MoreDetailViewController.m
//  StudyContribution
//
//  Created by Dark on 16/7/18.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "MoreDetailViewController.h"
#import "ContributionDetailViewController.h"
#import "Info.h"



@interface MoreDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong , nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic ,strong)NSArray *dataArr;
@property (nonatomic ,strong)NSArray *dataSource;


@end
@implementation MoreDetailViewController

#pragma mark - 生命周期及返回按钮

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self loadDataFromWeb];
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_mainTableView];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
}
-(void)left_btnclick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载数据源

-(void)loadDataFromWeb
{
    Info *info1 = [[Info alloc]init];
    info1.name = @"大英           四教207           2016-6-7";
    Info *info2 = [[Info alloc]init];
    info2.name = @"大物           三教201           2016-6-7";
    Info *info3 = [[Info alloc]init];
    info3.name = @"大英           四教207           2016-6-8";
    Info *info4 = [[Info alloc]init];
    info4.name = @"高数           四教211           2016-6-8";
    Info *info5 = [[Info alloc]init];
    info5.name = @"线代           一教101           2016-6-8";
  self.dataArr = @[info1,info2,info3,info4,info5];
}


#pragma mark - 表视图协议
//控制表视图有多少行

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
//控制每一行用何种样式cell显示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        Info *info = self.dataArr[indexPath.row];
       
        cell.textLabel.text =info.name;
        
    }
    return cell;
}
//控制表视图每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 44;
}
//点击每一行时如何响应
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"点击了%@行,(long)indexPath.row");
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
