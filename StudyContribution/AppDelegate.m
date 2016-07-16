//
//  AppDelegate.m
//  StudyContribution
//
//  Created by 刘芮东 on 16/7/12.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "AppDelegate.h"
#import "regeisterViewController.h"
#import "CustomNavigationController.h"
#import "ContributionDetailViewController.h"
#import "SettingViewController.h"

#import "LoginViewController.h"

//引入第三方短信验证文件
#import <SMS_SDK/SMSSDK.h>

//SMSSDK官网公共key
#define appkey @"f3fc6baa9ac4"
#define app_secrect @"7f3dedcb36d92deebcb373af921d635a"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //第三方短信平台添加，我也不知道是啥
    
    [SMSSDK registerApp:appkey withSecret:app_secrect];
    
    //重新写入口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //[self.window makeKeyAndVisible];
    //    regeisterViewController *regeisterVC=[[regeisterViewController alloc]init];
    //    CustomNavigationController *nav = [[CustomNavigationController alloc]initWithRootViewController:regeisterVC];
    //
    //    self.window.rootViewController = nav;
    //    [self.window makeKeyAndVisible];
    
    int i=1;
    
    regeisterViewController *regeisterVC=[[regeisterViewController alloc]init];
    regeisterVC.title = @"vc1";
    CustomNavigationController *nc1 = [[CustomNavigationController alloc] initWithRootViewController:regeisterVC];
    
    ContributionDetailViewController *vc2 = [[ContributionDetailViewController alloc] init];
    vc2.title = @"vc2";
    vc2.view.backgroundColor = [UIColor redColor];
    CustomNavigationController *nc2 = [[CustomNavigationController alloc] initWithRootViewController:vc2];
    
    
    SettingViewController *vc3 = [[SettingViewController alloc] init];
    vc3.title = @"vc3";
    vc3.view.backgroundColor = [UIColor purpleColor];
    CustomNavigationController *nc3 = [[CustomNavigationController alloc] initWithRootViewController:vc3];
    
    
    UITabBarController *tbc = [[UITabBarController alloc] init];
    
    NSArray *titleArr = @[@"首页",@"详情",@"设置"];
    //    NSArray *imgArr = @[@"home",@"hot",@"consulting"];
    for (int i = 0; i < titleArr.count; i ++) {
        UITabBarItem *item = tbc.tabBar.items[i];
        
        item.title = titleArr[i];
        
        //        UIImage *img = [UIImage imageNamed:imgArr[i]];
        //        item.image = [[img compressImageToSize:CGSizeMake(20, 20)]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        //
    }
    
    
    
    
    tbc.viewControllers = [NSArray arrayWithObjects:nc1, nc2, nc3, nil];
    
    LoginViewController *logIn=[[LoginViewController alloc]init];
    
    CustomNavigationController *nav=[[CustomNavigationController alloc]initWithRootViewController:logIn];
    
    if(i==1){
        self.window.rootViewController= nav;
    }else{
        self.window.rootViewController = tbc;
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
