//
//  YCNotification.h
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCNotification : NSObject

@property (nonnull, readonly, copy) NSNotificationName name;

@property (nullable, readonly, strong) id object;

@property (nullable, readonly, copy) NSDictionary *userInfo;

@end
