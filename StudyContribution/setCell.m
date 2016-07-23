//
//  setCell.m
//  StudyContribution
//
//  Created by 陈艺辉 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "setCell.h"

@implementation setCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.setInfo];
        [self.contentView addSubview:self.setInfoLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _setInfo.frame = CGRectMake(28, 13, 400, 40);
    _setInfoLevel.frame = CGRectMake(20, 58, 372, 4.4);
}

//设置信息getter（）
- (UILabel *)setInfo{
    if (!_setInfo) {
        _setInfo = [[UILabel alloc]init];
//        _setInfo.layer.borderWidth = 1.0f;
//        _setInfo.layer.borderColor = [[UIColor whiteColor]CGColor];
        _setInfo.textColor = [UIColor whiteColor];
        _setInfo.font = [UIFont systemFontOfSize:26.5];
    }
    return _setInfo;
}

//底边横线
- (UIImageView *)setInfoLevel{
    if (!_setInfoLevel) {
        _setInfoLevel = [[UIImageView alloc]init];
//        _setInfoLevel.layer.borderWidth = 1.0f;
//        _setInfoLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _setInfoLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _setInfoLevel;
}
@end
