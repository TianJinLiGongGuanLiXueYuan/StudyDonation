//
//  drawRactangle.m
//  StudyContribution
//
//  Created by Hucy on 16/8/4.
//  Copyright © 2016年 刘芮东. All rights reserved.
//

#import "drawRactangle.h"

@implementation drawRactangle

- (void)drawRect:(CGRect)rect{
    //创建路径并获取句柄
    CGMutablePathRef path = CGPathCreateMutable();
    //指定矩形
    CGRect rectangle = CGRectMake(0,0,  362, 620);
    //将矩形添加到路径中
    CGPathAddRect(path,NULL,rectangle);
    //获取上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //将路径添加到上下文
    CGContextAddPath(currentContext, path);
    //设置矩形填充色
    [[UIColor clearColor]setFill];
    //矩形边框颜色
    [[UIColor whiteColor] setStroke];
    //边框宽度
    CGContextSetLineWidth(currentContext,3.0f);
    //绘制
    CGContextDrawPath(currentContext, kCGPathFillStroke);
}


@end
