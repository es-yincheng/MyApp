
//
//  UILabel+Custom.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/5.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "UILabel+Custom.h"
#import <objc/runtime.h>

@implementation UILabel (Custom)

/**
 *每个NSObject的子类都会调用下面这个方法 在这里将init方法进行替换，使用我们的新字体
 *如果在程序中又特殊设置了字体 则特殊设置的字体不会受影响 但是不要在Label的init方法中设置字体
 *从init和initWithFrame和nib文件的加载方法 都支持更换默认字体
 */
//+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"self:%@",NSStringFromClass([self class]));
//        /**
//         init
//         */
//        Method oldinit = class_getInstanceMethod(NSClassFromString(@"UILabel"), @selector(init));
//        Method newinit = class_getInstanceMethod(self, @selector(yc_init));
//        if (!oldinit || !newinit) {
//            return;
//        }
//        method_exchangeImplementations(oldinit, newinit);
//        
//        /**
//         initWithFrame
//         */
//        Method oldinitWithFrame = class_getInstanceMethod(NSClassFromString(@"UILabel"), @selector(initWithFrame:));
//        Method newinitWithFrame = class_getInstanceMethod(self, @selector(yc_initWithFrame:));
//        if (!oldinitWithFrame || !newinitWithFrame) {
//            return;
//        }
//        method_exchangeImplementations(oldinitWithFrame, newinitWithFrame);
//        
//        Method oldawakeFromNib = class_getInstanceMethod(NSClassFromString(@"UILabel"), @selector(awakeFromNib));
//        Method newawakeFromNib = class_getInstanceMethod(self, @selector(yc_awakeFromNib));
//        if (!oldawakeFromNib || !newawakeFromNib) {
//            return;
//        }
//        method_exchangeImplementations(oldawakeFromNib, newawakeFromNib);
//        
//    });
//}
//
//- (instancetype)yc_init{
//    id _self = [self yc_init];
//    UIFont *font = [UIFont systemFontOfSize:13];
//    if (font) {
//        self.font = font;
//    }
//    return _self;
//}
//
//- (instancetype)yc_initWithFrame:(CGRect)frame{
//    id _self = [self yc_initWithFrame:frame];
//    UIFont *font = [UIFont systemFontOfSize:13];
//    if (font) {
//        self.font = font;
//    }
//    return _self;
//}
//
//- (void)yc_awakeFromNib{
//    [self yc_awakeFromNib];
//    UIFont *font = [UIFont systemFontOfSize:13];
//    if (font) {
//        self.font = font;
//    }
//}


@end
