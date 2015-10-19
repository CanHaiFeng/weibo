//
//  NKTabBar.h
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NKTabBar;
//协议
@protocol TabBarDelegate <NSObject>

@optional

- (void)tabBarWithSelectBtn:(NKTabBar *)tabBar didClickBtn:(NSInteger)index;


@end




@interface NKTabBar : UIView


/** 自定义tabBarItem数组*/
@property (nonatomic,strong)NSArray *items;

/** 代理属性*/
@property (nonatomic,weak) id<TabBarDelegate> delegate;

@end
