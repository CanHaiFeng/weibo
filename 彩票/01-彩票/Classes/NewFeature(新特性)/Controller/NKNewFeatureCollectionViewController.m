//
//  NKNewFeatureCollectionViewController.m
//  01-彩票
//
//  Created by J on 15/9/23.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import "NKNewFeatureCollectionViewController.h"
#import "NKCollectionViewCell.h"
#import "UIView+Frame.h"

@interface NKNewFeatureCollectionViewController ()

/** 图片*/
@property (nonatomic,weak)UIImageView *guide;

/** 大文字*/
@property (nonatomic,weak)UIImageView *guideLargeText;

/** 小文字*/
@property (nonatomic,weak)UIImageView *guideSmallText;

/** 上一次X的偏移量*/
@property (nonatomic,assign) CGFloat lastOffsetX;


@end

@implementation NKNewFeatureCollectionViewController

//重写init方法
- (instancetype)init
{
    //流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    //cell间距
    layout.minimumInteritemSpacing = 0;
    
    //行间距
    layout.minimumLineSpacing = 0;
    
    //滑动的方向，水平
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //添加到流水布局中
    return [self initWithCollectionViewLayout:layout];
    
}


NSString *ID = @"cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setUPCollectionView];
    
    [self setUPAllChildView];
    
    _lastOffsetX = 0;
    
}

//初始化collectionView
- (void)setUPCollectionView
{
    
    //注册cell
    [self.collectionView registerClass:[NKCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    //取消弹簧效果
    self.collectionView.bounces = NO;
    
    //取消水平指示器
    self.collectionView.showsHorizontalScrollIndicator = NO;

    //开启分页模式
    self.collectionView.pagingEnabled = YES;
}

//添加collectionView子控件
- (void)setUPAllChildView
{
    
    //图片
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    _guide = guide;
    guide.centerX = self.collectionView.centerX;
    [self.collectionView addSubview:guide];
    
    //大文字
    UIImageView *guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    _guideLargeText = guideLargeText;
    guideLargeText.centerX = self.collectionView.centerX;
    guideLargeText.centerY = self.collectionView.bounds.size.height * 0.75;
    [self.collectionView addSubview:guideLargeText];
    
    //小文字
    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _guideSmallText = guideSmallText;
    guideSmallText.centerX = self.collectionView.centerX;
    guideSmallText.centerY = self.collectionView.bounds.size.height * 0.83;
    [self.collectionView addSubview:guideSmallText];
    
    //线段
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.centerX -= 175;
    [self.collectionView addSubview:guideLine];
    
}

//滚动的结束时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //当前的偏移量
    CGFloat curOffsetX = scrollView.contentOffset.x;
    //页数
    NSInteger index = curOffsetX / self.collectionView.bounds.size.width;
    
    
    //当前页数所对应的图片
    NSString *guideName = [NSString stringWithFormat:@"guide%ld",index + 1];
    NSString *guideLargeTextName = [NSString stringWithFormat:@"guideLargeText%ld",index + 1];
    NSString *guideSmallTextName = [NSString stringWithFormat:@"guideSmallText%ld",index + 1];
    _guide.image = [UIImage imageNamed:guideName];
    _guideLargeText.image = [UIImage imageNamed:guideLargeTextName];
    _guideSmallText.image = [UIImage imageNamed:guideSmallTextName];
    
    
    
    
    //偏移量的差值
    CGFloat delta = curOffsetX - _lastOffsetX;
    
    //先平移两个屏幕宽
    _guide.centerX += 2 * delta;
    _guideLargeText.centerX += 2 * delta;
    _guideSmallText.centerX += 2 * delta;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        //后退一个屏幕宽
        _guide.centerX -= delta;
        _guideLargeText.centerX -= delta;
        _guideSmallText.centerX -= delta;
        
    }];
    
    //记录上一次的偏移量
    _lastOffsetX = curOffsetX;
    
}






#pragma mark - UICollectionView数据源
//返回有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

//Cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存中取得Cell
    NKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell hideButton:indexPath pageNumber:4];
    
    return cell;
}

@end
