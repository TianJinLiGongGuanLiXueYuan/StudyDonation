//
//  timetable.m
//  StudyContribution
//
//  Created by Dark on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "timetable.h"
#import "ClassInfoViewController.h"

@interface timetable ()
@property (nonatomic,strong) UITextView *class1;
@property (nonatomic,strong) UITextView *class2;
@property (strong, nonatomic) UIImageView *timetable;
@property (strong, nonatomic) UIImageView *background;
//@property (strong, nonatomic) NSMutableArray
@end

@implementation timetable


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.background];
    [self.view addSubview:self.class1];
    [self.view addSubview:self.class2];
//    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
//    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
//  
    }
//-(void)left_btnclick
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

#pragma mark - 背景图
    
- (UIImageView *)background{
        if (!_background) {
            //        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            _background.image = [UIImage imageNamed:@"课程表"];
        }
        return _background;
      
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UITextView *)class1{
    if (!_class1) {
        _class1 = [[UITextView alloc]initWithFrame:CGRectMake(43, 199, 50, 83)];
        _class1.editable = NO;
        
        _class1.text = @"高等数学\n四教203 ";
        _class1.backgroundColor = UIColorFromRGB(0x99ccff);
        
        _class1.font = [UIFont systemFontOfSize:10];
        _class1.textColor=[UIColor whiteColor];
        
    }
    return _class1;
}

- (UITextView *)class2{
    if (!_class2) {
        _class2 = [[UITextView alloc]initWithFrame:CGRectMake(142, 199, 50, 83)];
        _class2.editable = NO;
        
        _class2.text = @"软件工程导论 \n四教203 ";
        _class2.backgroundColor = UIColorFromRGB(0xA78ED4);
        _class2.textColor=[UIColor whiteColor];
        _class2.font = [UIFont systemFontOfSize:10];
        
    }
    return _class2;
}
#pragma mark - 二维数组
//NSMutableArray  *muarray=[[NSMutableArray alloc]init];
//for(int i = 0;i<=10;i++){
//    [muarray addObject:"@1","@2","3"]
//    
//- (UIImageView *)timetable{
//    if (!_timetable) {
//        _timetable = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
//        _timetable.image = [UIImage imageNamed:@"课程表"];
//    }
//    return _timetable;
//}
@end
