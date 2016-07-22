//
//  regeisterViewController.m
//  StudyContribution
//
//  Created by 刘芮东 on 16/7/12.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "regeisterViewController.h"
#import "LoginViewController.h"
#import "CustomNavigationController.h"
#import "ClassInfoViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "SettingViewController.h"

#define BtnWidth 120
#define XMarginText 57
#define XMargin 247
#define YMargin 368

@interface regeisterViewController ()<CLLocationManagerDelegate>

@property (nonatomic,strong) UIButton *tolotin;

@property (nonatomic,strong) UIImageView *background;

//当前状态label
@property (nonatomic,strong) UILabel *weekdayLabel;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *currentstatusLabel;

//详细课程信息按钮
@property (nonatomic,strong) UIButton *classInfoBtn;

//上下课按钮
@property (nonatomic,strong) UIButton *classInBtn;
@property (nonatomic,strong) UIButton *classUpBtn;

//软件信息label
@property (nonatomic,strong) UILabel *swInfoLabel;

//设置按钮
@property (nonatomic,strong) UIButton *settingBtn;

//打钩图片
@property (nonatomic,strong) UIImageView *tickImage1;
@property (nonatomic,strong) UIImageView *tickImage2;

//消息框
@property (nonatomic,strong) UIAlertController *alertController;
@property (nonatomic,strong) UIAlertAction *yesAction;
@property (nonatomic,strong) UIAlertAction *noAction;

/*
 //定位
 @property (nonatomic,strong) CLLocationManager *locationManager;
 */


@end

@implementation regeisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    
//    隐藏导航栏
    [self.navigationController  setNavigationBarHidden:YES];
    
//    添加背景图
    [self.view addSubview:self.background];
    
//    添加打钩图片
    [self.view addSubview:self.tickImage1];
    [self.view addSubview:self.tickImage2];
    
    [self.view addSubview:self.tolotin];
    
//    添加日期label
    [self.view addSubview:self.weekdayLabel];
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.currentstatusLabel];
    [self getTimer];
    
//    添加课程信息按钮
    [self.view addSubview:self.classInfoBtn];
    
//    添加上下课按钮
    [self.view addSubview:self.classInBtn];
    [self.view addSubview:self.classUpBtn];
    
//    添加软件信息label
    [self.view addSubview:self.swInfoLabel];
    
//    添加设置按钮
    [self.view addSubview:self.settingBtn];

    /*
//    初始化定位
     self.locationManager = [[CLLocationManager alloc]init];
     self.locationManager.delegate = self;
     self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
     self.locationManager.distanceFilter = 1000.0f;
     
     [self.locationManager requestWhenInUseAuthorization];
     [self.locationManager requestAlwaysAuthorization];
     
     
//根据经纬度创建两个位置对象
     CLLocation *loc1=[[CLLocation alloc]initWithLatitude:26.081 longitude:119.3];
//    CLLocation *loc1=[[CLLocation alloc]initWithLatitude:39.9 longitude:116.3];
     CLLocation *loc2=[[CLLocation alloc]initWithLatitude:26.08 longitude:119.3];
//计算两个位置之间的距离
     CLLocationDistance distance=[loc1 distanceFromLocation:loc2];
     NSLog(@"(%@)和(%@)的距离=%fKM",loc1,loc2,distance/1000);
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tolotin.frame = CGRectMake(0, 0, 100, 30);
    
//    设置课程详细按钮
    self.classInfoBtn.frame = CGRectMake(46, YMargin - 143, 100, 230);
    
//    上下课按钮设置
    self.classInBtn.frame = CGRectMake(XMargin + 1, YMargin - 154, BtnWidth, 130);
    self.classUpBtn.frame = CGRectMake(XMargin + 3.5, YMargin + 32, BtnWidth, 130);
    
//    设置按钮
    self.settingBtn.frame = CGRectMake(XMargin + 14.5, 602.5, 100, 50);
    
    /*
//    开始定位
     [self.locationManager startUpdatingLocation];
     */
    
}

/*
 -(void)viewWillDisappear:(BOOL)animated{
 [super viewWillDisappear:animated];
 
 [self.locationManager stopUpdatingLocation];
 }
 */

#pragma mark - 背景颜色

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _background.image = [UIImage imageNamed:@"学霸捐-首页"];
    }
    return _background;
}

