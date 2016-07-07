//
//  QRStringShowController.m
//  MyApp
//
//  Created by 尹成 on 16/7/7.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "QRStringShowController.h"

@interface QRStringShowController ()

@property (weak, nonatomic) IBOutlet YCLable *qrStringLb;
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation QRStringShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationItem];
}

- (void)viewWillAppear:(BOOL)animated{
    [self showQRString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - custom
- (void)setNavigationItem{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"qrcode_scan_titlebar_back_nor"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(disMissAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)showQRString{
    if ([_QRString isUrlString]) {
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_QRString]];
        [self.webView loadRequest:request];
    } else if ([_QRString hasUrlString]){
        _qrStringLb.text = _QRString;
    } else {
        _qrStringLb.text = _QRString;
    }
}

#pragma mark - action
- (void)disMissAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - lazy
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:ScreenSizeWithOutNav];
        [self.view addSubview:_webView];
    }
    return _webView;
}

@end
