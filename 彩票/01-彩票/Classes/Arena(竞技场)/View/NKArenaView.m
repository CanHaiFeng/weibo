//
//  NKArenaImageView.m
//  01-彩票
//
//  Created by J on 15/9/22.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKArenaView.h"

@implementation NKArenaView

- (void)drawRect:(CGRect)rect
{
    //加载图片
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    
    //绘制图片
    [image drawInRect:rect];
}


@end
