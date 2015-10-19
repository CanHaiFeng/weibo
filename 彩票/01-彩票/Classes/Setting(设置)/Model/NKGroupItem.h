//
//  NKGroupItem.h
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKGroupItem : NSObject

/** 头标题*/
@property (nonatomic,strong)NSString *headTitle;

/** 尾标题*/
@property (nonatomic,strong)NSString *footerTitle;

/** 行*/
@property (nonatomic,strong)NSArray *items;


@end
