//
//  NKSwitchViewController.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKScoreViewController.h"

@implementation NKScoreViewController

- (void)loadView
{
    [super loadView];
    
    [self setUPGroup];
}

- (void)setUPGroup
{
    NKSwitchItem *item = [NKSwitchItem settingWithImage:nil title:@"开奖"];
    NKSwitchItem *item1 = [NKSwitchItem settingWithImage:nil title:@"开奖"];
    NKSwitchItem *item2 = [NKSwitchItem settingWithImage:nil title:@"开奖"];
    NKGroupItem *groupItem = [[NKGroupItem alloc] init];
    groupItem.items = @[item,item1,item2];
    [self.group addObject:groupItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKSettingCell *cell = [NKSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    NKGroupItem *groupItem = self.group[indexPath.section];
    NKSettingItem *item = groupItem.items[indexPath.row];
    cell.item = item;
    
    return cell;
}


@end
