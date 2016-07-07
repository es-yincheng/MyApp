//
//  YC3DTouch.h
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YC3DTouch : NSObject

+ (BOOL)setHomeScreenQuickActionWithOptions:(NSDictionary *)launchOptions;
+ (void)excuteActionWithItem:(UIApplicationShortcutItem *)shortcutItem;

@end
