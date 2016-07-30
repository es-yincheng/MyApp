//
//  YCNavigationController.m
//  MyApp
//
//  Created by 尹成 on 16/7/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "YCNavigationController.h"

@interface YCNavigationController ()

@end

@implementation YCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigation  backItem
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:@selector(goBackFromThisViewController)];
    
    //color
    [self.navigationBar setBackgroundImage:[self drawImageWithSize:CGSizeMake(ScreenWith, 64) color:[UIColor flatNavyBlueColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor flatWhiteColor];
    
    //leftItem,rightItem color
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    //title color
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    
    //statubar backcolor
    UIView *statusBackView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, ScreenWith, 20)];
    statusBackView.backgroundColor = [UIColor flatNavyBlueColor];
    [self.navigationBar addSubview:statusBackView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)goBackFromThisViewController{
    [self popViewControllerAnimated:YES];
}

@end
