//
//  setPhotoCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "setPhotoCell.h"

@implementation setPhotoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.personPhoto];
        [self.contentView addSubview:self.setNameLabel];
        [self.contentView addSubview:self.setNameLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _personPhoto.frame = CGRectMake(48, -6.4, 102.8, 145);
    _setNameLabel.frame =  CGRectMake(168, 90, 100, 40);
    _setNameLevel.frame = CGRectMake(180, 133, 212, 5.1);
}

#pragma mark - 头像getter（）

- (UIImageView *)personPhoto{
    if (!_personPhoto) {
        _personPhoto = [[UIImageView alloc]init];
//        _personPhoto.layer.borderWidth = 1.0f;
//        _personPhoto.layer.borderColor = [[UIColor whiteColor]CGColor]
        _personPhoto.image = [UIImage imageNamed:@"学霸捐-头像"];
    }
    return _personPhoto;
}

#pragma mark - 姓名getter（）
- (UILabel *)setNameLabel{
    if (!_setNameLabel) {
        _setNameLabel = [[UILabel alloc]init];
        _setNameLabel.font = [UIFont systemFontOfSize:24.5];
        _setNameLabel.textColor = [UIColor whiteColor];
        _setNameLabel.textAlignment = NSTextAlignmentCenter;
//        _setNameLabel.layer.borderWidth = 1.0f;
//        _setNameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        _setNameLabel.text = @"周颖英";
    }
    return _setNameLabel;
    
}

#pragma mark - 姓名下横线

- (UIImageView *)setNameLevel{
    if (!_setNameLevel) {
        _setNameLevel = [[UIImageView alloc]init];
//        _setNameLevel.layer.borderWidth = 1.0f;
//        _setNameLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _setNameLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _setNameLevel;
}

@end
