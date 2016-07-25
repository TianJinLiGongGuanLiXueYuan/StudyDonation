//
//  contributionBtnCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "contributionBtnCell.h"

@implementation contributionBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.contributionInfo];
        [self.contentView addSubview:self.moneyImage];
        [self.contentView addSubview:self.moneyCount];
        [self.contentView addSubview:self.confirmContributionBtn];
        [self.contentView addSubview:self.selectAllBtn];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _contributionInfo.frame = CGRectMake(10, 20, 200, 50);
    _moneyImage.frame = CGRectMake(213, 25, 30, 40);
    _moneyCount.frame = CGRectMake(255, 20 ,100, 50);
    _confirmContributionBtn.frame = CGRectMake(80, 90, 150, 50);
    _selectAllBtn.frame = CGRectMake(230, 110, 100, 50);
}

#pragma mark - 当前可捐献额度label

- (UILabel *)contributionInfo{
    if (!_contributionInfo) {
        _contributionInfo = [[UILabel alloc]init];
//        _contributionInfo.layer.borderWidth = 1.0f;
//        _contributionInfo.layer.borderColor = [[UIColor blackColor]CGColor];
        _contributionInfo.textAlignment = NSTextAlignmentCenter;
        _contributionInfo.font = [UIFont systemFontOfSize:25];
        _contributionInfo.textColor = [UIColor whiteColor];
        _contributionInfo.text = @"当前可捐献额度:";
    }
    return _contributionInfo;
}

#pragma mark - 金钱图片

- (UIImageView *)moneyImage{
    if (!_moneyImage) {
        _moneyImage = [[UIImageView alloc]init];
//        _moneyImage.layer.borderWidth = 1.0f;
//        _moneyImage.layer.borderColor = [[UIColor blackColor]CGColor];
        _moneyImage.image = [UIImage imageNamed:@"money"];
    }
    return _moneyImage;
}
#pragma mark - 可捐献钱数

- (UILabel *)moneyCount{
    if (!_moneyCount) {
        _moneyCount = [[UILabel alloc]init];
//        _moneyCount.layer.borderWidth = 1.0f;
//        _moneyCount.layer.borderColor = [[UIColor blackColor]CGColor];
        _moneyCount.textAlignment = NSTextAlignmentCenter;
        _moneyCount.font = [UIFont systemFontOfSize:26];
        _moneyCount.textColor = [UIColor whiteColor];
        _moneyCount.textAlignment = NSTextAlignmentLeft;
        _moneyCount.text = @"6.66";
    }
    return _moneyCount;
}

#pragma mark - 确定捐献按钮

- (UIButton *)confirmContributionBtn{
    if (!_confirmContributionBtn) {
        _confirmContributionBtn = [[UIButton alloc]init];
        _confirmContributionBtn.layer.borderWidth = 1.0f;
        _confirmContributionBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _confirmContributionBtn.layer.cornerRadius = 5.0f;
        _confirmContributionBtn.titleLabel.font = [UIFont systemFontOfSize:26];
        [_confirmContributionBtn setTitle:@"确定捐献" forState:UIControlStateNormal];
    }
    return _confirmContributionBtn;
}

#pragma mark - 全选按钮

- (UIButton *)selectAllBtn{
    if (!_selectAllBtn) {
        _selectAllBtn = [[UIButton alloc]init];
//        _selectAllBtn.layer.borderWidth = 1.0f;
//        _selectAllBtn.layer.borderColor = [[UIColor blackColor]CGColor];
        _selectAllBtn.titleLabel.font = [UIFont systemFontOfSize:26];
        [_selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    }
    return _selectAllBtn;
}


@end
