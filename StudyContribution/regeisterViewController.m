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


@interface regeisterViewController ()
@property (nonatomic,strong) UIButton *tolotin;
@end

@implementation regeisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tolotin];
    
    
 
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
    self.tolotin.frame = CGRectMake(100, 100, 100, 100);
}

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

-(void)leftbtnClick{
    NSLog(@"aa");
}


@end
