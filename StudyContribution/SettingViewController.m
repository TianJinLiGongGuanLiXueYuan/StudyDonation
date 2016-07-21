//
//  SettingViewController.m
//  StudyContribution
//
//  Created by 刘芮东 on 16/7/13.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "SettingViewController.h"
#import "CustomNavigationController.h"
#import "CustomnavView.h"
#import "CustomerInfoViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *mainTable;
@property (nonatomic,strong) NSArray *settingArr;

/*
 @property (nonatomic,strong) UIButton *exitBtn;
 */

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _settingArr = @[@"清除缓存",@"关于我们"];
    
    _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 414, 600) style:UITableViewStyleGrouped];
    [self.view addSubview:_mainTable];
//    self.mainTable.backgroundColor = [UIColor purpleColor];
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
    _mainTable.showsVerticalScrollIndicator = NO;
    _mainTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    /*
     [self.view addSubview:self.exitBtn];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

/*
 #pragma mark - 初始化
 
 - (UIButton *)exitBtn{
 if (!_exitBtn) {
 _exitBtn = [[UIButton alloc]initWithFrame:CGRectMake(107, 468, 200, 100)];
 
 _exitBtn.layer.cornerRadius = 5;
 
 _exitBtn.backgroundColor = [UIColor grayColor];
 [_exitBtn setTitle:@"退出" forState:UIControlStateNormal];
 [_exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
 }
 return _exitBtn;
 }
 
 - (void)exitBtnClick{
 }
 */

#pragma mark - 表视图协议


//控制表视图有多少行

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 2;
    }else{
        return 1;
    }
}

/*
 //每个分组上边预留的空白高度
 
 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
 
 return 20;
 }
 
 //每个分组下边预留的空白高度
 
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
 {
 if (section==1) {
 return 40;
 }
 return 20;
 }
 */

//控制每一行用何种样式cell显示

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        cell.textLabel.text = @"清理缓存";
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        imageView.image = [UIImage imageNamed:@"i.png"];
        [cell.contentView addSubview:imageView];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 100, 80)];
        //        nameLabel.backgroundColor = [UIColor grayColor];
        nameLabel.text = @"王小明";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:nameLabel];
    }else if(indexPath.section == 1){
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.text = _settingArr[indexPath.row];
    }else{
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.text = @"退出";
    }
    return cell;
}

//控制表视图每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 100;
    }
    return 60;
}

//点击每一行时如何响应
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CustomerInfoViewController *customerInfo = [[CustomerInfoViewController alloc]init];
        CustomNavigationController *nav = [[CustomNavigationController alloc]initWithRootViewController:customerInfo];
        ApplicationDelegate.window.rootViewController = nav;
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
                NSString *path=[[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
                NSFileManager *fileManager=[NSFileManager defaultManager];
                if ([fileManager fileExistsAtPath:path]) {
                    NSArray *childerFiles=[fileManager subpathsAtPath:path];
                    for (NSString *fileName in childerFiles) {
                        //如有需要，加入条件，过滤掉不想删除的文件
                        NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
                        [fileManager removeItemAtPath:absolutePath error:nil];
                        NSLog(@"成功");
                    }
                }else{
                    NSLog(@"失败");
                }
            }
                break;
            case 1:
            {
                NSLog(@"关于我们cell事件");
            }
                break;
            default:
                break;
        }
    }else{
        NSLog(@"退出cell事件");
    }
    NSLog(@"aaa%ld行",(long)indexPath.row);
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
