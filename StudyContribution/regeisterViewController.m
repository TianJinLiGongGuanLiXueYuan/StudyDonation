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
#import "ContributionDetailViewController.h"

#define BtnWidth 120
#define XMarginText 57
#define XMargin 247
#define YMargin 368

@interface regeisterViewController ()<CLLocationManagerDelegate>

@property (nonatomic,strong) UIButton *tolotin;

//存储上、下课时间
@property (nonatomic,assign) long classInHour;
@property (nonatomic,assign) long classInMinute;
@property (nonatomic,assign) long classUpHour;
@property (nonatomic,assign) long classUpMinute;

//背景图
@property (nonatomic,strong) UIImageView *regeisterBackground;

//当前状态label
@property (nonatomic,strong) UILabel *weekdayLabel;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *currentstatusLabel;

//当前状态label下的横线
@property (nonatomic,strong) UIImageView *currentLevel;

//详细课程信息按钮
@property (nonatomic,strong) UIButton *classInfoBtn;

//详细课程按钮下横线
@property (nonatomic,strong) UIImageView *classInfoLevel;

//中间竖直横线
@property (nonatomic,strong) UIImageView *centerLevel;

//上课按钮
@property (nonatomic,strong) UIButton *classInBtn;

//上课按钮下横线
@property (nonatomic,strong) UIImageView *classInLevel;

//上课签到成功打钩图片
@property (nonatomic,strong) UIImageView *classInTick;

//下课按钮
@property (nonatomic,strong) UIButton *classUpBtn;

//下课签到成功打钩图片
@property (nonatomic,strong) UIImageView *classUpTick;

//下课按钮下横线
@property (nonatomic,strong) UIImageView *classUpLevel;

//软件信息label
@property (nonatomic,strong) UILabel *softwareInfoLabel;

//设置按钮
@property (nonatomic,strong) UIButton *settingBtn;

/*
 //定位
 @property (nonatomic,strong) CLLocationManager *locationManager;
 */

//消息框
@property (nonatomic,strong) UIAlertController *classInSignInMessage;
@property (nonatomic,strong) UIAlertController *classUpSignInMessage;
@property (nonatomic,strong) UIAlertAction *yesAction;
@property (nonatomic,strong) UIAlertAction *noAction;




@end

@implementation regeisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    初始化签到失败消息框
    _yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    _noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
//    隐藏导航栏
    [self.navigationController  setNavigationBarHidden:YES];
    
//    添加背景图
    [self.view addSubview:self.regeisterBackground];
    
//    添加日期label
    [self.view addSubview:self.weekdayLabel];
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.currentstatusLabel];
    [self getTimer];
    
//    添加当前状态下横线
    [self.view addSubview:self.currentLevel];
    
//    添加课程信息按钮
    [self.view addSubview:self.classInfoBtn];
    
//    添加课程信息下横线
    [self.view addSubview:self.classInfoLevel];
    
//    中间竖直横线
    [self.view addSubview:self.centerLevel];
    
//    添加上课按钮
    [self.view addSubview:self.classInBtn];
    
//    添加上课签到成功打钩图片
    [self.view addSubview:self.classInTick];
    
//    添加上课下横线
    [self.view addSubview:self.classInLevel];
    
//    添加下课按钮
    [self.view addSubview:self.classUpBtn];
    
//    添加下课签到成功打钩图片
    [self.view addSubview:self.classUpTick];
    
//    添加下课按钮下横线
    [self.view addSubview:self.classUpLevel];
    
//    添加软件信息label
    [self.view addSubview:self.softwareInfoLabel];
    
//    添加设置按钮
    [self.view addSubview:self.settingBtn];
    
//    临时使用
    [self.view addSubview:self.tolotin];

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
    
//    背景图位置
    self.regeisterBackground.frame = [UIScreen mainScreen].bounds;
    
//    当前状态位置
    self.weekdayLabel.frame =CGRectMake(14, 70, 170, 60);
    
    self.monthLabel.frame = CGRectMake(30, 140, 150, 30);
    
    self.currentstatusLabel.frame = CGRectMake(224, 74.5, 155, 100);
    
//    设置当前状态下横线位置
    self.currentLevel.frame = CGRectMake(14, 190, 390, 4.4);
    
//    设置课程详细按钮位置
    self.classInfoBtn.frame = CGRectMake(46, YMargin - 143, 100, 230);
    
