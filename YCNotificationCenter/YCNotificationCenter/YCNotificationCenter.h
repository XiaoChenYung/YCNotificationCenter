//
//  YCNotificationCenter.h
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCNotificationCenter : NSObject

+ (nonnull instancetype )defaultCenter;

- (void)addObserver:(nonnull id )observer selector:(nonnull SEL )aSelector name:(nonnull NSNotificationName )aName object:(nullable id )anObject;

- (void)postNotificationName:(nonnull NSNotificationName )aName object:(nullable id )anObject;

@end