#pragma mark - 当前状态

- (UILabel *)weekdayLabel
{
    if(!_weekdayLabel)
    {
        _weekdayLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 70, 170, 60)];
//        _weekdayLabel.backgroundColor = [UIColor grayColor];
        
//        _weekdayLabel.layer.borderWidth = 1;
//        _weekdayLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _weekdayLabel.numberOfLines = 0;
        _weekdayLabel.textColor = [UIColor whiteColor];
        _weekdayLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:52];
        _weekdayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _weekdayLabel;
}

- (UILabel *)monthLabel
{
    if(!_monthLabel)
    {
        _monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 140, 150, 30)];
//        _monthLabel.backgroundColor = [UIColor purpleColor];
        
//        _monthLabel.layer.borderWidth = 1;
//        _monthLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _monthLabel.numberOfLines = 0;
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.font = [UIFont systemFontOfSize:23.5];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _monthLabel;
}

- (UILabel *)currentstatusLabel
{
    if(!_currentstatusLabel)
    {
        _currentstatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(224, 74.5, 155, 100)];
//        _currentstatusLabel.backgroundColor = [UIColor purpleColor];
        
        _currentstatusLabel.layer.cornerRadius = 5.0f;
        _currentstatusLabel.layer.borderWidth = 1.0f;
        _currentstatusLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _currentstatusLabel.numberOfLines = 0;
        _currentstatusLabel.textColor = [UIColor whiteColor];
        _currentstatusLabel.font = [UIFont systemFontOfSize:25];
        _currentstatusLabel.textAlignment = NSTextAlignmentCenter;
        _currentstatusLabel.text = @"在上课";
    }
    return _currentstatusLabel;
}

#pragma mark - 课程详情

- (UIButton *)classInfoBtn
{
    if(!_classInfoBtn)
    {
        _classInfoBtn = [[UIButton alloc]init];
        
//        _classInfoBtn.layer.borderWidth = 1.0f;
//        _classInfoBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        [_classInfoBtn addTarget:self action:@selector(classInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInfoBtn;
}

- (void)classInfoBtnClick
{
    ClassInfoViewController *classinfoVC = [[ClassInfoViewController alloc]init];
    [self.navigationController pushViewController:classinfoVC animated:YES];
    
}

#pragma mark - 上课按钮配置

- (UIButton *)classInBtn{
    if(!_classInBtn)
    {
        _classInBtn = [[UIButton alloc] init];
        
//        _classInBtn.layer.borderWidth = 1.0f;
//        _classInBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        [_classInBtn addTarget:self action:@selector(classInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInBtn;
}

- (void)classInBtnClick{
    NSDate *date8 = [self getCustomDateWithHour:8 andMinute:45];
    NSDate *date23 = [self getCustomDateWithHour:18 andMinute:00];
    
    NSDate *currentDate = [NSDate date];
    
    if([currentDate compare:date8] == NSOrderedDescending && [currentDate compare:date23] == NSOrderedAscending){
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"成功" preferredStyle:UIAlertControllerStyleAlert];
        
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        
        NSLog(@"成功");
        
        _tickImage1.image = [UIImage imageNamed:@"tick"];;
        _tickImage2.image = [UIImage imageNamed:@""];;
    }else{
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"失败" preferredStyle:UIAlertControllerStyleAlert];
        
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        NSLog(@"失败");
        
        _tickImage1.image = [UIImage imageNamed:@"tick"];;
        _tickImage2.image = [UIImage imageNamed:@""];;
    }
}

#pragma mark - 下课按钮配置

- (UIButton *)classUpBtn{
    if(!_classUpBtn)
    {
        _classUpBtn = [[UIButton alloc] init];
        
//        _classUpBtn.layer.borderWidth = 1.0f;
//        _classUpBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        [_classUpBtn addTarget:self action:@selector(classUpBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classUpBtn;
}

- (void)classUpBtnClick{
    NSDate *date8 = [self getCustomDateWithHour:8 andMinute:45];
    NSDate *date23 = [self getCustomDateWithHour:18 andMinute:00];
    
    NSDate *currentDate = [NSDate date];
    
    if([currentDate compare:date8] == NSOrderedDescending && [currentDate compare:date23] == NSOrderedAscending){
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"成功" preferredStyle:UIAlertControllerStyleAlert];
        
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        NSLog(@"成功");
        
        _tickImage1.image = [UIImage imageNamed:@""];;
        _tickImage2.image = [UIImage imageNamed:@"tick"];;
    }else{
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"失败" preferredStyle:UIAlertControllerStyleAlert];
        
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        NSLog(@"失败");
        
        _tickImage1.image = [UIImage imageNamed:@""];;
        _tickImage2.image = [UIImage imageNamed:@"tick"];;
    }
}

