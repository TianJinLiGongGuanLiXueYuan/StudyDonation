//
//  dropDownMenu.m
//  StudyContribution
//
//  Created by Student02 on 16/8/1.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "dropDownMenu.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width * 4 / 5
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kTableViewCellHeight 44

#define kTextColor [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
#define kDetailTextColor [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1]
#define kSeparatorColor [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1]
#define kTextSelectColor [UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:1]


#define kTableViewHeight 300

typedef void(^complete)();

#pragma mark - LrdIndexPath
@implementation LrdIndexPath

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row {
    if (self = [super init]) {
        _column = column;
        _row = row;
        _item = -1;
    }
    return self;
}

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item {
    self = [self initWithColumn:column row:row];
    if (self) {
        _item = item;
    }
    return self;
}

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row {
    LrdIndexPath *path = [[self alloc] initWithColumn:column row:row];
    return path;
}

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item {
    return [[self alloc] initWithColumn:column row:row item:item];
}

@end

#pragma mark - LrdSuperMenu
@interface dropDownMenu () <UITableViewDataSource, UITableViewDelegate>
{
    struct {
        unsigned int numberOfRowsInColumn :1;
        unsigned int titleForRowsAtIndexPath :1;
        unsigned int imageNameForRowAtIndexPath :1;
        unsigned int detailTextForRowAtIndexPath :1;
    }_dataSourceFlag;
}

@property (nonatomic, assign) CGFloat tableViewHeight;
@property (nonatomic, assign) CGPoint origin;  //原点
@property (nonatomic, assign) CGFloat height;
//@property (nonatomic, assign) NSInteger numberOfColumn;  //列数
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UITableView *leftTableView;  //一级列表
@property (nonatomic, assign) NSInteger currentSelectedColumn;  //当前选中列

//layers array
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *indicators;
@property (nonatomic, copy) NSArray *bgLayers;

@end

@implementation dropDownMenu

//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height {
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, SCREEN_WIDTH, height)];
    if (self) {
        _origin = origin;
        _height = height;
        _isShow = NO;
        _fontSize = 14;
        _currentSelectedColumn = -1;
        _textColor = kTextColor;
        _selectedTextColor = kTextSelectColor;
        _detailTextFont = [UIFont systemFontOfSize:11];
        _separatorColor = kSeparatorColor;
        _detailTextColor = kDetailTextColor;
        _indicatorColor = kTextColor;
        _tableViewHeight = kTableViewHeight;
        
        //        初始化tableView
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x, origin.y + self.frame.size.height, SCREEN_WIDTH / 2, 0) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.rowHeight = kTableViewCellHeight;
        _leftTableView.separatorColor = kSeparatorColor;
        _leftTableView.backgroundColor = [UIColor clearColor];
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5.0f;
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapped:)];
        [self addGestureRecognizer:tap];
        
        _backGroundView = [[UIView alloc] init];
        _backGroundView.frame = CGRectMake(origin.x, origin.y, SCREEN_WIDTH, SCREEN_HEIGHT);
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.opaque = NO;
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapped:)];
        [_backGroundView addGestureRecognizer:backTap];
        
    }
    return self;
}

#pragma mark - 懒加载
- (UIColor *)indicatorColor {
    if (!_indicatorColor) {
        _indicatorColor = [UIColor blackColor];
    }
    return _indicatorColor;
}

- (UIColor *)textColor {
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *)separatorColor {
    if (!_separatorColor) {
        _separatorColor = [UIColor blackColor];
    }
    return _separatorColor;
}

