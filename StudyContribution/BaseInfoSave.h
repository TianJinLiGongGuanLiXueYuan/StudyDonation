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

-(void)saveOneInfoWithTel:(NSString *)aNum apassword:(NSString *)apassword;
-(BOOL)alertPassword:(NSString *)password;
-(NSString *)searchBaseInfoWithTelnum:(NSString *)aTelnum;
-(NSString *)searchPasswordWithTelnum:(NSString *)aTelnum;
-(void)saveTelNum:(NSString *)anum;
+(id)sharedInstance;
@end
