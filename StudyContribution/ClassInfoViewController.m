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
@property (nonatomic,strong) UIButton *label1;
@property (nonatomic,strong) UITextView *textVc;
@property (nonatomic,strong) UITextView *textVc1;

@end
@implementation ClassInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width,  35)];
    
    label.text =@"近期课程及详情";
   
    label.backgroundColor = UIColorFromRGB(0x99ccff);
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 290, self.view.bounds.size.width, 35)];
    label1.text =@"下次课程时间及地点";
    label.backgroundColor = UIColorFromRGB(0x99ccff);
    [self.view addSubview:label1];
    [self.view addSubview:label];
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.textVc];
    [self.view addSubview:self.textVc1];
   
}

- (void) viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (UITextView *)textVc{
    if (!_textVc) {
        _textVc = [[UITextView alloc]initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 200)];
        _textVc.editable = NO;
        
        _textVc.text = @"大英4 四教203 30分钟前\n大物 一教211 2小时前\n软件工程概率 一教309 1天前\n高等数学 一教101 一天前\n";
       
        _textVc.font = [UIFont systemFontOfSize:18];
        
}
    return _textVc;
}
-(UITextView *)textVc1{
        if (!_textVc1) {
            _textVc1 = [[UITextView alloc]initWithFrame:CGRectMake(0, 325, self.view.bounds.size.width,200)];
            _textVc1.editable = NO;
        
            _textVc1.text = @"线性代数 四教303 50分钟后\n高等数学 一教211 5小时前\n软件工程概率 一教309 1天后\n体育 操场 一天后\n";
            _textVc1.font = [UIFont systemFontOfSize:18];
            

        }
        return _textVc1;

    //label.lineBreakMode = UILineBreakModeWordWrap;
    //_label.numberOfLines = 0;
    
    
    

    
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
