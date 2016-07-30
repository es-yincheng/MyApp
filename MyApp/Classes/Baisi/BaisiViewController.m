//
//  BaisiViewController.m
//  MyApp
//
//  Created by 尹成 on 16/7/15.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaisiViewController.h"
#import "BaisiCell.h"
#import "BaisiModel.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefreshFooter.h"

@interface BaisiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger       lastIndex;

@end

@implementation BaisiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lastIndex = 0;
    
    [self getMoreData];
    [self setTableView];
}

- (void)getMoreData{
    [[BaseAPI sharedAPI].baisiService getItemsFrom:_lastIndex to:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *items = [BaisiModel yc_objectWithKeyValues:responseObject];
        if ([BaisiModel yc_getLastIndex:responseObject] > 0) {
            _lastIndex = [BaisiModel yc_getLastIndex:responseObject];
        }
        [self.dataSource yc_addObjectsFromArray:items];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - custom
- (void)loadNewData{
    _lastIndex = 0;
    [self getMoreData];
}

- (void)setTableView{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 110;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.scrollsToTop = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BaisiCell" bundle:nil] forCellReuseIdentifier:@"BaisiCell"];
    
    _tableView.mj_header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];

}

#pragma mark - delegate/dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaisiCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BaisiCell"];
    [cell configWithModel:[self.dataSource yc_objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"[self.dataSource yc_objectAtIndex:indexPath.row]:%@",[self.dataSource yc_objectAtIndex:indexPath.row]);
}

#pragma mark - lazy
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
