//
//  personalInfoCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "personalInfoCell.h"

@implementation personalInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.schoolLabel];
        [self.contentView addSubview:self.upschoolLabel];
        [self.contentView addSubview:self.bottomLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _schoolLabel.frame = CGRectMake(5, 13, 133, 40);
    _upschoolLabel.frame = CGRectMake(142, 13, 220, 40);
    _bottomLevel.frame = CGRectMake(2, 52, 380, 4.4);
}

#pragma mark - 左边信息getter（）

- (UILabel *)schoolLabel{
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc]init];
        //        _schoolLabel.layer.borderWidth = 1.0f;
        //        _schoolLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        _schoolLabel.textColor = [UIColor whiteColor];
        _schoolLabel.font = [UIFont systemFontOfSize:26.5];
    }
    return _schoolLabel;
}

#pragma mark - 右边信息getter（）

- (UILabel *)upschoolLabel{
    if (!_upschoolLabel) {
        _upschoolLabel = [[UILabel alloc]init];
        //        _upschoolLabel.layer.borderWidth = 1.0f;
        //        _upschoolLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
        _upschoolLabel.textAlignment = NSTextAlignmentRight;
        _upschoolLabel.textColor = [UIColor whiteColor];
        _upschoolLabel.font = [UIFont systemFontOfSize:26.5];
    }
    return _upschoolLabel;
}

#pragma mark - 底边横线getter（）

- (UIImageView *)bottomLevel{
    if (!_bottomLevel) {
        _bottomLevel = [[UIImageView alloc]init];
//        _bottomLevel.layer.borderWidth = 1.0f;
//        _bottomLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _bottomLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _bottomLevel;
}

@end
