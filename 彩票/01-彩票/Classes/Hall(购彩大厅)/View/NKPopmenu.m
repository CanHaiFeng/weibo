//
//  NKPopmenu.m
//  01-彩票
//
//  Created by J on 15/9/21.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKPopmenu.h"

@interface NKPopmenu()

@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end


@implementation NKPopmenu



//创建Xib
+ (instancetype)popmenu
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] [0];
}


//图片显示的位置
+ (instancetype)showWithPoint:(CGPoint)point
{
    NKPopmenu *popmenu = [NKPopmenu popmenu];
    popmenu.center = point;
    
    [[UIApplication sharedApplication].keyWindow addSubview:popmenu];
    
    return popmenu;
}


//关闭图像
- (void)hideWithPoint:(CGPoint)point hideCover:(void (^)())hideCover
{
    
    [UIView animateWithDuration:0.5 animations:^{
        //修改位置，尺寸
        self.center = point;
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        //移除xib
        [self removeFromSuperview];
        //判断是否存在
        if (hideCover) {
            hideCover();
        }
    }];

}



//点击图片的关闭按钮
- (IBAction)closeBtn:(id)sender {
    
    //调用代理方法
    if ([_delegate respondsToSelector:@selector(popmenuWithDidCloceBtn:)]) {
        [_delegate popmenuWithDidCloceBtn:self];
    }
    
}


@end
