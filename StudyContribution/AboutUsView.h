//
//  AboutUsView.h
//  StudyContribution
//
//  Created by Student01 on 16/7/23.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

extern NSString * const kRNBlurDidShowNotification;
extern NSString * const kRNBlurDidHidewNotification;

@interface AboutUsView : UIView

@property (assign) CGFloat animationDuration;
@property (assign) CGFloat animationDelay;
@property (assign) UIViewAnimationOptions animationOptions;

- (id)initWithViewController:(UIViewController*)viewController view:(UIView*)view;
- (id)initWithViewController:(UIViewController*)viewController title:(NSString*)title message:(NSString*)message;

- (void)show;
- (void)showWithDuration:(CGFloat)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options completion:(void (^)(void))completion;

- (void)hide;
- (void)hideWithDuration:(CGFloat)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options completion:(void (^)(void))completion;

@end
