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
@property (strong, nonatomic) UIImageView *timetable;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIImageView *scheduleImageView;

@end

@implementation timetable


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.background];
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    NSArray *arr=[self aaadata];
    NSLog(@"aa");
    [self classqqq:arr];
    }
-(void)left_btnclick
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 背景图
    
    - (UIImageView *)background{
        if (!_background) {
            //        _background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
            _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
            _background.image = [UIImage imageNamed:@" 课程表"];
        }
        return _background;
      
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UITextView *)makeTextView{
    UITextView *textView=[[UITextView alloc]init];
            textView.editable = NO;
            textView.font = [UIFont systemFontOfSize:10];
            textView.backgroundColor=[UIColor clearColor];
            textView.layer.borderWidth=1;
            textView.layer.borderColor=[[UIColor whiteColor]CGColor];
            textView.layer.masksToBounds=YES;
            textView.textColor=[UIColor whiteColor];
    return textView;
}


#pragma mark -  用二维数组生成课程

-(NSMutableArray *)aaadata{

//    NSArray *rowArr=[NSArray alloc]init;
    NSMutableArray *rowArr=[NSMutableArray array];
    for(int i=0;i<6;i++){
        NSMutableArray *lineArr=[NSMutableArray array];
        for(int j=0;j<8;j++){
            
            NSString *dataStr=@"体育\n 下雨不上了";
            
            [lineArr addObject:dataStr];
        }
        [rowArr addObject:lineArr];
    }
    
    return rowArr;

}

-(void)classqqq:(NSArray *)arr{
    
    for(int i=0;i<6;i++){
        for(int j=0;j<8;j++){
            NSString *str=arr[i][j];
            if([str isEqualToString:@""]){
            
            }else{
                UITextView *textView=[self makeTextView];
                textView.text=arr[i][j];
                textView.frame=CGRectMake(42+i*60, 127+j*55, 55, 50);
                [self.view addSubview:textView];
            }
        }
        
    }
    
}

@end
