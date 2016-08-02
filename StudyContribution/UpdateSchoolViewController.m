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
    BOOL isequal;
    long i;
}
//临时数据
@property (nonatomic,strong) NSMutableArray *arr1;
@property (nonatomic,strong) NSMutableArray *arr2;
@property (nonatomic,strong) NSMutableArray *arr3;

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
    
//    判断变量
    i = 0;
    isequal = NO;

//    临时数据
    _arr1 = [[NSMutableArray alloc] initWithObjects:
                                    [NSArray arrayWithObjects:@"北京", @"清华大学", @"北京大学", @"中国人民大学", @"中国传媒大学", @"中央财经大学", @"北京外国语大学", @"北京邮电大学", @"北京电影学院", @"北京理工大学", nil],
                                    [NSArray arrayWithObjects:@"天津", @"天津大学", @"南开大学", @"天津理工大学", @"天津师范大学", @"天津工业大学", @"天津科技大学", @"天津财经大学", @"天机医科大学", @"天津民航大学", nil],
                                    [NSArray arrayWithObjects:@"上海", @"复旦大学", @"同济大学", @"上海交通大学", @"华东师范大学", @"上海大学", @"华东理工大学", @"上海财经大学", @"东华大学", @"上海海洋大学", nil],
                                    [NSArray arrayWithObjects:@"福建", @"厦门大学", @"福州大学", @"集美大学", @"华侨大学", @"厦门理工学院", @"福建工程学院", @"福建师范大学", @"福建医科大学", @"福建农林大学",nil],
                                    [NSArray arrayWithObjects:@"山东", @"山东大学", @"中国海洋大学", @"青岛大学", @"烟台大学", @"济南大学", @"青岛理工大学", @"中国石油大学", @"山东财经大学", @"山东科技大学",nil],
                                    [NSArray arrayWithObjects:@"湖南", @"中南大学", @"湖南大学", @"长沙理工大学", @"湘潭大学", @"湖南农业大学", @"南华大学", @"湖南工业大学", @"湖南师范大学", @"湖南科技大学",nil],
                                    [NSArray arrayWithObjects:@"河南", @"郑州大学", @"河南大学", @"河南理工大学", @"许昌学院", @"华北水利水电大学", @"安阳师范学院", @"新乡医学院", @"洛阳师范大学", @"河南科技大学",nil], nil];
    
    _arr2 = [[NSMutableArray alloc] initWithObjects:
                                    [NSArray arrayWithObjects:@"数学科学院", @"数学系", @"数学建模系", @"线代系", @"高数系", @"微分系", @"几何系", @"函数系", nil],
                                    [NSArray arrayWithObjects:@"物理学院", @"物理系", @"天文学", @"电磁系", @"光学系", @"粒子物理原理系", @"原子核物理系", @"天体物理系", @"核物理及应用系", nil],
                                    [NSArray arrayWithObjects:@"信息科学技术学院", @"计算机系", @"通信工程系", @"微电子学系", @"量子电子学研究所", @"物理电子学研究所", @"光子与通信技术研究所", @"电子工程研究所", @"计算机系统结构研究所", nil],
                                    [NSArray arrayWithObjects:@"生命科学学院", @"细胞生物系", @"遗传系", @"生物化学系", @"分子生物系", @"现代生物技术系", @"植物生物系", @"动物生物系", @"微生物系", @"生理系",nil],
                                    [NSArray arrayWithObjects:@"环境学院", @"人文地理学", @"自然地理学", @"历史地理学", @"景观设计学", @"环境科学专业", @"环境工程专业", @"生态学", @"城市与区域规划", nil],
                                    [NSArray arrayWithObjects:@"新材料学院", @"新能源材料系", @"电子信息材料系", @"生物医学材料系", @"纳米系", @"低维与界面材料系", @"材料工程系",nil],
                                    [NSArray arrayWithObjects:@"经济学院", @"政治经济系", @"西方经济系", @"金融系", @"经济史系", @"经济思想史系", @"世界经济系", @"财政学系", @"人口资源与环境经济系",nil], nil];
    _arr3 = [[NSMutableArray alloc] initWithObjects:
             [NSArray arrayWithObjects:@"大一", @"数学1班", @"数学2班", @"数学建模1班", @"数学建模2班", @"线代1班", @"线代2班", @"高数1班", @"高数2班", @"微分1班", @"微分2班", @"几何1班", @"几何2班", @"函数1班", @"函数2班", nil],
             [NSArray arrayWithObjects:@"大二", @"数学1班", @"数学2班", @"数学建模1班", @"数学建模2班", @"线代1班", @"线代2班", @"高数1班", @"高数2班", @"微分1班", @"微分2班", @"几何1班", @"几何2班", @"函数1班", @"函数2班", nil],
             [NSArray arrayWithObjects:@"大三", @"数学1班", @"数学2班", @"数学建模1班", @"数学建模2班", @"线代1班", @"线代2班", @"高数1班", @"高数2班", @"微分1班", @"微分2班", @"几何1班", @"几何2班", @"函数1班", @"函数2班", nil],
             [NSArray arrayWithObjects:@"大四", @"数学1班", @"数学2班", @"数学建模1班", @"数学建模2班", @"线代1班", @"线代2班", @"高数1班", @"高数2班", @"微分1班", @"微分2班", @"几何1班", @"几何2班", @"函数1班", @"函数2班", nil],nil];
    
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
    _college_department_Menu.hidden = YES;
    
