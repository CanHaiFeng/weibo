//
//  NKArrowViewController.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKArrowViewController.h"

@implementation NKArrowViewController

- (void)loadView
{
    [super loadView];
    
    [self setUPGroup];
    
    [self setUPGroup1];
    
    [self setUPGroup2];
}

//修改表样式
- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)setUPGroup
{
    NKSwitchItem *item = [NKSwitchItem settingWithImage:nil title:@"关注"];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item];
    
    [self.group addObject:groupItem];
    
}

- (void)setUPGroup1
{
    NKSettingItem *item = [NKSettingItem settingWithImage:nil title:@"关注"];
    item.subTitle = @"00:00";
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item];
    
    [self.group addObject:groupItem];
    
}

- (void)setUPGroup2
{
    NKSettingItem *item = [NKSettingItem settingWithImage:nil title:@"关注"];
    item.subTitle = @"00:00";
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item];
    
    [self.group addObject:groupItem];
    
}



@end
