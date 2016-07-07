//
//  HomeViewController.m
//  MyApp
//
//  Created by 尹成 on 16/7/6.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeViewController.h"
#import "QRcodeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)scanQRAction:(id)sender {
    QRcodeViewController *vc = [[QRcodeViewController alloc] init];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nv animated:YES completion:nil];
}

@end
