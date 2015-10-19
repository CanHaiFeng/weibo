//
//  NKSave.m
//  01-彩票
//
//  Created by J on 15/9/24.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKSave.h"

@implementation NKSave

//取
+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

//写
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

@end
