//
//  UIView+UIView_Frame.h
//  01-彩票
//
//  Created by J on 15/9/21.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Frame)


//分类中的property只能声明

/** X*/
@property (nonatomic,assign) CGFloat x;

/** Y*/
@property (nonatomic,assign) CGFloat y;

/** Width*/
@property (nonatomic,assign) CGFloat width;

/** Hight*/
@property (nonatomic,assign) CGFloat height;

/** CenterX*/
@property (nonatomic,assign) CGFloat centerX;

/** CenterY*/
@property (nonatomic,assign) CGFloat centerY;

@end
