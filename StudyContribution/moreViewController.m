//
//  moreViewController.m
//  Students
//
//  Created by 王俊钢 on 16/7/12.
//  Copyright © 2016年 wangjungang. All rights reserved.
//

#import "moreViewController.h"
#import "anymoreViewController.h"
#import "logup.h"
#import "LogupViewController.h"

@interface moreViewController ()
@property (nonatomic,strong) logup *moreV;
@property(nonatomic,strong)LogupViewController *lvc;
@property (nonatomic,strong) UIButton *nextbtn;
@end

@implementation moreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lvc = [[LogupViewController alloc]init];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置页面标题
    self.navitionBar.title_label.text = @"基本信息";
    
    //设置导航栏左边的按钮
    [self.navitionBar.left_btn setTitle:@"上一步" forState:UIControlStateNormal];
    [self.navitionBar.left_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //加载view
    _moreV = [[logup alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _moreV.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //设置按钮的事件
    [_moreV.nextbtn addTarget:self action:@selector(nextbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_moreV];
    
    
    _nextbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    _nextbtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_nextbtn];
    [_nextbtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)click
{
    anymoreViewController *anymoreVC = [[anymoreViewController alloc] init];
    [self.navigationController pushViewController:anymoreVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
#pragma mark - 单击事件

//下一步 按钮单击事件
-(void)nextbtnclick
{
    [[BaseInfoSave sharedInstance] saveOneInfoWithUniversity:_moreV.universityTextF.text School:_moreV.schoolTextF.text Class:_moreV.classTextF.text StuNum:_moreV.stuNumTextF.text];
    anymoreViewController *anymoreVC = [[anymoreViewController alloc] init];
    [self.navigationController pushViewController:anymoreVC animated:YES];
}
- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}


//导航栏左按钮事件
-(void)leftbtnClick
{
    //[super leftbtnClick];
    [self.navigationController popViewControllerAnimated:YES];
    // NSLog(@"dsafsd");
}
@end
