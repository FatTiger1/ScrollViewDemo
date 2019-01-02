//
//  SubViewController.h
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubViewController : UIViewController
@property(nonatomic,copy)NSString * parameter;
@property(nonatomic,copy)NSString * controllerTitle;
@property(nonatomic,strong)UITableView * tableView;
//vc是否能滚动
@property(nonatomic,assign)BOOL vcCanScroll;
//能否内部刷新，（是否达到时机，外部tableview.contentOffset.y ==0）
@property(nonatomic,assign)BOOL isRefresh;

- (void)scrollToTop;
- (void)setFrameWith:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
