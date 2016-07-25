//
//  ButtonCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.classInRecordBtn];
        [self.contentView addSubview:self.contributionRecordBtn];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _classInRecordBtn.frame = CGRectMake(0, 0, self.center.x, self.center.y*2);
    _contributionRecordBtn.frame = CGRectMake(self.center.x, 0, self.center.x, self.center.y*2);
}

//设置信息getter（）
- (UIButton *)classInRecordBtn{
    if (!_classInRecordBtn) {
        _classInRecordBtn = [[UIButton alloc]init];
        _classInRecordBtn.layer.borderWidth = 1.0f;
        _classInRecordBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _classInRecordBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        [_classInRecordBtn setTitle:@"上课记录" forState:UIControlStateNormal];
    }
    return _classInRecordBtn;
}

//底边横线
- (UIButton *)contributionRecordBtn{
    if (!_contributionRecordBtn) {
        _contributionRecordBtn = [[UIButton alloc]init];
        _contributionRecordBtn.layer.borderWidth = 1.0f;
        _contributionRecordBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _contributionRecordBtn.titleLabel.font = [UIFont systemFontOfSize:26.5];
        _contributionRecordBtn.backgroundColor = [UIColor clearColor];
        [_contributionRecordBtn setTitle:@"捐赠记录" forState:UIControlStateNormal];
    }
    return _contributionRecordBtn;
}

@end
