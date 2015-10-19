//
//  NKArenaNavigationController.m
//  01-彩票
//
//  Created by J on 15/9/22.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKArenaNavigationController.h"

@implementation NKArenaNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
}

//只调用一次,加载控制器
+ (void)initialize
{
    if (self == [NKArenaNavigationController class]) {
        //只加载当前类的控制器
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        //加载图片
        UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
        //拉伸图片
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        
        //设置控制器背景图片
        [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    
}

@end