#pragma mark - 设置dataSource
- (void)setDataSource:(id<dropDownMenuDataSource>)dataSource {
    if (_dataSource == dataSource) {
        return;
    }
    _dataSource = dataSource;
    if ([_dataSource respondsToSelector:@selector(numberOfColumnsInMenu:)]) {
        _numberOfColumn = [_dataSource numberOfColumnsInMenu:self];
    }else {
        _numberOfColumn = 1;
    }
    
    _currentSelectedRows = [[NSMutableArray alloc] initWithCapacity:_numberOfColumn];
    for (int i=0; i<_numberOfColumn; i++) {
        [_currentSelectedRows addObject:@(0)];
    }
    
    //    判断是否响应了某方法
    _dataSourceFlag.numberOfRowsInColumn = [_dataSource respondsToSelector:@selector(menu:numberOfRowsInColumn:)];
    _dataSourceFlag.titleForRowsAtIndexPath = [_dataSource respondsToSelector:@selector(menu:titleForRowAtIndexPath:)];
    _dataSourceFlag.imageNameForRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:imageNameForRowAtIndexPath:)];
    
    CGFloat numberOfLine = SCREEN_WIDTH / self.numberOfColumn;
    CGFloat numberOfBackground = SCREEN_WIDTH / self.numberOfColumn;
    CGFloat numberOfTextLayer = SCREEN_WIDTH / (self.numberOfColumn * 2);
    
    NSMutableArray *tempTitles = [[NSMutableArray alloc] initWithCapacity:_numberOfColumn];
    NSMutableArray *tempIndicators = [[NSMutableArray alloc] initWithCapacity:_numberOfColumn];
    NSMutableArray *tempBgLayers = [[NSMutableArray alloc] initWithCapacity:_numberOfColumn];
    
    
    //画出菜单
    for (int i = 0; i < _numberOfColumn; i++) {
        //backgrounLayer
        CGPoint positionForBackgroundLayer = CGPointMake((i + 0.5) * numberOfBackground, self.height / 2);
        CALayer *bgLayer = [self createBackgroundLayerWithPosition:positionForBackgroundLayer color:[UIColor whiteColor]];
        [self.layer addSublayer:bgLayer];
        [tempBgLayers addObject:bgLayer];
        
        //titleLayer
        NSString *titleString = nil;        
        titleString = [_dataSource menu:self titleForRowAtIndexPath:[LrdIndexPath indexPathWithColumn:i row:0]];
        CGPoint positionForTitle = CGPointMake(( i * 2 + 1) * numberOfTextLayer, self.height / 2);
        CATextLayer *textLayer;
              textLayer = [self createTitleLayerWithString:titleString position:positionForTitle color:self.textColor];
            self.mark++;
        [self.layer addSublayer:textLayer];
        [tempTitles addObject:textLayer];
        
        //indicatorLayer
        CGPoint indicatorPosition = CGPointMake((i + 1) * numberOfLine - 10, self.height / 2);
        CAShapeLayer *sharpLayer = [self createIndicatorWithPosition:indicatorPosition color:self.indicatorColor];
        [self.layer addSublayer:sharpLayer];
        [tempIndicators addObject:sharpLayer];
        
        //separatorLayer
        if (i != self.numberOfColumn - 1) {
            CGPoint separatorPosition = CGPointMake(ceilf((i + 1) * numberOfLine - 1), self.height / 2);
            CAShapeLayer *separatorLayer = [self createSeparatorWithPosition:separatorPosition color:self.separatorColor];
            [self.layer addSublayer:separatorLayer];
        }
    }
    _titles = [tempTitles copy];
    _indicators = [tempIndicators copy];
    _bgLayers = [tempBgLayers copy];
}

#pragma mark - 绘图
//背景
- (CALayer *)createBackgroundLayerWithPosition:(CGPoint)position color:(UIColor *)color {
    CALayer *layer = [CALayer layer];
    layer.position = position;
    layer.bounds = CGRectMake(0, 0, SCREEN_WIDTH / self.numberOfColumn, self.height - 1);
    layer.backgroundColor = [[UIColor clearColor]CGColor];
    return layer;
}

//标题


- (CATextLayer *)createTitleLayerWithString:(NSString *)string position:(CGPoint)position color:(UIColor *)color {
    CGSize size = [self calculateTitleSizeWithString:string];
    
    CATextLayer *layer = [CATextLayer new];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numberOfColumn) - 25) ? size.width : self.frame.size.width / _numberOfColumn - 25;
    layer.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    layer.string = string;
    layer.fontSize = _fontSize;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.truncationMode = kCATruncationEnd;
    layer.foregroundColor = color.CGColor;
    
    layer.contentsScale = [[UIScreen mainScreen] scale];
    
    layer.position = position;
    
    return layer;
}

//计算String的宽度
- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    //CGFloat fontSize = 14.0;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:_fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return CGSizeMake(ceilf(size.width)+2, size.height);
}

//指示器
- (CAShapeLayer *)createIndicatorWithPosition:(CGPoint)position color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(8, 0)];
    [path addLineToPoint:CGPointMake(4, 5)];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = 0.8;
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = position;
    
    return layer;
}

//分隔线
- (CAShapeLayer *)createSeparatorWithPosition:(CGPoint)position color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(160,0)];
    [path addLineToPoint:CGPointMake(160, 20)];
    
    layer.path = path.CGPath;
    layer.lineWidth = 1;
    layer.strokeColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = position;
    return layer;
}

