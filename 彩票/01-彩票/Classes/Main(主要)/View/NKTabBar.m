//
//  NKTabBar.m
//  01-彩票
//
//  Created by J on 15/9/20.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKTabBar.h"
#import "NKButton.h"
#import "UIView+Frame.h"


@interface NKTabBar()

/** 选中按钮*/
@property (nonatomic,weak)UIButton *selectBtn;

@end


@implementation NKTabBar

//重写set方法
- (void)setItems:(NSArray *)items

{
    _items = items;
    
    //新建tabBarButton
    for (int i = 0; i < self.items.count; i++) {
        //取出对应的tabBarItem模型
        UITabBarItem *item = self.items[i];
        
        NKButton *btn = [NKButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        
        //设置按钮背景图片
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        //添加选中状态按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        //默认状态选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
        
        //添加按钮
        [self addSubview:btn];
        
    }
}

- (void)btnClick:(UIButton *)btn
{
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    //代理方法
    if ([_delegate respondsToSelector:@selector(tabBarWithSelectBtn:didClickBtn:)]) {
        [_delegate tabBarWithSelectBtn:self didClickBtn:btn.tag];
    }
}



//设置子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGFloat btnW = self.frame.size.width / _items.count;
    CGFloat btnW = self.width / _items.count;
//    CGFloat btnH = self.frame.size.height;
    CGFloat btnH = self.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i < _items.count; i++) {
         NKButton *btn = self.subviews[i];
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}


@end
