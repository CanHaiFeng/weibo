//
//  NKCollectionViewCell.m
//  01-彩票
//
//  Created by J on 15/9/23.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKCollectionViewCell.h"
#import "UIView+Frame.h"
#import "NKTabBarController.h"

@interface NKCollectionViewCell()


@property (nonatomic,weak)UIImageView *imageV;

/** 进入按钮*/
@property (nonatomic,weak)UIButton *startBtn;

@end

@implementation NKCollectionViewCell

//按钮懒加载
- (UIButton *)startBtn
{
    if (!_startBtn) {
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [startBtn sizeToFit];
        
        [self.contentView addSubview:startBtn];
        
        //监听按钮点击
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startBtn = startBtn;
        
    }
    return _startBtn;
}

//进入主程序
- (void)start
{
    //设置窗口控制器为tabBar
    NKTabBarController *tabBarVC = [[NKTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
    
    //转场动画
    CATransition *animon = [CATransition animation];
    animon.type = @"rippleEffect";
    animon.duration = 1;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animon forKey:nil];
                            
}


//让最后一页显示按钮
- (void)hideButton:(NSIndexPath *)indexPath pageNumber:(int)number {
    
    if (indexPath.item == number - 1) {
        

        self.startBtn.hidden = NO;
        
    }else {
        
       self.startBtn.hidden = YES;
        
    }
}



//懒加载
- (UIImageView *)imageV
{
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        
        _imageV = imageV;
        
        //添加到cell的显示内容
        [self.contentView addSubview:imageV];
    }
    return _imageV;
}

//重写image方法
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageV.image = image;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageV.frame = self.bounds;
    
    self.startBtn.center = CGPointMake(self.width * 0.5, self.height * 0.9);
}

@end
