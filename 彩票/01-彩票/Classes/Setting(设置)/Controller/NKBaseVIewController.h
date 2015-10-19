//
//  NKBaseVIewController.h
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKSettingCell.h"
#import "NKSettingItem.h"
#import "NKGroupItem.h"
#import "NKSwitchItem.h"
#import "NKArrowItem.h"


@interface NKBaseVIewController : UITableViewController

/** 组数*/
@property (nonatomic,strong)NSMutableArray *group;

@end
