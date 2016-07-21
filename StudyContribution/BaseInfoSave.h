//
//  BaseInfoSave.h
//  StudyContribution
//
//  Created by Surprised on 16/7/18.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInfoSave : NSObject
@property(nonatomic,strong)NSMutableDictionary *allInfoDic;
@property(nonatomic,strong)NSString *tel;

-(void)saveTel:(NSString *)aNum;
-(void)saveOneInfoWithUniversity:(NSString *)university School:(NSString *)schoolinfo Class:(NSString *)classinfo StuNum:(NSString *)stunuminfo;
-(void)savePassword:(NSString *)apassword;
-(BOOL)alertPassword:(NSString *)password;
-(NSString *)searchBaseInfoWithTelnum:(NSString *)aTelnum;
-(NSString *)searchPasswordWithTelnum:(NSString *)aTelnum;
-(void)saveTelNum:(NSString *)anum;
+(id)sharedInstance;
@end
