//
//  contributionRecordCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "contributionRecordCell.h"

@implementation contributionRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.contributionRecordnDateLabel];
        [self.contentView addSubview:self.contributionRecordLabel];
        [self.contentView addSubview:self.contributionRecordMoney];
        [self.contentView addSubview:self.contributionRecordLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _contributionRecordnDateLabel.frame = CGRectMake(0, 10, 110, 50);
    _contributionRecordLabel.frame = CGRectMake(130, 10, 110, 50);
    _contributionRecordMoney.frame = CGRectMake(245, 10 , 110, 50);
    _contributionRecordLevel.frame = CGRectMake(0, 52, 340, 4.4);
}

#pragma mark - 捐赠时间label

- (UILabel *)contributionRecordnDateLabel{
    if (!_contributionRecordnDateLabel) {
        _contributionRecordnDateLabel = [[UILabel alloc]init];
//        _contributionRecordnDateLabel.layer.borderWidth = 1.0f;
//        _contributionRecordnDateLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionRecordnDateLabel.textAlignment = NSTextAlignmentCenter;
        _contributionRecordnDateLabel.font = [UIFont systemFontOfSize:26];
        _contributionRecordnDateLabel.textColor = [UIColor whiteColor];
    }
    return _contributionRecordnDateLabel;
}

#pragma mark - 次数label

- (UILabel *)contributionRecordLabel{
    if (!_contributionRecordLabel) {
        _contributionRecordLabel = [[UILabel alloc]init];
//        _contributionRecordLabel.layer.borderWidth = 1.0f;
//        _contributionRecordLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionRecordLabel.textAlignment = NSTextAlignmentCenter;
        _contributionRecordLabel.font = [UIFont systemFontOfSize:26];
        _contributionRecordLabel.textColor = [UIColor whiteColor];
    }
    return _contributionRecordLabel;
}

#pragma mark - 捐赠金钱

- (UILabel *)contributionRecordMoney{
    if (!_contributionRecordMoney) {
        _contributionRecordMoney = [[UILabel alloc]init];
//        _contributionRecordMoney.layer.borderWidth = 1.0f;
//        _contributionRecordMoney.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionRecordMoney.textAlignment = NSTextAlignmentCenter;
        _contributionRecordMoney.font = [UIFont systemFontOfSize:26];
        _contributionRecordMoney.textColor = [UIColor whiteColor];
    }
    return _contributionRecordMoney;
}

#pragma mark - 横线图片

- (UIImageView *)contributionRecordLevel{
    if (!_contributionRecordLevel) {
        _contributionRecordLevel = [[UIImageView alloc]init];
//        _contributionRecordLevel.layer.borderWidth = 1.0f;
//        _contributionRecordLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionRecordLevel.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _contributionRecordLevel;
}
@end
