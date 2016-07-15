//
//  BaisiViewController.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiViewController.h"
#import "BaisiImageCell.h"
#import "BaisiModel.h"

@interface BaisiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation BaisiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getMoreData];
    [self setTableView];
}

- (void)getMoreData{
    [[BaseAPI sharedAPI].baisiService getItemsFrom:nil to:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *items = [BaisiModel yc_objectWithKeyValues:responseObject];
        [self.dataSource yc_addObjectsFromArray:items];
        [self.tableView reloadData];
//        NSLog(@"item：\n\n%@\n\n\n",[items yc_objectAtIndex:0]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setTableView{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 110;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.scrollsToTop = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BaisiImageCell" bundle:nil] forCellReuseIdentifier:@"BaisiImageCell"];
    
//    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        pageIndex = 1;
//        [self.showedIndexPaths removeAllObjects];
//        [self getMoreData];
//    }];
//    
//    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
//    [footer setTitle:@" " forState:MJRefreshStateIdle];
//    [footer setTitle:@"无更多数据" forState:MJRefreshStateNoMoreData];
//    _tableView.mj_footer = footer;

}

#pragma mark - delegate/dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaisiImageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BaisiImageCell"];
    [cell configWithModel:[self.dataSource yc_objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark - lazy
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
