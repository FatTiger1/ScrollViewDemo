//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, strong)UIView * headView;
@property(nonatomic, strong)MainCell * contentCell;
//页面是否可以d滚动
@property(nonatomic,assign)BOOL canScroll;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registNotification];
    [self setUp];
}

- (void)registNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
}

- (void)changeScrollStatus{//改变主视图状态
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

- (void)setUp{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.mj_w, self.view.mj_h) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = self.view.mj_h - 200;
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.headView.backgroundColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = self.headView;
    [self.view addSubview:self.tableView];
    MJWeakSelf
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView.mj_header endRefreshing];
        });
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contentCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!self.contentCell) {
        self.contentCell = [[MainCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        self.contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        MJWeakSelf
        [self.contentCell setPageChangedBlock:^(NSInteger selectedIndex) {
            
            [weakSelf scrollViewDidScroll:tableView];
        }];
    }
    self.contentCell.contentView.backgroundColor = [UIColor orangeColor];
    return self.contentCell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView == self.tableView) {
//        CGFloat h = self.tableView.tableHeaderView.mj_h;
//        //告知视图能否滚动，fabs处理偏移量和头部高 无法绝对精确，而导致某些手机下滚动问题
//        if (fabs(scrollView.contentOffset.y -h) <= 0.5) {//滚动距离为headView高度的那一刻
//            if (self.canScroll) {///能滚动
//                self.canScroll = NO;
//                self.contentCell.cellCanScroll = YES;
//            }else{
//                self.contentCell.cellCanScroll = YES;
//            }
//        }else{
//            if (!self.canScroll) {//子视图没有到顶
////                scrollView.contentOffset = CGPointMake(0, h);
//            }
//        }
//        //告知视图能否内部vc刷新
//        if (scrollView.contentOffset.y == 0) {
//            self.contentCell.isRefresh = YES;
//        }else{
//            self.contentCell.isRefresh = NO;
//        }
//    }
}

@end