//    设置详细课程下横线位置
    self.classInfoLevel.frame = CGRectMake(18, 477.5, 175, 4.4);
    
//    中间竖直横线位置
    self.centerLevel.frame = CGRectMake(204, YMargin - 161, 4.4, 462);

//    上课按钮设置位置
    self.classInBtn.frame = CGRectMake(XMargin + 1, YMargin - 154, BtnWidth, 130);
    
//    上课签到成功打钩图片位置
    self.classInTick.frame = CGRectMake(355, 304, 40, 40);
    
//    设置上课按钮下横线;位置
    self.classInLevel.frame = CGRectMake(223, 363, 175, 4.4);
    
//    下课按钮位置
    self.classUpBtn.frame = CGRectMake(XMargin + 1, YMargin + 32, BtnWidth, 130);
    
//    下课签到成功打钩图片位置
    self.classUpTick.frame = CGRectMake(355, 490, 40, 40);
    
//    设置下课按钮下横线位置
    self.classUpLevel.frame = CGRectMake(223, 558, 175, 4.4);
    
//    软件信息label位置
    _softwareInfoLabel.frame = CGRectMake(10, 571, 180, 50);
    
//    设置按钮位置
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

#pragma mark - 背景图getter（）

- (UIImageView *)regeisterBackground{
    if (!_regeisterBackground) {
        _regeisterBackground = [[UIImageView alloc]init];
        
//        _regeisterBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        
        _regeisterBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _regeisterBackground;
}

#pragma mark - 当前状态getter（）

- (UILabel *)weekdayLabel
{
    if(!_weekdayLabel)
    {
        _weekdayLabel = [[UILabel alloc]init];
        
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
        _monthLabel = [[UILabel alloc]init];
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
        _currentstatusLabel = [[UILabel alloc]init];
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

#pragma mark - 当前状态下横线

- (UIImageView *)currentLevel{
    if (!_currentLevel) {
        _currentLevel = [[UIImageView alloc]init];
//        _currentLevel.layer.borderWidth = 1.0f;
//        _currentLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _currentLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _currentLevel;
}

#pragma mark - 课程详情getter（）

- (UIButton *)classInfoBtn
{
    if(!_classInfoBtn)
    {
        _classInfoBtn = [[UIButton alloc]init];
        
//        _classInfoBtn.layer.borderWidth = 1.0f;
//        _classInfoBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _classInfoBtn.titleLabel.numberOfLines = 0;
        _classInfoBtn.titleLabel.font = [UIFont systemFontOfSize:50];
        [_classInfoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_classInfoBtn setTitle:@"课\n程\n详\n情" forState:UIControlStateNormal];
        [_classInfoBtn addTarget:self action:@selector(classInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInfoBtn;
}

- (void)classInfoBtnClick
{
    ContributionDetailViewController *classinfoVC = [[ContributionDetailViewController alloc]init];
    [self.navigationController pushViewController:classinfoVC animated:YES];
    
}

#pragma mark - 课程详情下横线

- (UIImageView *)classInfoLevel{
    if (!_classInfoLevel) {
        _classInfoLevel = [[UIImageView alloc]init];
//        _classInfoLevel.layer.borderWidth = 1.0f;
//        _classInfoLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classInfoLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _classInfoLevel;
}

#pragma mark - 中间竖直横线

- (UIImageView *)centerLevel{
    if (!_centerLevel) {
        _centerLevel = [[UIImageView alloc]init];
//        _centerLevel.layer.borderWidth = 1.0f;
//        _centerLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _centerLevel.image = [UIImage imageNamed:@"学霸捐－竖线"];
    }
    return _centerLevel;
}

#pragma mark - 上课按钮配置getter（）

- (UIButton *)classInBtn{
    if(!_classInBtn)
    {
        _classInBtn = [[UIButton alloc] init];
        
//        _classInBtn.layer.borderWidth = 1.0f;
//        _classInBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _classInBtn.titleLabel.numberOfLines = 0;
        _classInBtn.titleLabel.font = [UIFont systemFontOfSize:45];
        [_classInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_classInBtn setTitle:@"上课\n签到" forState:UIControlStateNormal];
        [_classInBtn addTarget:self action:@selector(classInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classInBtn;
}

- (void)classInBtnClick{
    
    
    _classInSignInMessage = [UIAlertController alertControllerWithTitle:@"签到失败" message:@"上课迟到\n现在不是上课签到时间" preferredStyle:UIAlertControllerStyleAlert];
    [_classInSignInMessage addAction:_yesAction];
    [_classInSignInMessage addAction:_noAction];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc]init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    _classInHour = [currentComps hour];
    _classInMinute = [currentComps minute];

    switch (_classInHour) {
        case 7:/* 8:00~8:45 */
        {
            if (50 <= _classInMinute && _classInMinute <= 59) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 8:/* 8:00~8:45  8:55~9:40 */
        {
            if (0 <= _classInMinute && _classInMinute <= 5) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else if (50 <= _classInMinute && _classInMinute <= 59) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 10:/* 10:10~10:55 */
        {
            if (0 <= _classInMinute && _classInMinute <= 15) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 11:/* 11:05~11:50 */
        {
            if (0 <= _classInMinute && _classInMinute <= 10) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 13:/* 14:00~14:40 */
        {
            if (40 <= _classInMinute && _classInMinute <= 59) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 14:/* 14:00~14:40 14:55~15:40 */
        {
            if (0 <= _classInMinute && _classInMinute <= 5) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else if (50 <= _classInMinute && _classInMinute <= 59) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 16:/* 16:10~16:55 */
        {
            if (0 <= _classInMinute && _classInMinute <= 15) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 17:/* 17:05~17:50 */
        {
            if (0 <= _classInMinute && _classInMinute <= 10) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 18:/* 18:30~19:15 */
        {
            if (20 <= _classInMinute && _classInMinute <= 35) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 19:/* 19:25~20:10 */
        {
            if (20 <= _classInMinute && _classInMinute <= 25) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 20:/* 20:20~21:05 */
        {
            if (15 <= _classInMinute && _classInMinute <= 25) {
                _classInTick.image = [UIImage imageNamed:@"tick"];
                _classUpTick.image = [UIImage imageNamed:@""];
            }else{
                [self presentViewController:_classInSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        default:
        {
            [self presentViewController:_classInSignInMessage animated:YES completion:nil];
        }
            break;
    }
}

#pragma mark - 上课签到成功打钩图片getter（）

- (UIImageView *)classInTick{
    if (!_classInTick) {
        _classInTick = [[UIImageView alloc]init];
        
//        _classInTick.layer.borderWidth = 1.0f;
//        _classInTick.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    return _classInTick;
}

#pragma mark - 上课按钮下横线

- (UIImageView *)classInLevel{
    if (!_classInLevel) {
        _classInLevel = [[UIImageView alloc]init];
//        _classInLevel.layer.borderWidth = 1.0f;
//        _classInLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classInLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _classInLevel;
}

#pragma mark - 下课按钮配置getter（）

- (UIButton *)classUpBtn{
    if(!_classUpBtn)
    {
        _classUpBtn = [[UIButton alloc] init];
        
//        _classUpBtn.layer.borderWidth = 1.0f;
//        _classUpBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _classUpBtn.titleLabel.numberOfLines = 0;
        _classUpBtn.titleLabel.font = [UIFont systemFontOfSize:45];
        [_classUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_classUpBtn setTitle:@"下课\n签到" forState:UIControlStateNormal];
        [_classUpBtn addTarget:self action:@selector(classUpBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _classUpBtn;
}

- (void)classUpBtnClick{
    _classUpSignInMessage = [UIAlertController alertControllerWithTitle:@"签到失败" message:@"下课时间未到\n现在不是签到时间" preferredStyle:UIAlertControllerStyleAlert];
    [_classUpSignInMessage addAction:_yesAction];
    [_classUpSignInMessage addAction:_noAction];
    
    NSDate *currentDate1 = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc]init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate1];
    
    _classUpHour = [currentComps hour];
    _classUpMinute = [currentComps minute];
   
    switch (_classUpHour) {
        case 8: /* 8:00~8:45 */
        {
            if (45 < _classUpMinute && _classInMinute <= 54) {
                if (45 <= (_classUpMinute - _classInMinute) || (_classUpMinute - _classInMinute) <= 54) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 9:/* 8:55~9:40 */
        {
            if (40 < _classUpMinute && _classUpMinute<= 59) {
                if (5 < (_classInMinute - _classUpMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 10: /* 10:10~10:55 */
        {
            if (45 <= (_classInMinute - _classUpMinute) && (_classInMinute - _classUpMinute) <= 55) {
                _classInTick.image = [UIImage imageNamed:@""];
                _classUpTick.image = [UIImage imageNamed:@"tick"];
            }else if (55 < _classUpMinute) {
                if (45 < (_classUpMinute - _classInMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 11:/* 11:05~11:50 可以设置自动下课签到 */
        {
            if (5 <= (_classInMinute - _classUpMinute) && (_classInMinute - _classUpMinute) <= 10) {
                _classInTick.image = [UIImage imageNamed:@""];
                _classUpTick.image = [UIImage imageNamed:@"tick"];
            }else if (50 < _classUpMinute) {
                if (45 < (_classUpMinute - _classInMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 14:/* 14:00~14:45 */
        {
            if (45 < _classUpMinute && _classUpMinute <= 54) {
                if (45 < (_classUpMinute - _classInMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 15:/* 14:55~15:40 */
        {
            if (40 < _classUpMinute && _classUpMinute<= 59) {
                if (5 < (_classInMinute - _classUpMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 16:/* 16:10~16:55 */
        {
            if (45 < (_classInMinute - _classUpMinute) && (_classInMinute - _classUpMinute) <= 55) {
                _classInTick.image = [UIImage imageNamed:@""];
                _classUpTick.image = [UIImage imageNamed:@"tick"];
            }else if (55 < _classUpMinute) {
                if (45 < (_classUpMinute - _classInMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 17:/* 17:05~17:50 */
        {
            if (5 <= (_classInMinute - _classUpMinute) || (_classInMinute - _classUpMinute) <= 10) {
                _classInTick.image = [UIImage imageNamed:@""];
                _classUpTick.image = [UIImage imageNamed:@"tick"];
            }else if (50 < _classUpMinute) {
                if (45 < (_classUpMinute - _classInMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 19:/* 18:30~19:15 */
        {
            if (15 < _classUpMinute && _classUpMinute <= 25) {
                if (45 <= (_classInMinute + _classUpMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 20:/* 19:25~20:10 */
        {
            if (10 < _classUpMinute && _classUpMinute <= 20) {
                if (35 <= (_classInMinute + _classUpMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        case 21:/* 20:20~21:05 */
        {
            if (5 < _classUpMinute && _classUpMinute <= 20) {
                if (25 <= (_classInMinute + _classUpMinute)) {
                    _classInTick.image = [UIImage imageNamed:@""];
                    _classUpTick.image = [UIImage imageNamed:@"tick"];
                }else{
                    [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
                }
            }else{
                [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
            }
        }
            break;
            
        default:
        {
            [self presentViewController:_classUpSignInMessage animated:YES completion:nil];
        }
            break;
    }
}

#pragma mark - 下课打钩图片getter（）

- (UIImageView *)classUpTick{
    if (!_classUpTick) {
        _classUpTick = [[UIImageView alloc]init];
        
//        _classUpTick.layer.borderWidth = 1.0f;
//        _classUpTick.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    return _classUpTick;
}

#pragma mark - 下课课按钮下横线

- (UIImageView *)classUpLevel{
    if (!_classUpLevel) {
        _classUpLevel = [[UIImageView alloc]init];
//        _classUpLevel.layer.borderWidth = 1.0f;
//        _classUpLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classUpLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _classUpLevel;
}

#pragma mark - 软件信息getter（）

- (UILabel *)softwareInfoLabel
{
    if(!_softwareInfoLabel)
    {
        _softwareInfoLabel = [[UILabel alloc]init];
        
//        _softwareInfoLabel.layer.borderWidth = 1.0f;
//        _softwareInfoLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _softwareInfoLabel.font = [UIFont systemFontOfSize:30];
        _softwareInfoLabel.textAlignment = NSTextAlignmentCenter;
        _softwareInfoLabel.textColor = [UIColor whiteColor];
        _softwareInfoLabel.text = @"我的学霸捐";
    }
    return _softwareInfoLabel;
}

#pragma mark - 设置按钮getter（）

- (UIButton *)settingBtn{
    if (!_settingBtn) {
        _settingBtn = [[UIButton alloc]init];
        
//        _settingBtn.layer.borderWidth = 1.0f;
//        _settingBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        _settingBtn.titleLabel.font = [UIFont systemFontOfSize:27.5];
        [_settingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_settingBtn setTitle:@"设置" forState:UIControlStateNormal];
        [_settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingBtn;
}

- (void)settingBtnClick{
    SettingViewController *setVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}

#pragma mark - 获取当前时间

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