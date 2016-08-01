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
        [self.contentView addSubview:self.schoolText];
        [self.contentView addSubview:self.bottomLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _schoolLabel.frame = CGRectMake(15, 13, 133, 40);
    _schoolText.frame = CGRectMake(155, 13, 220, 40);
    _bottomLevel.frame = CGRectMake(10, 52, 390, 4.4);
}

#pragma mark - 左边信息getter（）

- (UILabel *)schoolLabel{
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc]init];
//        _schoolLabel.layer.borderWidth = 1.0f;
//        _schoolLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _schoolLabel.textColor = [UIColor whiteColor];
        _schoolLabel.font = [UIFont systemFontOfSize:26.5];
    }
    return _schoolLabel;
}

#pragma mark - 右边信息getter（）

- (UITextField *)schoolText{
    if (!_schoolText) {
        _schoolText = [[UITextField alloc]init];
//        _schoolText.layer.borderWidth = 1.0f;
//        _schoolText.layer.borderColor = [[UIColor blackColor]CGColor];
        _schoolText.userInteractionEnabled = NO;
        _schoolText.textAlignment = NSTextAlignmentRight;
        _schoolText.textColor = [UIColor whiteColor];
        _schoolText.font = [UIFont systemFontOfSize:26.5];
    }
    return _schoolText;
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
