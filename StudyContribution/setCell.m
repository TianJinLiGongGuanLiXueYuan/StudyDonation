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
        [self.contentView addSubview:self.schoolLabel];
        [self.contentView addSubview:self.upschoolLabel];
        [self.contentView addSubview:self.setImage];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _schoolLabel.frame = CGRectMake(5, 13, 133, 40);
    _upschoolLabel.frame = CGRectMake(142, 13, 220, 40);
    _setImage.frame = CGRectMake(2, 52, 380, 4.4);
}

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

- (UIImageView *)setImage{
    if (!_setImage) {
        _setImage = [[UIImageView alloc]init];
//        _setImage.layer.borderWidth = 1.0f;
//        _setImage.layer.borderColor = [[UIColor blackColor]CGColor];
        _setImage.image = [UIImage imageNamed:@"学霸捐－粉笔粗线"];
    }
    return _setImage;
}
@end
