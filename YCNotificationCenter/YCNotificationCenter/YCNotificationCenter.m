//
//  YCNotificationCenter.m
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import "YCNotificationCenter.h"

@implementation YCNotificationCenter

+ (instancetype)defaultCenter {
    static YCNotificationCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[YCNotificationCenter alloc] init];
    });
    return center;
}

@end
