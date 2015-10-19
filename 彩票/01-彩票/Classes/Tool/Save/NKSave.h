//
//  NKSave.h
//  01-彩票
//
//  Created by J on 15/9/24.
//  Copyright (c) 2015年 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKSave : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
