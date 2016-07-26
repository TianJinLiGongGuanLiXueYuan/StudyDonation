//
//  classInRecordCell.h
//  StudyContribution
//
//  Created by Student01 on 16/7/25.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface classInRecordCell : UITableViewCell

@property (nonatomic,strong) UILabel *classInDateLabel;
@property (nonatomic,strong) UILabel *classInDetailLabel;

@property (nonatomic,strong) UIImageView *tickImage;

@property (nonatomic,strong) UIImageView *classInRecordLevel;

@property (nonatomic,assign)  BOOL mark;

-(void)seleteMode;

@end