#pragma mark - 动画
- (void)animateIndicator:(CAShapeLayer *)indicator reverse:(BOOL)reverse complete:(complete)complete {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = reverse ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    
    if (!anim.removedOnCompletion) {
        [indicator addAnimation:anim forKey:anim.keyPath];
    } else {
        [indicator addAnimation:anim forKey:anim.keyPath];
        [indicator setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    
    [CATransaction commit];
    if (reverse) {
        indicator.fillColor = self.selectedTextColor.CGColor;
    }else {
        indicator.fillColor = self.textColor.CGColor;
    }
    complete();
}

- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(complete)complete {
    if (show) {
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        }];
    }else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            if (finished) {
                [view removeFromSuperview];
            }
        }];
    }
    complete();
}

- (void)animateTableView:(UITableView *)tableview show:(BOOL)show complete:(complete)complete {
    if (show) {
        
        _leftTableView.frame = CGRectMake(self.origin.x, self.origin.y + self.height, SCREEN_WIDTH, 0);
        [self.superview addSubview:_leftTableView];

        [UIView animateWithDuration:0.2 animations:^{
            _leftTableView.frame = CGRectMake(self.origin.x, self.origin.y + self.height, SCREEN_WIDTH, kTableViewCellHeight * 4);
        }];
    }else {
        [UIView animateWithDuration:0.2 animations:^{
            _leftTableView.frame = CGRectMake(self.origin.x, self.origin.y + self.height, SCREEN_WIDTH, 0);
        } completion:^(BOOL finished) {
            [_leftTableView removeFromSuperview];
        }];
    }
    complete();
}

- (void)animateTitle:(CATextLayer *)title show:(BOOL)show complete:(complete)complete {
    CGSize size = [self calculateTitleSizeWithString:title.string];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numberOfColumn) - 25) ? size.width : self.frame.size.width / _numberOfColumn - 25;
    title.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    if (!show) {
        title.foregroundColor = _textColor.CGColor;
    } else {
        title.foregroundColor = _selectedTextColor.CGColor;
    }
    complete();
}

- (void)animateIndicator:(CAShapeLayer *)indicator background:(UIView *)background tableView:(UITableView *)tableView title:(CATextLayer *)title reverse:(BOOL)reverse complecte:(void(^)())complete {
    [self animateIndicator:indicator reverse:reverse complete:^{
        [self animateTitle:title show:reverse complete:^{
            [self animateBackGroundView:background show:reverse complete:^{
                [self animateTableView:tableView show:reverse complete:^{
                    
                }];
            }];
        }];
    }];
    complete();
}

