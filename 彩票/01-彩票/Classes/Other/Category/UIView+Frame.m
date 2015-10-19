//
//  UIView+UIView_Frame.m
//  01-彩票
//
//  Created by J on 15/9/21.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (UIView_Frame)


//x
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect testFrame = self.frame;
    
    testFrame.origin.x = x;
    
    self.frame = testFrame;
}

//y
- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect testFrame = self.frame;
    
    testFrame.origin.y = y;
    
    self.frame = testFrame;
}

//width
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect testFrame = self.frame;
    
    testFrame.size.width = width;
    
    self.frame = testFrame;
}


//y
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHight:(CGFloat)height
{
    CGRect testFrame = self.frame;
    
    testFrame.size.height = height;
    
    self.frame = testFrame;
}


//centerX
- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint cent = self.center;
    
    cent.x = centerX;
    
    self.center = cent;
}


//centerY
- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint cen = self.center;
    
    cen.y = centerY;
    
    self.center = cen;
}

@end
