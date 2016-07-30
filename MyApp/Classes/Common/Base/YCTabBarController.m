//
//  YCTabBarController.m
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YCTabBarController.h"
#import "HomeViewController.h"
#import "BaisiViewController.h"
#import "FreeAppController.h"

NSString *HomeTitle = @"首页";
NSString *BaisiTitle = @"百思";

@interface YCTabBarController ()

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor flatNavyBlueColor];
//    self.tabBar.selectionIndicatorImage = [self buttonImageFromColor:RGBCOLOR(185, 74, 62)];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        HomeViewController *homeViewController = [[HomeViewController alloc] init];
        UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        homeNavigationController.title = HomeTitle;
        
        BaisiViewController *baisiVC = [[BaisiViewController alloc] init];
        UINavigationController *baisiNV = [[UINavigationController alloc] initWithRootViewController:baisiVC];
        baisiNV.title = BaisiTitle;
        
        FreeAppController *freeAppController = [[FreeAppController alloc] init];
        YCNavigationController *freeNV = [[YCNavigationController alloc] initWithRootViewController:freeAppController];
        freeNV.title = @"限免";
        
        [self setViewControllers:@[homeNavigationController,baisiNV,freeNV]];
    }
    return self;
}


@end
