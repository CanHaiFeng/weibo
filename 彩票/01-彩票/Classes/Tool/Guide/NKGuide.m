//
//  Guide.m
//  01-彩票
//
//  Created by J on 15/9/24.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKGuide.h"
#import "NKTabBarController.h"
#import "NKNewFeatureCollectionViewController.h"
#import "NKSave.h"

@implementation NKGuide

+ (UIViewController *)chooseRootViewController
{
    UIViewController *rootVC = nil;
    
    //获得当前info.plist文件
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    //当前最新版本号
    NSString *curVersion = info[@"CFBundleShortVersionString"];
    
    //从沙盒中读取上一版本号
    NSString *lastVersion = [NKSave objectForKey:@"curVersion"];
    
    //比较版本号是否相同
    if ([curVersion isEqualToString:lastVersion]) {
        
        //添加根控制器
        rootVC = [[NKTabBarController alloc] init];
        
    }else {
        
        //设置新特性导航器为窗口根控制器
         rootVC = [[NKNewFeatureCollectionViewController alloc] init];
        
        
        //存储最新版本号到沙盒中
        [NKSave setObject:curVersion forKey:@"curVersion"];
        
    }
    
    return rootVC;
}

@end
