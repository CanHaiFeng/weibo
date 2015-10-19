//
//  NKNavigationController.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKNavigationController.h"
#import "UIImage+Image.h"


@interface NKNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

/** 最初滑动返回的代理*/
@property (nonatomic,strong)id popDelegate;

@end

@implementation NKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //存储View加载完毕,滑动返回的代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    /**
     *  系统的滑动返回手势
     *1.手势：UIScreenEdgePanGestureRecognizer
     *2.调用的对象类型：target = _UINavigationInteractiveTransition
     *3.调用的方法：action = handleNavigationTransition:
     */
    
    //设置控制器的代理
    self.delegate = self;
    
    //全局滑动返回手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
    
    //关闭系统滑动返回手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

//是否允许触发当前手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count != 1;
}




//当导航控制器的子控制器完全显示
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //当子控制器是根控制器
    if (viewController == self.childViewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }
}

//每次跳转控制器的时候都会调用
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //当把导航条自带的返回按钮覆盖，就不会有滑动返回。
    
    
    //判断是否是根控制器
    if (self.childViewControllers.count != 0) {
        
        //清空返回手势代理
        self.interactivePopGestureRecognizer.delegate = nil;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginal:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}




//第一次加载类调用
+ (void)load
{
    
}


// 第一次使用当前类或者它的子类的时候调用
// 作用:初始化类
+ (void)initialize
{
    if (self == [NKNavigationController class]) {
        
        //获取当前类的导航条
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        //设置背景照片
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary *textDis = [NSMutableDictionary dictionary];
        
        textDis[NSForegroundColorAttributeName] = [UIColor whiteColor];
        textDis[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        
        //设置标题文字
        [navBar setTitleTextAttributes:textDis];
       
        
    }
}



@end
