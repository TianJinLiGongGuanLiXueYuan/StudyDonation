//
//  ClassInfoViewController.m
//  StudyContribution
//
//  Created by Surprised on 16/7/14.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ClassInfoViewController.h"
#import "regeisterViewController.h"

#define ReturnButton_X 15
#define ReturnButton_Y 20
#define ReturnButton_WIDTH 20
#define ReturnButton_HEIGHT 30

@interface ClassInfoViewController ()
@property (strong, nonatomic) UIImageView *timetable;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIImageView *scheduleImageView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *label1;
@property (nonatomic, strong) UIButton *returnBtn;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ClassInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.background];
    [self.view addSubview:self.returnBtn];
    NSArray *arr=[self classdata];
    NSLog(@"课程表");
    
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(200, 590, 333, 44)];
    label1.text = @"高数  四教304";
    label1.font = [UIFont systemFontOfSize:22];
    label1.textColor = [UIColor whiteColor];
    label1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label1];
#pragma mark - scroll view
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(45, 127, 340, 437)];

    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor clearColor];
    [_scrollView setShowsVerticalScrollIndicator:NO];//关闭ScrollView的上下滚动条
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image =[UIImage imageNamed:@"纯色课程表.png"];

    imageView.frame =CGRectMake(0,0, 320, 400);
    [_scrollView addSubview:imageView];
//    _scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"纯色课程表.png"]];
//    UIImage *image = [UIImage imageNamed:@"纯色课程表.png"];
//    _scrollView.layer.contents = (id) image.CGImage;
//    _scrollView.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    [self classtb:arr];
}

#pragma mark - 返回
-(UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(ReturnButton_X, ReturnButton_Y,
                                                               ReturnButton_WIDTH, ReturnButton_HEIGHT)];
    }
    [_returnBtn setImage:[UIImage imageNamed:@"returnPictrue"] forState:UIControlStateNormal];
   
      _returnBtn.backgroundColor = [UIColor clearColor];
      [_returnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
        return _returnBtn;
}
    
 - (void)returnBtnClick{
     [self.navigationController popViewControllerAnimated:YES];
    }

#pragma mark - 背景图

- (UIImageView *)background{
    if (!_background) {
        _background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _background.image = [UIImage imageNamed:@"background"];
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
    label.textAlignment=NSTextAlignmentCenter;
    return label;
}


#pragma mark -  用if语句生成课程

-(NSMutableArray *)classdata{
    
    //    NSArray *rowArr=[NSArray alloc]init;
    NSMutableArray *rowArr=[NSMutableArray array];
    for(int i=0;i<6;i++){
        NSMutableArray *lineArr=[NSMutableArray array];
        for(int j=0;j<4;j++){
            //            if i!==null,{
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
                NSString * dataStr = @"00";
                [lineArr addObject : dataStr];
            }
            if (i == 1 && j == 0)
            {
                NSString * dataStr = @"10";
                [lineArr addObject : dataStr];
            }
            if (i == 2 && j == 2)
            {
                NSString * dataStr = @"22";
                [lineArr addObject : dataStr];
            }
            if (i == 4 && j == 2)
            {
                NSString * dataStr = @"高数\n四教304";
                [lineArr addObject : dataStr];
            }
            if (i == 0 && j == 1)
            {
                NSString * dataStr = @"大英\n四教201";
                [lineArr addObject : dataStr];
            }
            if (i == 2 && j == 1)
            {
                NSString * dataStr = @"大英\n四教201";
                [lineArr addObject : dataStr];
            }
            else
            {
                NSString * dataStr = @"";
                [lineArr addObject : dataStr];
            }
        }
        [rowArr addObject : lineArr];
    }
    return rowArr;
    
}

-(void)classtb:(NSArray *)arr{
    
    for(int i=0;i<6;i++){
        for(int j=0;j<4;j++){
            NSString *str=arr[i][j];
            if([str isEqualToString:@""]){
                
            }else{
                UILabel *label=[self makeLabel];
                label.text=arr[i][j];
                label.frame=CGRectMake(30+i*45, 40+j*63, 40, 60);
                [_scrollView addSubview:label];
                 _scrollView.contentSize = CGSizeMake(0,500);
            }
        }
        
    }
    
}

@end
