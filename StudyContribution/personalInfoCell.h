//
//  personalInfoCell.h
//  StudyContribution
//
//  Created by Student01 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personalInfoCell : UITableViewCell

@property (nonatomic,strong) UILabel *schoolLabel;

@property (nonatomic,strong) UITextField *schoolText;

@property (nonatomic,strong) UIImageView *bottomLevel;

- (void)enableEting;
- (void)noEnableEting;

@end
