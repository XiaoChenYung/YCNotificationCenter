//
//  YCNotificationCenter.m
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import "YCNotificationCenter.h"

@interface YCNotificationObject : NSObject

@property (nonatomic, strong) id object;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) SEL sel;

- (instancetype)initWithObject:(id )object name:(NSNotificationName )name sel:(SEL )sel;

@end

@implementation YCNotificationObject

- (instancetype)initWithObject:(id )object name:(NSNotificationName )name sel:(SEL )sel
{
    self = [super init];
    if (self) {
        _name = name;
        _object = object;
        _sel = sel;
    }
    return self;
}

@end

@interface YCNotificationCenter ()

@property (nonatomic, strong) NSMutableDictionary<NSNotificationName, NSMutableArray<YCNotificationObject *> *> *notifications;

@end

@implementation YCNotificationCenter

+ (instancetype)defaultCenter {
    static YCNotificationCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[YCNotificationCenter alloc] init];
    });
    return center;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {
    YCNotificationObject *notificationObject = [[YCNotificationObject alloc] initWithObject:observer name:aName sel:aSelector];
    
    if (self.notifications[aName] != nil) {
        [self.notifications[aName] addObject:notificationObject];
    } else {
        self.notifications[aName] = [NSMutableArray new];
        [self.notifications[aName] addObject:notificationObject];
    }
}

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject {
    NSParameterAssert(aName != nil);
    NSMutableArray *array = self.notifications[aName];
    for (YCNotificationObject *obj in array) {
        if ([obj.object respondsToSelector:obj.sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [obj.object performSelector:obj.sel withObject:[NSNotification alloc] ];
#pragma clang diagnostic pop
        }
    }
}

- (NSMutableDictionary *)notifications {
    if (!_notifications) {
        _notifications = [NSMutableDictionary new];
    }
    return _notifications;
}

@end