#pragma mark - 软件信息label

- (UILabel *)swInfoLabel
{
    if(!_swInfoLabel)
    {
        _swInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 571, 180, 50)];
        
//        _swInfoLabel.layer.borderWidth = 1.0f;
//        _swInfoLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    return _swInfoLabel;
}

#pragma mark - 设置按钮

- (UIButton *)settingBtn{
    if (!_settingBtn) {
        _settingBtn = [[UIButton alloc]init];
        
//        _settingBtn.layer.borderWidth = 1.0f;
//        _settingBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        [_settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingBtn;
}

- (void)settingBtnClick{
    SettingViewController *setVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}

#pragma mark - 打钩图片

- (UIImageView *)tickImage1{
    if (!_tickImage1) {
        _tickImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(355, 304, 40, 40)];
        
//        _tickImage1.layer.borderWidth = 1.0f;
//        _tickImage1.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    return _tickImage1;
}

- (UIImageView *)tickImage2{
    if (!_tickImage2) {
        _tickImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(355, 490, 40, 40)];
        
//        _tickImage2.layer.borderWidth = 1.0f;
//        _tickImage2.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    return _tickImage2;
}

#pragma mark - 获取时间函数

- (NSDate *)getCustomDateWithHour:(NSInteger )hour andMinute:(NSInteger)minute{
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc]init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    NSDateComponents *resultComps = [[NSDateComponents alloc]init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    [resultComps setMinute:minute];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

- (void)getTimer{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"",@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc]init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    long month = [currentComps month];
    long day = [currentComps day];
    long week = [currentComps weekday];
    
    _weekdayLabel.text = [NSString stringWithFormat:@"%@", [arrWeek objectAtIndex:week]];
    _monthLabel.text = [NSString stringWithFormat:@"%ld 月 %ld 号", month, day];
}

#pragma mark - 临时使用

- (UIButton *)tolotin
{
    if(!_tolotin)
    {
        _tolotin = [[UIButton alloc] init];
        _tolotin.backgroundColor = [UIColor blueColor];
        [_tolotin setTitle:@"到登录界面" forState:UIControlStateNormal];
        [_tolotin addTarget:self action:@selector(tolotinbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tolotin;
}

- (void)tolotinbtnclick
{
    LoginViewController *logIn=[[LoginViewController alloc]init];
    
    CustomNavigationController *nav=[[CustomNavigationController alloc]initWithRootViewController:logIn];
    ApplicationDelegate.window.rootViewController=nav;
    //    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark - 我不知道干嘛用的

- (void)leftbtnClick{
    NSLog(@"aa");
}

#pragma mark - 定位信息

/*
 - (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
 CLLocation *currLocation = [locations lastObject];
 
 NSLog(@"定位信息：%3.5f,%3.5f,%3.5f",currLocation.coordinate.latitude,currLocation.coordinate.longitude,currLocation.altitude);
 
 //    纬度Text赋值
 self.txtLat.text = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.latitude];
 //    经度度Text赋值
 self.txtLng.text = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.longitude];
 //    高度Text赋值
 self.txtAlt.text = [NSString stringWithFormat:@"%3.5f",currLocation.altitude];
 
 }
 
 -(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
 NSLog(@"error:%@",error);
 }
 
 - (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
 if (status == kCLAuthorizationStatusAuthorizedAlways) {
 NSLog(@"Authorized");
 }else if (status == kCLAuthorizationStatusAuthorizedWhenInUse){
 NSLog(@"AuthorizedWhenInUse");
 }else if (status == kCLAuthorizationStatusDenied){
 NSLog(@"Denied");
 }else if (status == kCLAuthorizationStatusRestricted) {
 NSLog(@"Restricted");
 }else if (status == kCLAuthorizationStatusNotDetermined){
 NSLog(@"NotDetermined");
 }
 }
 */
@end