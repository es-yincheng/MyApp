//
//  YCSafeValue.m
//  YCTableViewDemo
//
//  Created by 尹成 on 16/7/5.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/**
 *  NSMutableDictionary
 */
@implementation NSMutableDictionary (Safe)

+ (void)load{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(objectForKey:));
    Method new = class_getInstanceMethod(self, @selector(yc_safeobjectForKey:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

- (id)yc_safeobjectForKey:(id)aKey{
    if (!aKey) {
        return nil;
    }
    return (([self yc_safeobjectForKey:aKey] == [NSNull null]) ? (nil) : ([self yc_safeobjectForKey:aKey]));
}


/**
 *  该方法是为了提醒为将该文件设为mrc，以解决键盘弹起时按home退出会崩溃的bug
 *  -fno-objc-arc
 */
- (void)test{
    Class class = NSClassFromString(@"");
    [[class init] release];
}

@end



/**
 *  NSDictionary
 */
@implementation NSDictionary (Safe)

+ (void)load{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryI"), @selector(objectForKey:));
    Method new = class_getInstanceMethod(self, @selector(yc_safeobjectForKey:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

- (id)yc_safeobjectForKey:(id)aKey{
    if (!aKey) {
        return nil;
    }
    return (([self yc_safeobjectForKey:aKey] == [NSNull null]) ? (nil) : ([self yc_safeobjectForKey:aKey]));
}

@end



/**
 *  NSMutableArray
 */
@implementation NSMutableArray (Safe)

+ (void)load{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method new = class_getInstanceMethod(self, @selector(yc_safeobjectAtSafeIndex0:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

- (id)yc_safeobjectAtSafeIndex0:(NSUInteger)index{
    if (index<self.count) {
        return [self yc_safeobjectAtSafeIndex0:index];
    }
    //NSAssert(NO, @"数组为空I");
    return nil;
}

@end


/**
 *  NSArray
 */
@implementation NSArray (Safe)

+ (void)load{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method new = class_getInstanceMethod(self, @selector(yc_safeobjectAtSafeIndex1:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

- (id)yc_safeobjectAtSafeIndex1:(NSUInteger)index{
    if (index<self.count) {
        return [self yc_safeobjectAtSafeIndex1:index];
    }
    //NSAssert(NO, @"数组为空I");
    return nil;
}

@end
