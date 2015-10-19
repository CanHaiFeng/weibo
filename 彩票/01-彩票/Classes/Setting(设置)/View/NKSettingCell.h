//
//  NKSettingCell.h
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NKSettingItem;

@interface NKSettingCell : UITableViewCell

//快速创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

/** 模型*/
@property (nonatomic,strong)NKSettingItem *item;

@end
