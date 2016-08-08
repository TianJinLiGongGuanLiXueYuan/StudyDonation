//
//  dropDownMenu.h
//  StudyContribution
//
//  Created by Student02 on 16/8/1.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LrdIndexPath : NSObject

@property (nonatomic, assign) NSInteger row; //行
@property (nonatomic, assign) NSInteger column; //列
@property (nonatomic, assign) NSInteger item; //item


- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row;

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row;
+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item;

@end

#pragma  mark - datasource
@class dropDownMenu;
@protocol dropDownMenuDataSource <NSObject>

@required
//每个column有多少行
- (NSInteger)menu:(dropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column;
//每个column中每行的title
- (NSString *)menu:(dropDownMenu *)menu titleForRowAtIndexPath:(LrdIndexPath *)indexPath;

@optional
//有多少个column，默认为1列
- (NSInteger)numberOfColumnsInMenu:(dropDownMenu *)menu;
//第column列，没行的image
- (NSString *)menu:(dropDownMenu *)menu imageNameForRowAtIndexPath:(LrdIndexPath *)indexPath;
@end

#pragma mark - delegate
@protocol dropDownMenuDelegate <NSObject>

@optional
//点击
- (void)menu:(dropDownMenu *)menu didSelectRowAtIndexPath:(LrdIndexPath *)indexPath;

@end

@interface dropDownMenu : UIView

@property (nonatomic, weak) id<dropDownMenuDelegate> delegate;
@property (nonatomic, weak) id<dropDownMenuDataSource> dataSource;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIFont *detailTextFont;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) NSInteger fontSize;
@property (nonatomic, assign) NSInteger numberOfColumn;  //列数
//当前选中的列
@property (nonatomic, strong) NSMutableArray *currentSelectedRows;
//当有二级列表的时候，是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveItemValid;

@property (nonatomic, assign) NSInteger mark;

//获取title
- (NSString *)titleForRowAtIndexPath:(LrdIndexPath *)indexPath;
//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
//菜单切换，选中的indexPath
- (void)selectIndexPath:(LrdIndexPath *)indexPath;
//默认选中
- (void)selectDeafultIndexPath;
//数据重载
- (void)reloadData;
@end
