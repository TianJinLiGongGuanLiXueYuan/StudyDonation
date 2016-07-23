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
#import "regeisterViewController.h"
#import "ClassInfoViewController.h"
#import "PersonalInfoViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *settingArr;

@property (nonatomic,strong) UITableView *mainTable;

@property (nonatomic,strong) UIImageView *background;

@property (nonatomic,strong) UIButton *returnBtn;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    初始化数组
    _settingArr = @[@"修改个人信息",@"清除缓存",@"关于学霸捐"];
    
//    添加背景图
    [self.view addSubview:self.background];
    
//    初始化TableView
    _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 414, 600) style:UITableViewStyleGrouped];
    _mainTable.backgroundColor = [UIColor clearColor];
//    设置cell无下划线
    _mainTable.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_mainTable];
//    self.mainTable.backgroundColor = [UIColor purpleColor];
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
    _mainTable.showsVerticalScrollIndicator = NO;
    
//    添加返回按钮
    [self.view addSubview:self.returnBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _background.image = [UIImage imageNamed:@"学霸捐-设置"];
    }
    return _background;
}

#pragma mark - 返回点击事件

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
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 表视图协议


//控制表视图有多少行

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 3;
    }else{
        return 1;
    }
}

// 每个分组上边预留的空白高度

 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
     if (section == 0) {
         return 10;
     }else if(section == 1){
         return 6.5;
     }
     return 30;
 }
 
// 每个分组下边预留的空白高度

 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
 {
     if (section == 0) {
         return 10;
     }else if(section == 1){
         return 6.5;
     }
     return 30;
 }

//控制表视图每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 150;
    }else if(indexPath.section == 1){
        return 65;
    }
    return 80;
}

//控制每一行用何种样式cell显示

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        头像picture
         UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(48, -6.4, 102.8, 145)];
//        imageView.layer.borderWidth = 1.0f;
//        imageView.layer.borderColor = [[UIColor blackColor]CGColor];
        imageView.image = [UIImage imageNamed:@"学霸捐-头像"];
        [cell.contentView addSubview:imageView];
        
//        name横线picture
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(180, 133, 212, 5.1)];
//        imageView1.layer.borderWidth = 1.0f;
//        imageView1.layer.borderColor = [[UIColor blackColor]CGColor];
        imageView1.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
        [cell.contentView addSubview:imageView1];

//        名字label
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(168, 90, 100, 40)];
        nameLabel.font = [UIFont systemFontOfSize:24.5];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
//        nameLabel.layer.borderWidth = 1.0f;
//        nameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        nameLabel.text = @"周颖英";
        [cell.contentView addSubview:nameLabel];
    }else if(indexPath.section == 1){
//        添加右边小箭头
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

//        各行文本框
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(28, 20, cell.bounds.size.width, 40)];
//        label.layer.borderWidth = 1.0f;
//        label.layer.borderColor = [[UIColor whiteColor]CGColor];
        label.font = [UIFont systemFontOfSize:24.8];
        label.text = _settingArr[indexPath.row];
        label.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:label];
        
//        横线picture
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 58, 372, 4.4)];
//        imageView.layer.borderWidth = 1.0f;
//        imageView.layer.borderColor = [[UIColor blackColor]CGColor];
        imageView.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
        [cell.contentView addSubview:imageView];
    }else{
//        退出按钮
        UIButton *exitBtn = [[UIButton alloc]initWithFrame:CGRectMake(97, 8, 213, 45)];
//        exitBtn.layer.borderWidth = 1.0f;
//        exitBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        exitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [exitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        exitBtn.titleLabel.font = [UIFont systemFontOfSize:24.8];
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:exitBtn];
        
//        横线picture
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 50.5, 210, 4.4)];
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
        switch (indexPath.row) {
            case 0:
            {
                PersonalInfoViewController *personalInfoVC = [[PersonalInfoViewController alloc]init];
                [self.navigationController pushViewController:personalInfoVC animated:YES];
            }
                break;
            case 1:
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
            case 2:
            {
                NSLog(@"关于我们cell事件");
            }
                break;
            default:
                break;
        }
    }else{
    }
}


#pragma mark - 退出点击事件

- (void)exitBtnClick{
    NSLog(@"退出事件");
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
