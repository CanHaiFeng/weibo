//
//  NKSettingItem.h
//  01-彩票
//
//  Created by J on 15/9/25.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NKSettingItem : NSObject

/** 图片*/
@property (nonatomic,weak)UIImage *image;

/** 文字*/
@property (nonatomic,strong)NSString *title;

/** 右部文字*/
@property (nonatomic,strong)NSString *subTitle;

/** 保存每一行cell要做的事情*/
@property (nonatomic,strong)void (^operationBlock)(NSIndexPath *index);

+ (instancetype)settingWithImage:(UIImage *)image title:(NSString *)title;

@end
