//
//  BaseInfoSave.m
//  StudyContribution
//
//  Created by Surprised on 16/7/18.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "BaseInfoSave.h"
@implementation BaseInfoSave
@synthesize allInfoDic;
@synthesize tel;

//单例模式
+(id)sharedInstance
{
    static BaseInfoSave *saveInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        saveInfo = [[self alloc]init];
    });
    return saveInfo;
}
-(id)init{
    allInfoDic = [NSMutableDictionary dictionary];
    return self;
}


#pragma mark - 存储信息
//存储手机号
-(void)saveTel:(NSString *)aNum
{
    [allInfoDic setObject:aNum forKey:@"telephonenumber"];
    NSLog(@"%@",allInfoDic);
}
//存储基本信息
-(void)saveOneInfoWithUniversity:(NSString *)university School:(NSString *)schoolinfo Class:(NSString *)classinfo StuNum:(NSString *)stunuminfo
{
    [allInfoDic setObject:university forKey:@"universityname"];
    [allInfoDic setObject:schoolinfo forKey:@"school"];
    [allInfoDic setObject:classinfo forKey:@"class"];
    [allInfoDic setObject:stunuminfo forKey:@"studentnumber"];
    NSLog(@"%@",allInfoDic);
    //[someInfoArr addObject:allInfoDic];
}
//存储密码
-(void)savePassword:(NSString *)apassword
{
    [allInfoDic setObject:apassword forKey:@"password"];
    NSLog(@"%@",allInfoDic);
}
//存储要修改的电话号码
-(void)saveTelNum:(NSString *)anum
{
    tel = anum;
}
#pragma mark - 获取信息
//获取密码
-(NSString *)searchPasswordWithTelnum:(NSString *)aTelnum
{
    if([aTelnum isEqualToString:allInfoDic[@"telephonenumber"]])
    {
        NSLog(@"%@",allInfoDic[@"apassword]"]);
        return allInfoDic[@"apassword"];
    }
    else
    {
        return nil;
    }
}
//获取其他信息
-(NSString *)searchBaseInfoWithTelnum:(NSString *)aTelnum
{
    if([aTelnum isEqualToString:allInfoDic[@"telephonenumber"]])
    {
        NSString *s;
        s = [s stringByAppendingFormat:@"%@,%@,%@,%@,%@,%@,%@,%@",@"university",allInfoDic[@"university"],@"school",allInfoDic[@"schoolinfo"],@"class",allInfoDic[@"classinfo"],@"studentnum",allInfoDic[@"stunuminfo"]];
        return s;
    }
    else
        return nil;
}

#pragma mark - 修改信息
//修改密码
-(BOOL)alertPassword:(NSString *)password
{
    if ([tel isEqualToString:allInfoDic[@"telephonenumber"]])
    {
        [allInfoDic setValue:password forKey:@"apassword"];
        return true;
    }
    else
        return false;
}
@end
