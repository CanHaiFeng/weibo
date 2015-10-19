//
//  NKTabBarController.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKTabBarController.h"
#import "NKArenaViewController.h"
#import "NKDiscoverTableController.h"
#import "NKHallTabController.h"
#import "NKHistoryTableController.h"
#import "NKMyLotteryViewController.h"

#import "NKTabBar.h"
#import "NKNavigationController.h"
#import "NKArenaNavigationController.h"


@interface NKTabBarController () <TabBarDelegate>

/** tabBarItem数组*/
@property (nonatomic,strong)NSMutableArray *items;

@end

@implementation NKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpAllVC];
    
    [self setUpTabBar];

    
}

//懒加载tabBarItem数组
- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


//view显示之前删除系统自带的TableBarButton
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[NKTabBar class]] == NO) {
            [childView removeFromSuperview];
        }
    }
}

//添加tabBar
- (void)setUpTabBar
{
    
    /**
     *  隐藏TableBar,勾选Hide bar,但只对系统的TableBar有用，把自定义的TableBar加到系统上
     */
    
    //删除系统的tabBar
    //[self.tabBar removeFromSuperview];
    
    //新建tabBar
    NKTabBar *tabBar = [[NKTabBar alloc] init];
    
    //把系统的tabBarItem数据模型赋值给当前
    tabBar.items = self.items;
    
    //设置位置
    tabBar.frame = self.tabBar.bounds;
    
    //设置背景颜色
    tabBar.backgroundColor = [UIColor redColor];
    
    //设置代理，监听BarButton的点击，选择相应的vc
    tabBar.delegate = self;
    
    //添加当前View
    [self.tabBar addSubview:tabBar];
    
}

//实现代理方法
- (void)tabBarWithSelectBtn:(NKTabBar *)tabBar didClickBtn:(NSInteger)index
{
    self.selectedIndex = index;
}



//添加所有控制器
- (void)setUpAllVC
{
    //购彩大厅
    NKHallTabController *hallVC = [[NKHallTabController alloc] init];
    [self setUpOneVC:hallVC image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    
    //竞技场
    NKArenaViewController *arenaVC = [[NKArenaViewController alloc] init];
    [self setUpOneVC:arenaVC image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@""];
    
    //发现
    //NKDiscoverTableController *discoverVC = [[NKDiscoverTableController alloc] init];
    //加载storyborad
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"NKDiscoverTableController" bundle:nil];
    //创建箭头指定的控制器
    NKDiscoverTableController *discoverVC = [board instantiateInitialViewController];
    [self setUpOneVC:discoverVC image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    
    //开奖信息
    NKHistoryTableController *historyVC = [[NKHistoryTableController alloc] init];
    [self setUpOneVC:historyVC image:[UIImage imageNamed:@"TabBar_History_new"] selectImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    
    //我的彩票
    //NKMyLotteryViewController *myLotteryVC = [[NKMyLotteryViewController alloc] init];
    //加载storyboard
    UIStoryboard *board1 = [UIStoryboard storyboardWithName:@"NKMyLotteryViewController" bundle:nil];
    //加载箭头指定的控制器
    NKMyLotteryViewController *myLotteryVC = [board1 instantiateInitialViewController];
    
    [self setUpOneVC:myLotteryVC image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
    
    
}


//添加一个控制器
- (void)setUpOneVC:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
    UINavigationController *nac = [[NKNavigationController alloc] initWithRootViewController:vc];
    
    //单独设置竞技场的控制器
    if ([vc isKindOfClass:[NKArenaViewController class]]) {
        nac = [[NKArenaNavigationController alloc] initWithRootViewController:vc];
    }
    
    //设置按钮图片,取消渲染
    nac.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置按钮选中图片,取消渲染
    nac.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置导航标题
    vc.title = title;
    
    //把tabBarItem添加数组
    [self.items addObject:nac.tabBarItem];
    
    
    [self addChildViewController:nac];

}



@end
