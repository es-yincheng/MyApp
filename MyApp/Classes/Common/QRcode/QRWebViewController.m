//
//  QRWebViewController.m
//  MyApp
//
//  Created by 尹成 on 16/7/7.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "QRWebViewController.h"

@interface QRWebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation QRWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationItem];
}

- (void)viewWillAppear:(BOOL)animated{
     NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - action
- (void)goBackAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - custom
- (void)setNavigationItem{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"qrcode_scan_titlebar_back_nor"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(goBackAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - delegate


#pragma mark - lazy 
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        self.view = _webView;
    }
    return _webView;
}

@end
