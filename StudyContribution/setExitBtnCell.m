//
//  setExitBtnCell.m
//  StudyContribution
//
//  Created by Student01 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "setExitBtnCell.h"

@implementation setExitBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.exitBtn];
        [self.contentView addSubview:self.setExitBtnLevel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _exitBtn.frame = CGRectMake(97, 8, 213, 45);
    _setExitBtnLevel.frame =  CGRectMake(100, 50.5, 210, 4.4);
}

#pragma mark - 退出按钮getter（）

- (UIButton *)exitBtn{
    if (!_exitBtn) {
        _exitBtn = [[UIButton alloc]init];
//        _exitBtn.layer.borderWidth = 1.0f;
//        _exitBtn.layer.borderColor = [[UIColor whiteColor]CGColor]
        _exitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_exitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _exitBtn.titleLabel.font = [UIFont systemFontOfSize:24.8];
        [_exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_exitBtn addTarget:self action:@selector(exitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitBtn;
}

- (void)exitBtnClick:(UIButton *)sender{
    
}

#pragma mark - 退出按钮下横线

- (UIImageView *)setExitBtnLevel{
    if (!_setExitBtnLevel) {
        _setExitBtnLevel = [[UIImageView alloc]init];
//        _setExitBtnLevel.layer.borderWidth = 1.0f;
//        _setExitBtnLevel.layer.borderColor = [[UIColor blackColor]CGColor];
        _setExitBtnLevel.image = [UIImage imageNamed:@"学霸捐－短横线"];
    }
    return _setExitBtnLevel;
}

@end
