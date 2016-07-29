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
@property (strong, nonatomic) UILabel *label;

@end

@implementation timetable


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.background];
    [self.navitionBar.left_btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.navitionBar.left_btn addTarget:self action:@selector(left_btnclick) forControlEvents:UIControlEventTouchUpInside];
    NSArray *arr=[self classdata];
    NSLog(@"课程表");
    [self classtb:arr];
}
-(void)left_btnclick
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _background.image = [UIImage imageNamed:@"课程表"];
    }
    return _background;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UILabel *)makeLabel{
    UILabel *label=[[UILabel alloc]init];
    
    label.font = [UIFont systemFontOfSize:10];
    label.backgroundColor=[UIColor clearColor];
    label.layer.borderWidth=1;
    label.layer.borderColor=[[UIColor whiteColor]CGColor];
    label.layer.masksToBounds=YES;
    label.textColor=[UIColor whiteColor];
    label.numberOfLines=0;
    return label;
}


#pragma mark -  用二维数组生成课程

-(NSMutableArray *)classdata{
    
    //    NSArray *rowArr=[NSArray alloc]init;
    NSMutableArray *rowArr=[NSMutableArray array];
    for(int i=0;i<6;i++){
        NSMutableArray *lineArr=[NSMutableArray array];
        for(int j=0;j<8;j++){
            //            //            if i!==null,{
            //            //
            //            //            }
            //            //
            //            NSString *dataStr=@"体育\n下雨不上了";
            //
            //            [lineArr addObject:dataStr];
            //        }
            //        [rowArr addObject:lineArr];
            
            if (i == 0 && j == 0)
                
            {
                NSString * dataStr = @"    大物\n    一教101";
                [lineArr addObject : dataStr];
            }
            if (i == 2 && j == 0)
                
            {
                NSString * dataStr = @"    高数\n    四教304";
                [lineArr addObject : dataStr];
            }
            if (i == 3 && j == 5)
                
            {
                NSString * dataStr = @"    大物\n    一教101";
                [lineArr addObject : dataStr];
            }
            if (i == 4 && j == 2)
                
            {
                NSString * dataStr = @"    高数\n    四教304";
                [lineArr addObject : dataStr];
            }
            if (i == 0 && j == 5)
                
            {
                NSString * dataStr = @"    大英\n    四教201";
                [lineArr addObject : dataStr];
            }
            if (i == 5 && j == 1)
                
            {
                NSString * dataStr = @"    大英\n    四教201";
                [lineArr addObject : dataStr];
            }
            else
            {
                NSString * dataStr = @"";
                [lineArr addObject : dataStr];
            }}
        [rowArr addObject : lineArr];
    }
    return rowArr;
    
}

-(void)classtb:(NSArray *)arr{
    
    for(int i=0;i<6;i++){
        for(int j=0;j<8;j++){
            NSString *str=arr[i][j];
            if([str isEqualToString:@""]){
                
            }else{
                UILabel *label=[self makeLabel];
                label.text=arr[i][j];
                label.frame=CGRectMake(47+i*60, 127+j*55, 55, 50);
                [self.view addSubview:label];
            }
        }
        
    }
    
}

@end
