//
//  Macros.h
//  MyApp
//
//  Created by 尹成 on 16/7/7.
//  Copyright © 2016年 尹成. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])



//use dlog to print while in debug model
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#pragma mark - 设备类型
#define IsiPhone4     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark - 设备信息
#define Device_IOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]
#define Device_DEVICE_MODEL   [[UIDevice currentDevice] model]
#define Device_IS_IPAD        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define Device_isRetina       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define APP_NAME               [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_SUB_VERSION        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define Device_UDeviceIdentifier   [[UIDevice currentDevice] uniqueDeviceIdentifier]


#pragma mark - 常用宏定义
#define WEKSELF(weakSelf)          __weak __typeof(&*self)weakSelf = self;
#define UserDefaults              [NSUserDefaults standardUserDefaults]
#define NotificationCenter        [NSNotificationCenter defaultCenter]

#pragma mark - 图片资源获取
#define ImageNamed(_pointer)      [UIImage imageNamed:[UIUtil imageName:_pointer]]
#define ImageFromFile(file,ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]



#define kDegreesToRadian(x)         (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian)    (radian*180.0)/(M_PI)


#pragma mark - ios版本判断

#define isIOS5_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define isIOS6_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define isIOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define isIOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define isIOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
#define isIOS10_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending )

#pragma mark - 是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#pragma mark - 颜色
#define kCOLOR_RGB(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define kCOLOR_RGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#pragma mark - 定义字号
#define Font(X)             [UIFont systemFontSize:X]


//---------------------------size---------------------------------
#define ScreenWith   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define NVH         44
#define SBH         20
#define TBH         49
#define ScreenSizeWithOutBars   CGRectMake(0, 0, ScreenWith, ScreenHeight-64-49)
#define ScreenSizeWithOutNav    CGRectMake(0, 64, ScreenWith, ScreenHeight-64)

//---------------------------color---------------------------------
#define IBZItemColor       RGBCOLOR(216, 87, 77)

#define IBZBlackColor     [UIColor colorWithWhite:0.200 alpha:1.000]
#define IBZGrayColor      [UIColor colorWithWhite:0.400 alpha:1.000]
#define IBZLightGrayColor [UIColor colorWithWhite:0.600 alpha:1.000]

#define IBZButtonDisableColor   IBZLightGrayColor
#define IBZCellLineColor        [UIColor colorWithWhite:0.941 alpha:1.000]
#define IBZViewBackColor        IBZCellLineColor
//-----------------------------------------------------------------

#endif /* Macros_h */
