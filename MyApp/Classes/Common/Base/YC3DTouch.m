//
//  YC3DTouch.m
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YC3DTouch.h"

NSString *YCShortItemTypeScan;
NSString *YCShortItemTypeMyInfo;

@implementation YC3DTouch

+ (BOOL)isAvailable{
    
    return YES;
}

+ (BOOL)setHomeScreenQuickActionWithOptions:(NSDictionary *)launchOptions {

    //创建应用图标上的3D touch快捷选项
    [self creatShortcutItem];
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (shortcutItem) {
        NSLog(@"---------:%@",shortcutItem.type);
        [self excuteActionWithItem:shortcutItem];
        return NO;
    }
    return YES;
}

//创建应用图标上的3D touch快捷选项
+ (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];

    //    //创建自定义图标的icon
    //    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"分享.png"];
    
    //创建快捷选项
    UIApplicationShortcutItem *scanitem = [[UIApplicationShortcutItem alloc] initWithType:YCShortItemTypeScan
                                                                        localizedTitle:@"扫描"
                                                                     localizedSubtitle:@"扫描二维码"
                                                                                  icon:icon
                                                                              userInfo:nil];
    
    UIApplicationShortcutIcon *infoicon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeUpdate];
    UIApplicationShortcutItem * infoitem = [[UIApplicationShortcutItem alloc] initWithType:YCShortItemTypeMyInfo
                                                                        localizedTitle:@"我的"
                                                                     localizedSubtitle:@"我的二维码"
                                                                                  icon:infoicon
                                                                              userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[scanitem,infoitem];
}

+ (void)excuteActionWithItem:(UIApplicationShortcutItem *)shortcutItem{
    //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
    if([shortcutItem.type isEqualToString:YCShortItemTypeScan]){

    } else if ([shortcutItem.type isEqualToString:YCShortItemTypeMyInfo]){
        
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]){

    }
}

@end
