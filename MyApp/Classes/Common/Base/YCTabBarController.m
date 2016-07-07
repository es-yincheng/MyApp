//
//  YCTabBarController.m
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YCTabBarController.h"
#import "HomeViewController.h"

NSString *HomeTitle = @"首页";

@interface YCTabBarController ()

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        [self setViewControllers:@[homeNavigationController]];
    }
    return self;
}


@end