#pragma mark - UITableView的dataSource和delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dataSourceFlag.numberOfRowsInColumn) {
        return [_dataSource menu:self numberOfRowsInColumn:_currentSelectedColumn];
    }else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = _textColor;
        cell.textLabel.highlightedTextColor = _selectedTextColor;
        cell.textLabel.font = [UIFont systemFontOfSize:_fontSize];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if (_dataSourceFlag.titleForRowsAtIndexPath) {
        cell.textLabel.text = [_dataSource menu:self titleForRowAtIndexPath:[LrdIndexPath indexPathWithColumn:_currentSelectedColumn row:indexPath.row]];
        if (_dataSourceFlag.imageNameForRowAtIndexPath) {
            NSString *imgName = [_dataSource menu:self imageNameForRowAtIndexPath:[LrdIndexPath indexPathWithColumn:_currentSelectedColumn row:indexPath.row]];
            if (imgName && imgName.length > 0) {
                cell.imageView.image = [UIImage imageNamed:imgName];
            }else {
                cell.imageView.image = nil;
            }
        }else {
            cell.imageView.image = nil;
        }
    }
    //设置accessory
    NSInteger currentSelectRow = [_currentSelectedRows[_currentSelectedColumn] integerValue];
    
    //NSLog(@"当前%ld栏中%ld列", _currentSelectedColumn, currentSelectRow);
    
    if (indexPath.row == currentSelectRow) {
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    
    cell.accessoryView = nil;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL haveItem = [self setMenuWithSelectedRow:indexPath.row];
    BOOL isClickHaveItemValid = self.isClickHaveItemValid ? YES :haveItem;
    if (isClickHaveItemValid && _delegate &&[_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
        [_delegate menu:self didSelectRowAtIndexPath:[LrdIndexPath indexPathWithColumn:_currentSelectedColumn row:indexPath.row]];
    }
}

#pragma mark 解决cell分割线左侧留空的问题
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 下面这几行代码是用来设置cell的上下行线的位置
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    //按照作者最后的意思还要加上下面这一段，才能做到底部线控制位置，所以这里按stackflow上的做法添加上吧。
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

#pragma mark - 方法实现
//默认选中的index
- (void)selectDeafultIndexPath {
    [self selectIndexPath:[LrdIndexPath indexPathWithColumn:0 row:0]];
}
//获取IndexPath所对应的字符串
- (NSString *)titleForRowAtIndexPath:(LrdIndexPath *)indexPath {
    return [self.dataSource menu:self titleForRowAtIndexPath:indexPath];
}
//菜单切换
- (void)selectIndexPath:(LrdIndexPath *)indexPath {
    if (!_delegate || !_dataSource || ![_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
        return;
    }
    
    if ([_dataSource numberOfColumnsInMenu:self] <= indexPath.column || [_dataSource menu:self numberOfRowsInColumn:indexPath.column] <= indexPath.row) {
        return;
    }
    
    CATextLayer *title = (CATextLayer *)_titles[indexPath.column];
    
    if (indexPath.item < 0 ) {
        title.string = [_dataSource menu:self titleForRowAtIndexPath:[LrdIndexPath indexPathWithColumn:indexPath.column row:indexPath.row]];
        [_delegate menu:self didSelectRowAtIndexPath:indexPath];
        
        if (_currentSelectedRows.count > indexPath.column) {
            _currentSelectedRows[indexPath.column] = @(indexPath.row);
        }
        
        CGSize size = [self calculateTitleSizeWithString:title.string];
        CGFloat sizeWidth = (size.width < (self.frame.size.width / _numberOfColumn) - 25) ? size.width : self.frame.size.width / _numberOfColumn - 25;
        title.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    }
}
//数据重载
- (void)reloadData {
    [self animateBackGroundView:_backGroundView show:NO complete:^{
        [self animateTableView:nil show:NO complete:^{
            _isShow = NO;
            id vc = self.dataSource;
            self.dataSource = nil;
            self.dataSource = vc;
        }];
    }];
}

- (void)menuTapped:(UITapGestureRecognizer *)gesture {
    if (_dataSource == nil) {
        return;
    }
    //触摸的地方的index
    CGPoint touchPoint = [gesture locationInView:self];
    NSInteger touchIndex = touchPoint.x / (SCREEN_WIDTH / self.numberOfColumn);
    
    //将当前点击的column之外的column给收回
    for (int i=0; i<_numberOfColumn; i++) {
        if (i != touchIndex) {
            [self animateIndicator:_indicators[i] reverse:NO complete:^{
                [self animateTitle:_titles[i] show:NO complete:^{
                    
                }];
            }];
        }
    }
    
    if (touchIndex == _currentSelectedColumn && _isShow) {
        //收回menu
        [self animateIndicator:_indicators[touchIndex] background:_backGroundView tableView:_leftTableView title:_titles[touchIndex] reverse:NO complecte:^{
            _currentSelectedColumn = touchIndex;
            _isShow = NO;
        }];
    }else {
        //弹出menu
        _currentSelectedColumn = touchIndex;
        [_leftTableView reloadData];
        
        [self animateIndicator:_indicators[touchIndex] background:_backGroundView tableView:_leftTableView title:_titles[touchIndex] reverse:YES complecte:^{
            _isShow = YES;
        }];
    }
    
}

- (void)backTapped:(UITapGestureRecognizer *)gesture {
    [self animateIndicator:_indicators[_currentSelectedColumn] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedColumn] reverse:NO complecte:^{
        _isShow = NO;
    }];
    
}

- (BOOL)setMenuWithSelectedRow:(NSInteger)row {
    _currentSelectedRows[_currentSelectedColumn] = @(row);
    
    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedColumn];
    title.string = [_dataSource menu:self titleForRowAtIndexPath:[LrdIndexPath indexPathWithColumn:_currentSelectedColumn row:row]];
    [self animateIndicator:_indicators[_currentSelectedColumn] background:_backGroundView tableView:_leftTableView title:title reverse:NO complecte:^{
        _isShow = NO;
    }];
    return YES;
}

- (void)setMenuWithSelectedItem:(NSInteger)item {
    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedColumn];
    [self animateIndicator:_indicators[_currentSelectedColumn] background:_backGroundView tableView:_leftTableView title:title reverse:NO complecte:^{
        _isShow = NO;
    }];
}
@end