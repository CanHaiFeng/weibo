//
//  NKBaseVIewController.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKBaseVIewController.h"



@interface NKBaseVIewController()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NKBaseVIewController



//懒加载
- (NSMutableArray *)group
{
    if (!_group) {
        NSMutableArray *group = [NSMutableArray array];
        _group = group;
    }
    return _group;
}

#pragma mark - 数据源
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.group.count;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NKGroupItem *groupItem = self.group[section];
    return groupItem.items.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKSettingCell *cell = [NKSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    NKGroupItem *groupItem = self.group[indexPath.section];
    NKSettingItem *item = groupItem.items[indexPath.row];
    cell.item = item;
    
    return cell;
}

//头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NKGroupItem *groupItem = self.group[section];
    return groupItem.headTitle;
}

//尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NKGroupItem *groupItem = self.group[section];
    return groupItem.footerTitle;
}

//跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKGroupItem *groupItem = self.group[indexPath.section];
    NKSettingItem *item = groupItem.items[indexPath.row];
    
    //判断当前是不是箭头样式
    if ([item isKindOfClass:[NKArrowItem class]]) {
        NKArrowItem *arrowItem = (NKArrowItem *)item;
        //是否存在跳转控制器
        if (arrowItem.descVC) {
            UIViewController *vc = [[arrowItem.descVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


@end
