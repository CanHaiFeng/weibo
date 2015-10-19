//
//  NKPopmenu.h
//  01-彩票
//
//  Created by J on 15/9/21.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NKPopmenu;

@protocol PopmenuDelegate <NSObject>

@optional
//点击图片关闭按钮
- (void) popmenuWithDidCloceBtn:(NKPopmenu *)popmenu;

@end


@interface NKPopmenu : UIView

//创建Xib
+ (instancetype)popmenu;
//图片显示的位置
+ (instancetype)showWithPoint:(CGPoint)point;

//图片消失
- (void)hideWithPoint:(CGPoint)point hideCover:(void(^)())hideCover;

/** 代理属性*/
@property (nonatomic,weak) id <PopmenuDelegate> delegate;


@end
