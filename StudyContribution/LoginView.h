//
//  LoginView.h
//  StudyContribution
//
//  Created by Surprised on 16/7/16.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

//界面控件
@property (nonatomic,strong) UIButton *nextbtn;
@property (nonatomic,strong) UITextField *telTextF;
@property (nonatomic,strong) UITextField *verifyTexF;
@property (nonatomic,strong) UIButton *inputBtn;
@property(nonatomic,strong)UIView *loginV;
@property(nonatomic,strong)UIImageView *lineOne;
@property(nonatomic,strong)UIImageView *lineTwo;
@property(nonatomic,strong)UIImageView *borderOne;
@property(nonatomic,strong)UIImageView *boederTwo;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel* titleLab;

+ (BOOL) isMobile:(NSString *)mobileNumbel;
-(UITextField *)telTextF;
-(UITextField *)verifyTexF;
-(UIButton *)inputBtn;
-(UIButton *)nextbtn;
-(void)inputBtnClick;
-(void)textFieldDidChange:(UITextField *)theTextField;
-(void)viewTapped:(UITapGestureRecognizer*)tap;
@end
