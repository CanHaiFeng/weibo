//
//  NKSettingCell.m
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKSettingCell.h"
#import "NKArrowItem.h"
#import "NKSwitchItem.h"

@interface NKSettingCell()

/** 开关*/
@property (nonatomic,weak)UISwitch *switchView;

@end

@implementation NKSettingCell

//懒加载
- (UISwitch *)switchView
{
    if (!_switchView) {
        UISwitch *switchView = [[UISwitch alloc] init];
        _switchView = switchView;
    }
    return _switchView;
}


//创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString *ID = @"cell";
    
    NKSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NKSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

//重写setItem方法
- (void)setItem:(NKSettingItem *)item
{
    _item = item;
    
    [self setUPData];
    
    [self setUPAcco];
    
}

//数据
- (void)setUPData
{
    self.textLabel.text = _item.title;
    self.imageView.image = _item.image;
    self.detailTextLabel.text = _item.subTitle;
}

//样式
- (void)setUPAcco
{
    if ([_item isKindOfClass:[NKArrowItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if ([_item isKindOfClass:[NKSwitchItem class]]) {
        self.accessoryView = [[UISwitch alloc] init];
    }else {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = nil;
    }
}

@end
