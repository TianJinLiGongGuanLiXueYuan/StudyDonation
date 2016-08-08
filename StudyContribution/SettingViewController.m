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
#import "LoginViewController.h"
#import "setPhotoCell.h"
#import "setCell.h"
#import "setExitBtnCell.h"
#import "regeisterViewController.h"
#import "ClassInfoViewController.h"
#import "PersonalInfoViewController.h"
#import "AboutUsView.h"

#define UISCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define TABLE_HEIGHT [UIScreen mainScreen].bounds.size.height * 4 / 5
#define ReturnButton_X 15
#define ReturnButton_Y 20
#define ReturnButton_WIDTH 20
#define ReturnButton_HEIGHT 30

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *settingArr;

//背景图
@property (nonatomic,strong) UIImageView *setBackground;

//布局表视图
@property (nonatomic,strong) UITableView *setTableView;

//返回按钮
@property (nonatomic,strong) UIButton *setReturnBtn;

//消息框
@property (nonatomic,strong) UIAlertController *cacheMessage;
@property (nonatomic,strong) UIAlertAction *messageConfirmBtn;
@property (nonatomic,strong) UIAlertAction *messageCancelBtn;

//数据获取
@property (nonatomic,strong) NSMutableDictionary *setPersonInfoData;

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
//    _messageConfirmBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^];
//    _messageCancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];

//    添加背景图
    [self.view addSubview:self.setBackground];
    
//    添加设置视图
    _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, UISCREEN_WIDTH, TABLE_HEIGHT) style:UITableViewStyleGrouped];
    _setTableView.backgroundColor = [UIColor clearColor];
    //    设置cell无下划线
    _setTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_setTableView];
    _setTableView.dataSource = self;
    _setTableView.delegate = self;
    _setTableView.showsVerticalScrollIndicator = NO;
    
//    添加返回按钮
    [self.view addSubview:self.setReturnBtn];
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
    self.setReturnBtn.frame = CGRectMake(ReturnButton_X, ReturnButton_Y,
                                         ReturnButton_WIDTH, ReturnButton_HEIGHT);
}

#pragma mark - 背景图getter（）

- (UIImageView *)setBackground{
    if (!_setBackground) {
        _setBackground = [[UIImageView alloc]init];
        _setBackground.image = [UIImage imageNamed:@"background"];
    }
    return _setBackground;
}

#pragma mark - 返回按钮getter（）

- (UIButton *)setReturnBtn{
    if (!_setReturnBtn) {
        _setReturnBtn = [[UIButton alloc]init];
//        _setReturnBtn.layer.borderWidth = 1.0f;
//        _setReturnBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        [_setReturnBtn setBackgroundImage:[UIImage imageNamed:@"returnPictrue"] forState:UIControlStateNormal];
        [_setReturnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setReturnBtn;
}

- (void)returnBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//#pragma mark - 设置视图getter（）
//
//- (UITableView *)setTableView{
//    if (!_setTableView) {
//        _setTableView = [[UITableView alloc]init];
////        _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 414, 600) style:UITableViewStyleGrouped];
//        _setTableView.backgroundColor = [UIColor clearColor];
////    设置cell无下划线
//        _setTableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    }
//    return _setTableView;
//}

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
        [exitBtncell.exitBtn addTarget:self action:@selector(exitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
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
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
                NSString *path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
                NSFileManager *fileManager=[NSFileManager defaultManager];
                
                NSString *Message = [NSString stringWithFormat:@"当前缓存的大小为\n%0.2fM",[self folderSizeAtPath:path]];
                
                _cacheMessage = [UIAlertController alertControllerWithTitle:@"清理缓存" message:Message preferredStyle:UIAlertControllerStyleAlert];
                
                
                if ([fileManager fileExistsAtPath:path]) {
                    _messageConfirmBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            NSArray *childerFiles = [fileManager subpathsAtPath:path];
                            for (NSString *fileName in childerFiles) {
                                //如有需要，加入条件，过滤掉不想删除的文件
                                NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
                                [fileManager removeItemAtPath:absolutePath error:nil];
                                NSLog(@"成功");
                            }
                    }];
                    _messageCancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
                    [_cacheMessage addAction:_messageCancelBtn];
                    [_cacheMessage addAction:_messageConfirmBtn];
                    [self presentViewController:_cacheMessage animated:YES completion:nil];
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

#pragma mark - 退出登录按钮事件

- (void)exitBtnClick:(UIButton *)sender{
    LoginViewController *logIn=[[LoginViewController alloc]init];
    
    CustomNavigationController *nav=[[CustomNavigationController alloc]initWithRootViewController:logIn];
    ApplicationDelegate.window.rootViewController=nav;
    //    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark - 清除缓存大小

//计算单个文件大小
- (float)folderSizeAtPath:(NSString *)folderPath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath]objectEnumerator];
    NSString *fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize / (1024.0 * 1024.0);
}
// 遍历文件夹，返回多少M
- (long long)fileSizeAtPath:(NSString *)filePath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        return [[manager attributesOfItemAtPath:filePath error:nil]fileSize];
    }
    return 0;
}


//- (float)filePath{
//    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//    return [self folderSizeAtPath:cachPath];
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
