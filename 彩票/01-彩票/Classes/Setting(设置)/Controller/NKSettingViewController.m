//
//  NKSettingViewController.m
//  01-彩票
//
//  Created by J on 15/9/24.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKSettingViewController.h"
#import "NKSettingPushViewController.h"

@interface NKSettingViewController() <UITableViewDataSource,UITableViewDelegate>


@end


@implementation NKSettingViewController


//修改表样式
- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)loadView
{
    [super loadView];
    
    [self setUPOneGroup];
    
    [self setUPTwoGroup];
    
    [self setUPthreeGroup];
}


//创建第一组
- (void)setUPOneGroup
{
    
    NKArrowItem *item = [NKArrowItem settingWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"联系人"];
    item.descVC = [NKSettingPushViewController class];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item];
    [self.group addObject:groupItem];
}

//创建第二组
- (void)setUPTwoGroup
{
   
    NKArrowItem *item = [NKArrowItem settingWithImage:[UIImage imageNamed:@"MorePush"] title:@"提示"];
    NKSwitchItem *item1 = [NKSwitchItem settingWithImage:[UIImage imageNamed:@"MoreShare"] title:@"链接"];
    NKSwitchItem *item2 = [NKSwitchItem settingWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"下载"];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item,item1,item2];
    [self.group addObject:groupItem];

}


//创建第三组
- (void)setUPthreeGroup
{
    
    
    NKArrowItem *item = [NKArrowItem settingWithImage:[UIImage imageNamed:@"MorePush"] title:@"提示"];
    NKSettingItem *item1 = [NKSettingItem settingWithImage:[UIImage imageNamed:@"MoreShare"] title:@"链接"];
    NKSettingItem *item2 = [NKSettingItem settingWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"下载"];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item,item1,item2];
    [self.group addObject:groupItem];

}





@end
