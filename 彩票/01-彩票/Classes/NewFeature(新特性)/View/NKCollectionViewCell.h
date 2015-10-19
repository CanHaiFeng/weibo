//
//  NKCollectionViewCell.h
//  01-彩票
//
//  Created by J on 15/9/23.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKCollectionViewCell : UICollectionViewCell

/** 图片*/
@property (nonatomic,strong)UIImage *image;

- (void)hideButton:(NSIndexPath *)indexPath pageNumber:(int)number;

@end
