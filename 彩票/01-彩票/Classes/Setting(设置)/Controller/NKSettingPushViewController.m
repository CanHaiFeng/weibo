//
//  NKSettingPushViewController.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKSettingPushViewController.h"
#import "NKScoreViewController.h"
#import "NKArrowViewController.h"

@implementation NKSettingPushViewController

- (void)loadView
{
    [super loadView];
    
    [self setUPGroup];
}

- (void)setUPGroup
{
    NKArrowItem *item = [NKArrowItem settingWithImage:nil title:@"开奖推送"];
    item.descVC = [NKScoreViewController class];
    NKArrowItem *item1 = [NKArrowItem settingWithImage:nil title:@"比赛比分"];
    item1.descVC = [NKArrowViewController class];
    NKArrowItem *item2 = [NKArrowItem settingWithImage:nil title:@"开奖推送"];
    NKArrowItem *item3 = [NKArrowItem settingWithImage:nil title:@"比赛比分"];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item,item1,item2,item3];
    [self.group addObject:groupItem];
}

@end
