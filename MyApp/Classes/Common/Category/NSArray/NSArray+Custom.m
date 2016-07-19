//
//  NSArray+Custom.m
//  IBZApp
//
//  Created by 尹成 on 16/6/27.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import "NSArray+Custom.h"

@implementation NSArray (Custom)

- (id)yc_objectAtIndex:(NSUInteger)index{
    return (index < self.count ? [self objectAtIndex:index] : nil);
}

@end

