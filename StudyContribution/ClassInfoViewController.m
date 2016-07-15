//
//  ClassInfoViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/14.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ClassInfoViewController.h"

@interface ClassInfoViewController ()
@property (nonatomic,strong) UIButton *label;
@property (nonatomic,strong) UIButton *lb;
@property (nonatomic,strong) UIButton *lb1;
@property (nonatomic,strong) UIButton *label1;

@end


@implementation ClassInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 300, 50)];
    label.text =@"近期课程及详情";
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 300, 100)];
    label1.text =@"下次课程时间及地点";
    NSString *str = @"大英4 四教203 30分钟前\n大物 一教211 2小时前\n软件工程概率 一教309 1天前\n高等数学 一教101 一天前\n";
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(50,90,300,100)];
    lb.numberOfLines = 0; // 最关键的一句
    lb.text = str;
    lb.font = [UIFont systemFontOfSize:14];
    NSString *str1 = @"线性代数 四教303 50分钟后\n高等数学 一教211 5小时前\n软件工程概率 一教309 1天后\n体育 操场 一天后\n";
    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(50,340,300,200)];
    lb1.numberOfLines = 0; // 最关键的一句
    lb1.text = str1;
    lb1.font = [UIFont systemFontOfSize:14];
    lb1.backgroundColor = [UIColor orangeColor];
    label1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lb];
    [self.view addSubview:lb1];
    [self.view addSubview:label1];
    [self.view addSubview:label];
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    

    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    
    
    
}
-(void)left_btnclick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    // Dispose of any resources that can be recreated.
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
