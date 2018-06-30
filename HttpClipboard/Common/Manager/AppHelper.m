//
//  AppHelper.m
//  CP
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper



+ (instancetype)helper{
    static AppHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[AppHelper alloc]init];
    });
    return helper;
}






@end
