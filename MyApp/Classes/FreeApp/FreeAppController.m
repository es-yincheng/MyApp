//
//  FreeAppController.m
//  MyApp
//
//  Created by 尹成 on 16/7/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "FreeAppController.h"
#import "ZLCustomeSegmentControlView.h"

@interface FreeAppController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FreeAppController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatBlueColorDark];
    self.title = @"限免";
    
    ZLCustomeSegmentControlView *v = [[ZLCustomeSegmentControlView alloc] init];
    
    v.titles = @[@"热门", @"最新", @"排名"];
    v.duration = 0.7f;
    
    [v setButtonOnClickBlock:^(NSInteger tag, NSString *title) {
        NSLog(@"index = %ld, title = %@", (long)tag, title);
    }];
    
    v.frame = CGRectMake(0, 0, ScreenWith, 50);
    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - setUI
- (void)setTableView{
    
    [_tableView registerNib:[UINib nibWithNibName:@"FreeAppCell" bundle:nil] forCellReuseIdentifier:@"FreeAppCell"];
}

@end
