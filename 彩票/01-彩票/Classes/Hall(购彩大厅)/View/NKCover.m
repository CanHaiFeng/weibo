//
//  NKCover.m
//  01-彩票
//
//  Created by J on 15/9/21.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKCover.h"

@implementation NKCover



//初始化
+ (void)show
{
   //创建蒙版，黑色，0.6透明度
    NKCover *cover = [[NKCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    
    
    //添加到当前窗口
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
}


//移除蒙版
+ (void)hide
{
    //遍历主窗口所有的控件
    for (UIView *cover in [[UIApplication sharedApplication].keyWindow subviews]) {
        
        //判断是否是该蒙版
        if ([cover isKindOfClass:[self class]]) {
            [cover removeFromSuperview];
            
        }
    };
}

@end
