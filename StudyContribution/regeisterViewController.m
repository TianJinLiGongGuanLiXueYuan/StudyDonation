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

#define TextWidth 300
#define TextHeight 200
#define BtnWidth 200
#define BtnHeight 50
#define XMarginText 57
#define XMarginBtn 107
#define YMargin 368

@interface regeisterViewController ()<CLLocationManagerDelegate>

//计时器
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) UIButton *tolotin;

//详细课程信息按钮
@property (nonatomic,strong) UIButton *classInfoBtn;

//上下课按钮
@property (nonatomic,strong) UIButton *classInBtn;
@property (nonatomic,strong) UIButton *classUpBtn;

//当前状态label
@property (nonatomic,strong) UILabel *currentstatusLabel;

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
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tolotin];
    
    [self.view addSubview:self.classInfoBtn];
    
    [self.view addSubview:self.classInBtn];
    [self.view addSubview:self.classUpBtn];
    
    [self.view addSubview:self.currentstatusLabel];
    
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
    
    self.tolotin.frame = CGRectMake(0, 64, 100, 30);
    
    //    设置课程详细按钮
    self.classInfoBtn.frame = CGRectMake(XMarginBtn, YMargin - 130, BtnWidth, BtnHeight);
    
    //    上下课按钮设置
    self.classInBtn.frame = CGRectMake(XMarginBtn, YMargin - 60, BtnWidth, BtnHeight);
    self.classUpBtn.frame = CGRectMake(XMarginBtn, YMargin + 10, BtnWidth, BtnHeight);
    
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

#pragma mark - 上课按钮配置

- (UIButton *)classInBtn{
    if(!_classInBtn)
    {
        _classInBtn = [[UIButton alloc] init];
        
        _classInBtn.layer.cornerRadius = 5;
        
        _classInBtn.backgroundColor = [UIColor purpleColor];
        [_classInBtn setTitle:@"上课" forState:UIControlStateNormal];
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
    }else{
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"失败" preferredStyle:UIAlertControllerStyleAlert];
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        NSLog(@"失败");
    }
}

#pragma mark - 下课按钮配置

- (UIButton *)classUpBtn{
    if(!_classUpBtn)
    {
        _classUpBtn = [[UIButton alloc] init];
        
        _classUpBtn.layer.cornerRadius = 5;
        
        _classUpBtn.backgroundColor = [UIColor orangeColor];
        [_classUpBtn setTitle:@"下课" forState:UIControlStateNormal];
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
    }else{
        _alertController = [UIAlertController alertControllerWithTitle:@"签到" message:@"失败" preferredStyle:UIAlertControllerStyleAlert];
        _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [_alertController addAction:_yesAction];
        [_alertController addAction:_noAction];
        
        [self presentViewController:_alertController animated:YES completion:nil];
        NSLog(@"失败");
    }
}

#pragma mark - 课程详情

-(UIButton *)classInfoBtn
{
    if(!_classInfoBtn)
    {
        _classInfoBtn = [[UIButton alloc]init];
        
        _classInfoBtn.layer.cornerRadius = 5;
        
        _classInfoBtn.backgroundColor = [UIColor lightGrayColor];
        [_classInfoBtn setTitle:@"课程详情" forState:UIControlStateNormal];
        [_classInfoBtn addTarget:self action:@selector(classInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInfoBtn;
}

-(void)classInfoBtnClick
{
    ClassInfoViewController *classinfoVC = [[ClassInfoViewController alloc]init];
    [self.navigationController pushViewController:classinfoVC animated:YES];
    
}

#pragma mark - 当前状态

-(UILabel *)currentstatusLabel
{
    if(!_currentstatusLabel)
    {
        _currentstatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(XMarginBtn, YMargin + 120, 200, 50)];
        _currentstatusLabel.font = [UIFont systemFontOfSize:18];
        _currentstatusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _currentstatusLabel;
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

- (void)timerFunc{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *nowTime = [dateFormatter stringFromDate:[NSDate date]];
    [_currentstatusLabel setText:nowTime];
}

#pragma mark - 临时使用

-(UIButton *)tolotin
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

-(void)tolotinbtnclick
{
    LoginViewController *logIn=[[LoginViewController alloc]init];
    
    CustomNavigationController *nav=[[CustomNavigationController alloc]initWithRootViewController:logIn];
    ApplicationDelegate.window.rootViewController=nav;
    //    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark - 我不知道干嘛用的

-(void)leftbtnClick{
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