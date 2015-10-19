//
//  NKBuyTableViewController.m
//  01-彩票
//
//  Created by J on 15/9/22.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKBuyTableViewController.h"
#import "NKTitleButton.h"
#import "UIImage+Image.h"

@interface NKBuyTableViewController ()

/** 标题按钮*/
@property (nonatomic,weak)NKTitleButton *btn;

@end

@implementation NKBuyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置导航控制器标题按钮
    NKTitleButton *btn = [NKTitleButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [btn setTitle:@"等着输吧" forState:UIControlStateNormal];
    
    _btn = btn;
    
    self.navigationItem.titleView = btn;
    
}

//点击助手
- (IBAction)help:(id)sender {
    
    [_btn setTitle:@"你还是输了" forState:UIControlStateNormal];
}



@end
