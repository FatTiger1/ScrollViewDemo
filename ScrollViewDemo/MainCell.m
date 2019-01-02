//
//  MainCell.m
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import "MainCell.h"
#import "PageView.h"
#import "SubViewController.h"

@interface MainCell ()
@property(nonatomic, strong)PageView * pageView;

@end

@implementation MainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.pageView = [[PageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.contentView addSubview:self.pageView];
}

- (void)scrollToTop{
    [self.pageView.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SubViewController * subViewController = (SubViewController *)obj;
        [subViewController scrollToTop];
    }];
}

- (void)setCellCanScroll:(BOOL)cellCanScroll{
    _cellCanScroll = cellCanScroll;
    [self.pageView.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SubViewController * subViewController = (SubViewController *)obj;
        subViewController.vcCanScroll = cellCanScroll;
        if (!cellCanScroll) {
            subViewController.tableView.contentOffset = CGPointZero;
        }
    }];
}

- (void)setIsRefresh:(BOOL)isRefresh{
    _isRefresh = isRefresh;
    [self.pageView.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SubViewController * subViewController = (SubViewController *)obj;
        subViewController.isRefresh = isRefresh;
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
