//
//  NKMyLotteryViewController.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKMyLotteryViewController.h"
#import "NKSettingViewController.h"
#import "UIImage+Image.h"

@interface NKMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation NKMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置按钮的背景图片，按钮的背景图片只能靠代码去拉伸
    
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    UIImage *pressImage = [UIImage imageNamed:@"RedButtonPressed"];
    
    //保留高的上半部分，宽的左半部分
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    pressImage = [pressImage stretchableImageWithLeftCapWidth:pressImage.size.width * 0.5 topCapHeight:pressImage.size.height * 0.5];
    
    
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:pressImage forState:UIControlStateHighlighted];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginal:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
}

//跳转到设置
- (void)setting
{
    NKSettingViewController *setting = [[NKSettingViewController alloc] init];
    
    [self.navigationController pushViewController:setting animated:YES];
}


@end
