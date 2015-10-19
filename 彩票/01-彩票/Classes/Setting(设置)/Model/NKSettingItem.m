//
//  NKSettingItem.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKSettingItem.h"

@implementation NKSettingItem

+ (instancetype)settingWithImage:(UIImage *)image title:(NSString *)title
{
    NKSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    
    return item;
    
}

@end
