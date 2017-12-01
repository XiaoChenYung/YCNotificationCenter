//
//  YCNotification.m
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import "YCNotification.h"

@interface YCNotification ()

@property (nonnull, readwrite, copy) NSNotificationName name;

@property (nullable, readwrite, strong) id object;

@property (nullable, readwrite, copy) NSDictionary *userInfo;

@end

@implementation YCNotification

- (instancetype)initWithName:(NSNotificationName )name object:(id )object userInfo:(NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}

@end
