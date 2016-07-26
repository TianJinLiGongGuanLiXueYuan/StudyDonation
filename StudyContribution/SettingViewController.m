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
#import "setPhotoCell.h"
#import "setCell.h"
#import "setExitBtnCell.h"
#import "regeisterViewController.h"
#import "ClassInfoViewController.h"
#import "PersonalInfoViewController.h"
#import "AboutUsView.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *settingArr;

@property (nonatomic,strong) UIImageView *setBackground;

@property (nonatomic,strong) UITableView *setTableView;

@property (nonatomic,strong) UIButton *setreturnBtn;

@end

@implementation SettingViewController

#pragma mark - 初始化级添加控件

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    隐藏导航栏
    [self.navigationController  setNavigationBarHidden:YES];
    
//    初始化数组
    _settingArr = @[@"修改个人信息",@"清除缓存",@"关于学霸捐"];
    
//    添加背景图
    [self.view addSubview:self.setBackground];
    
//    初始化TableView
    _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 414, 600) style:UITableViewStyleGrouped];
    _setTableView.backgroundColor = [UIColor clearColor];
    //    设置cell无下划线
    _setTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_setTableView];
    _setTableView.dataSource = self;
    _setTableView.delegate = self;
    _setTableView.showsVerticalScrollIndicator = NO;
    
//    添加返回按钮
    [self.view addSubview:self.setreturnBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - 设置控件位置

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //    设置背景图位置
    self.setBackground.frame = [UIScreen mainScreen].bounds;
    
    //    设置返回按钮位置
    self.setreturnBtn.frame = CGRectMake(10, 10, 45, 45);
}

#pragma mark - 背景图getter（）

- (UIImageView *)setBackground{
    if (!_setBackground) {
        _setBackground = [[UIImageView alloc]init];
//        _setBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _setBackground.image = [UIImage imageNamed:@"学霸捐-设置"];
    }
    return _setBackground;
}

#pragma mark - 返回按钮getter（）

- (UIButton *)setreturnBtn{
    if (!_setreturnBtn) {
        _setreturnBtn = [[UIButton alloc]init];
        
//        _setreturnBtn.layer.borderWidth = 1.0f;
//        _setreturnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _setreturnBtn.backgroundColor = [UIColor clearColor];
        
        [_setreturnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setreturnBtn;
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
//    static NSString *identifer = @"cell";
    if (indexPath.section == 0) {
        setPhotoCell *photocell = [[setPhotoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
        photocell.backgroundColor = [UIColor clearColor];
        
//        设置当前cell选中无样式
        photocell.selectionStyle = UITableViewCellSelectionStyleNone;
        return photocell;
    }else if(indexPath.section == 1){
        setCell *setInfocell = [[setCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setInfo"];
//        添加右边小箭头
        [setInfocell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        setInfocell.backgroundColor = [UIColor clearColor];
        
//        设置当前cell选中无样式
        setInfocell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        setInfocell.setInfo.text = _settingArr[indexPath.row];
        
        return setInfocell;
    }else{
        setExitBtnCell *exitBtncell = [[setExitBtnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"exitInfo"];
        
        exitBtncell.backgroundColor = [UIColor clearColor];
        
//        设置当前cell选中无样式
        exitBtncell.selectionStyle = UITableViewCellSelectionStyleNone;
        return exitBtncell;
    }
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
                BOOL useCustomView = NO;
                
                AboutUsView *aboutUsVC;
                if (useCustomView) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
                    view.backgroundColor = [UIColor redColor];
                    view.layer.cornerRadius = 5.f;
                    view.layer.borderColor = [UIColor blackColor].CGColor;
                    view.layer.borderWidth = 5.f;
                    
                    aboutUsVC = [[AboutUsView alloc] initWithViewController:self view:view];
                }
                else {
                    aboutUsVC = [[AboutUsView alloc] initWithViewController:self title:@"学霸捐" message:@"学霸捐信息······！"];
                }
                [aboutUsVC show];
            }
                break;
            default:
                break;
        }
    }else{
    }
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
