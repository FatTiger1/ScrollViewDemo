//
//  SubViewController.m
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSMutableArray * dataSource;
@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    MJWeakSelf
//    __weak SubViewController * weakSelf = self;
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf requestData];
//    }];
    MJRefreshBackNormalFooter * refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf requestMoreData];
    }];
    refreshFooter.stateLabel.hidden = YES;
    self.tableView.mj_footer = refreshFooter;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.vcCanScroll) {//当前不能g滚动
        if (self.isRefresh) {
            return;
        }
//   scrollView.contentOffset = CGPointZero;
    }

    if (scrollView.contentOffset.y <=0) {
//        self.vcCanScroll = NO;
//        scrollView.contentOffset = CGPointZero;
//        //通知父视图改变状态
    }
}

- (void)requestData{
    self.dataSource = @[].mutableCopy;
    for (int i = 0; i < 8; i ++) {
        [self.dataSource addObject:@""];
    }
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)requestMoreData{
    for (int i = 0; i < 8; i ++) {
        [self.dataSource addObject:@""];
    }
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}


@end
