//
//  NKTabController.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKHallTabController.h"
#import "UIImage+Image.h"
#import "NKCover.h"
#import "NKPopmenu.h"



@interface NKHallTabController () <PopmenuDelegate>

@end

@implementation NKHallTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginal:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
 
}

//点击导航栏左边按钮调用
- (void)activity
{
    //创建蒙版，显示当前窗口
    [NKCover show];
    
    CGFloat scrrenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrrenH = [UIScreen mainScreen].bounds.size.height;
    //创建图片，显示当前窗口
    NKPopmenu *popmenu = [NKPopmenu showWithPoint:CGPointMake(scrrenW * 0.5, scrrenH * 0.5)];
    
    //设置代理
    popmenu.delegate = self;
}

//点击图片关闭按钮调用
- (void)popmenuWithDidCloceBtn:(NKPopmenu *)popmenu
{
    
    [popmenu hideWithPoint:CGPointMake(44, 44) hideCover:^{
    
        [NKCover hide];
        
    }];
    
}

@end