//    年级-班级菜单
    _grade_class_Menu = [[dropDownMenu alloc] initWithOrigin:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT + MENU_HEIGHT * 4) andHeight:MENU_HEIGHT];
    _grade_class_Menu.delegate = self;
    _grade_class_Menu.dataSource = self;
    [self.view addSubview:_grade_class_Menu];
    [_grade_class_Menu selectDeafultIndexPath];
    _grade_class_Menu.hidden = YES;
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

//下拉菜单的行数
- (NSInteger)menu:(dropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if ([menu isEqual:_city_school_Menu]) {
        if (column == 0) {
            return self.arr1.count;
        }
        return [self computeNSArray:_arr1 rowNSInteger:i];
    }else if([menu isEqual:_college_department_Menu]){
        if (column == 0) {
            return self.arr2.count;
        }
        return [self computeNSArray:_arr2 rowNSInteger:i];
    }
    if (column == 0) {
        return self.arr3.count;
    }
    return [self computeNSArray:_arr3 rowNSInteger:i];
}

//下拉菜单每行的内容
- (NSString *)menu:(dropDownMenu *)menu titleForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if ([menu isEqual:_city_school_Menu]) {
        if (indexPath.column == 0) {
            return self.arr1[indexPath.row][0];
        }
        return self.arr1[i][indexPath.row + 1];
    }else if([menu isEqual:_college_department_Menu]){
        if (indexPath.column == 0) {
            return self.arr2[indexPath.row][0];
        }
        return self.arr2[i][indexPath.row + 1];
    }
    if (indexPath.column == 0) {
        return self.arr3[indexPath.row][0];
    }
    return self.arr3[i][indexPath.row + 1];
}

//点击事件
- (void)menu:(dropDownMenu *)menu didSelectRowAtIndexPath:(LrdIndexPath *)indexPath {

    if (indexPath.column == 0) {
        i = indexPath.row;
    }
    
    if ([menu isEqual:_city_school_Menu]) {
        if (indexPath.column == 1) {
            _college_department_Menu.hidden = NO;
        }
    }else if([menu isEqual:_college_department_Menu]){
        if (indexPath.column == 1) {
            _grade_class_Menu.hidden = NO;
        }
    }
}

#pragma mark - 计算二维数组有某行有几个元素

- (NSInteger)computeNSArray:(NSMutableArray *)array rowNSInteger:(long)j{
    int count = -1;
    for (NSString *key in array[j]) {
        if (key == nil) {
            break;
        }
        count ++;
    }
    return count;
}

@end
