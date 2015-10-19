//
//  NKArenaViewController.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#define NKColor(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b /255.0 alpha:1]

#import "NKArenaViewController.h"
#import "NKArenaView.h"

@interface NKArenaViewController ()

@end

@implementation NKArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建自定义View
    NKArenaView *view = [[NKArenaView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置控制器View
    self.view = view;
    
    //创建导航栏
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    
    //默认选择第0个
    segment.selectedSegmentIndex = 0;
    
    //正常的照片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics: UIBarMetricsDefault];
    
    //选中的照片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //选中的文字颜色
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    //主题颜色
    segment.tintColor = NKColor(0, 142, 143);
    
    //设置导航条中间标题
    self.navigationItem.titleView = segment;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
