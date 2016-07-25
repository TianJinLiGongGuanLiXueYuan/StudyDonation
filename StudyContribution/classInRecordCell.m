//
//  classInRecordCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "classInRecordCell.h"

@implementation classInRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.classInDateLabel];
        [self.contentView addSubview:self.classInDetailLabel];
        [self.contentView addSubview:self.tickImage];
        [self.contentView addSubview:self.classInRecordLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _classInDateLabel.frame = CGRectMake(12, 10, 110, 50);
    _classInDetailLabel.frame = CGRectMake(152, 10, 110, 50);
    _tickImage.frame = CGRectMake(302, 12 , 40, 40);
    _classInRecordLevel.frame = CGRectMake(12, 52, 340, 4.4);
}

#pragma mark - 上课签到时间label

- (UILabel *)classInDateLabel{
    if (!_classInDateLabel) {
        _classInDateLabel = [[UILabel alloc]init];
//        _classInDateLabel.layer.borderWidth = 1.0f;
//        _classInDateLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classInDateLabel.textAlignment = NSTextAlignmentCenter;
        _classInDateLabel.font = [UIFont systemFontOfSize:26];
        _classInDateLabel.textColor = [UIColor whiteColor];
    }
    return _classInDateLabel;
}

#pragma mark - 次数label

- (UILabel *)classInDetailLabel{
    if (!_classInDetailLabel) {
        _classInDetailLabel = [[UILabel alloc]init];
//        _classInDetailLabel.layer.borderWidth = 1.0f;
//        _classInDetailLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classInDetailLabel.textAlignment = NSTextAlignmentCenter;
        _classInDetailLabel.font = [UIFont systemFontOfSize:26];
        _classInDetailLabel.textColor = [UIColor whiteColor];
    }
    return _classInDetailLabel;
}

#pragma mark - 打钩图片

- (UIImageView *)tickImage{
    if (!_tickImage) {
        _tickImage = [[UIImageView alloc]init];
//        _tickImage.layer.borderWidth = 1.0f;
//        _tickImage.layer.borderColor = [[UIColor blackColor]CGColor];
    }
    return _tickImage;
}

#pragma mark - 横线图片

- (UIImageView *)classInRecordLevel{
    if (!_classInRecordLevel) {
        _classInRecordLevel = [[UIImageView alloc]init];
//        _classInRecordLevel.layer.borderWidth = 1.0f;
//        _classInRecordLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _classInRecordLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _classInRecordLevel;
}
@end
