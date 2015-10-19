//
//  NKDiscoverButton.m
//  01-彩票
//
//  Created by J on 15/9/23.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKTitleButton.h"
#import "UIView+Frame.h"


@implementation NKTitleButton


//重写按钮的图片设置
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    //根据按钮的大小，自动设置大小
    [self sizeToFit];
}

//重写按钮的文字设置
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    //根据按钮的大小，自动设置大小
    [self sizeToFit];
}

//设置按钮图片和文字的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //为了只调用一次
    if (self.imageView.x < self.titleLabel.x) {
        
        self.titleLabel.x = self.imageView.x ;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}


@end
