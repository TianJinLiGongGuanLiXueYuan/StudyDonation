//
//  UpdateSchoolViewController.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/30.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "UpdateSchoolViewController.h"
#import "dropDownMenu.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width * 1 / 6
#define SCREEN_HEIGHT 64
#define MENU_HEIGHT 44

@interface UpdateSchoolViewController ()<dropDownMenuDelegate,dropDownMenuDataSource>
{
    long i;
}
//临时数据
@property (nonatomic,strong) NSArray *arr1;
@property (nonatomic,strong) NSArray *arr2;
@property (nonatomic,strong) NSArray *arr3;
@property (nonatomic,strong) NSArray *arr4;
@property (nonatomic,strong) NSArray *arr5;
@property (nonatomic,strong) NSArray *arr6;

//城市-学校菜单
@property (nonatomic, strong) dropDownMenu *city_school_Menu;

//学院-所在系菜单
@property (nonatomic, strong) dropDownMenu *college_department_Menu;

//年级-班级菜单
@property (nonatomic, strong) dropDownMenu *grade_class_Menu;

//背景图
@property (nonatomic,strong) UIImageView *chooseBackground;

@end

@implementation UpdateSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    i = 0;

    _arr1 = [[NSArray alloc] initWithObjects:
                            [NSArray arrayWithObjects:@"北京", @"清华大学", @"北京大学", @"中国人民大学", @"中国传媒大学", @"中央财经大学", @"北京外国语大学", @"北京邮电大学", @"北京电影学院", @"北京理工大学", nil],
                            [NSArray arrayWithObjects:@"天津", @"天津大学", @"南开大学", @"天津理工大学", @"天津师范大学", @"天津工业大学", @"天津科技大学", @"天津财经大学", @"天机医科大学", @"天津民航大学", nil],
                            [NSArray arrayWithObjects:@"上海", @"复旦大学", @"同济大学", @"上海交通大学", @"华东师范大学", @"上海大学", @"华东理工大学", @"上海财经大学", @"东华大学", @"上海海洋大学", nil],
                            [NSArray arrayWithObjects:@"福建", @"厦门大学", @"福州大学", @"集美大学", @"华侨大学", @"厦门理工学院", @"福建工程学院", @"福建师范大学", @"福建医科大学", @"福建农林大学",nil],
                            [NSArray arrayWithObjects:@"山东", @"山东大学", @"中国海洋大学", @"青岛大学", @"烟台大学", @"济南大学", @"青岛理工大学", @"中国石油大学", @"山东财经大学", @"山东科技大学",nil],
                            [NSArray arrayWithObjects:@"湖南", @"中南大学", @"湖南大学", @"长沙理工大学", @"湘潭大学", @"湖南农业大学", @"南华大学", @"湖南工业大学", @"湖南师范大学", @"湖南科技大学",nil],
                            [NSArray arrayWithObjects:@"河南", @"郑州大学", @"河南大学", @"河南理工大学", @"许昌学院", @"华北水利水电大学", @"安阳师范学院", @"新乡医学院", @"洛阳师范大学", @"河南科技大学",nil], nil];
    _arr3 = @[@"管理学院",@"自动化学院",@"计算机与通信工程学院",@"机械学院",@"外国语学院",@"海运学院",@"国际工商雪域",@"化学化工学院",@"法政学院",@"材料科学与工程学院"];
    _arr4 = @[@"北京大学",@"天津大学",@"上海大学",@"福州大学",@"重庆大学",@"山东大学",@"广东大学",@"湖南大学",@"河南大学",@"湖北大学"];
    _arr5 = @[@"北京",@"天津",@"上海",@"福建",@"重庆",@"山东",@"广东",@"湖南",@"河南",@"湖北"];
    _arr6 = @[@"北京大学",@"天津大学",@"上海大学",@"福州大学",@"重庆大学",@"山东大学",@"广东大学",@"湖南大学",@"河南大学",@"湖北大学"];
    
    [self.view addSubview:self.chooseBackground];

//    城市-学校菜单
    _city_school_Menu = [[dropDownMenu alloc] initWithOrigin:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT) andHeight:MENU_HEIGHT];
    _city_school_Menu.delegate = self;
    _city_school_Menu.dataSource = self;
    [self.view addSubview:_city_school_Menu];
    [_city_school_Menu selectDeafultIndexPath];
    
//    学院-所在系菜单
    _college_department_Menu = [[dropDownMenu alloc] initWithOrigin:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT + MENU_HEIGHT * 2) andHeight:MENU_HEIGHT];
    _college_department_Menu.delegate = self;
    _college_department_Menu.dataSource = self;
    [self.view addSubview:_college_department_Menu];
    [_college_department_Menu selectDeafultIndexPath];
    
//    年级-班级菜单
    _grade_class_Menu = [[dropDownMenu alloc] initWithOrigin:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT + MENU_HEIGHT * 4) andHeight:MENU_HEIGHT];
    _grade_class_Menu.delegate = self;
    _grade_class_Menu.dataSource = self;
    [self.view addSubview:_grade_class_Menu];
    [_grade_class_Menu selectDeafultIndexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    设置背景图位置
    self.chooseBackground.frame = [UIScreen mainScreen].bounds;
}

#pragma mark - 背景图getter（）

- (UIImageView *)chooseBackground{
    if (!_chooseBackground) {
        _chooseBackground = [[UIImageView alloc]init];
        _chooseBackground.image = [UIImage imageNamed:@"背景"];
    }
    return _chooseBackground;
}

- (NSInteger)numberOfColumnsInMenu:(dropDownMenu *)menu {
    return 2;
}

#pragma mark - 菜单getter（）

- (NSInteger)menu:(dropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    return self.arr1.count;
}

- (NSString *)menu:(dropDownMenu *)menu titleForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.column == 0) {
        return self.arr1[indexPath.row][0];
    }else {
        return self.arr1[0][indexPath.row];
    }
}

- (NSString *)menu:(dropDownMenu *)menu imageNameForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.column == 0 || indexPath.column == 1) {
        return @"baidu";
    }
    return nil;
}

- (void)menu:(dropDownMenu *)menu didSelectRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
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
