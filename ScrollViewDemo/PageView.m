//
//  PageView.m
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import "PageView.h"
#import "SubViewController.h"
static int TopButtonTag = 100;
@interface PageView()<UIScrollViewDelegate>
@property(nonatomic, assign)CGRect selfFrame;
@property(nonatomic, strong)UIScrollView * topTabScrollView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, assign)NSInteger currentPage;
@property(nonatomic, weak)UIViewController * viewController;

@property(nonatomic, strong)NSArray * titles;//标题
@property(nonatomic, assign)CGFloat topButtonWidth;//顶部按钮宽度
@property(nonatomic, assign)CGFloat headHeight;//头视图高度
@property(nonatomic, strong)UIButton * currentButton;


@end


@implementation PageView
- (id)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers titles:(NSArray *)titles headHeight:(CGFloat)headHeight{
    if (self = [super initWithFrame:frame]) {
        self.viewControllers = controllers;
        self.titles = titles;
        self.selfFrame = frame;
        [self initData];
        [self setUp];
    }
    return self;
}

- (void)initData{
    self.topButtonWidth = SCREENWIDTH/3;
}

- (void)setUp{
    [self addSubview:self.topTabScrollView];
    [self addSubview:self.scrollView];
}

- (UIScrollView *)topTabScrollView{
    if (!_topTabScrollView) {
        _topTabScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.selfFrame.size.width, 45)];
        _topTabScrollView.showsHorizontalScrollIndicator = NO;
        _topTabScrollView.backgroundColor = [UIColor whiteColor];
        _topTabScrollView.contentSize = CGSizeMake(self.topButtonWidth * self.titles.count, 0);
        for (int i = 0 ; i < self.titles.count; i ++) {
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(i * self.topButtonWidth, 0, self.topButtonWidth, _topTabScrollView.mj_h)];
            button.tag = TopButtonTag + i;
            [button setTitle:self.titles[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(titleOnclick:) forControlEvents:UIControlEventTouchUpInside];
            [_topTabScrollView addSubview:button];
            if (i == 0) {
                button.selected = YES;
                self.currentButton = button;
            }
        }
    }
    return _topTabScrollView;
}

- (void)titleOnclick:(UIButton *)button{
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
    self.currentPage = button.tag - TopButtonTag;
}

- (void)setCurrentPage:(NSInteger)currentPage{
    __block PageView * weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.scrollView.contentOffset = CGPointMake(weakSelf.scrollView.mj_w*currentPage, 0);
    }];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _topTabScrollView.mj_h, self.selfFrame.size.width,self.selfFrame.size.height - _topTabScrollView.mj_h)];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(self.selfFrame.size.width * self.viewControllers.count, 0);
        for (int i = 0; i < self.viewControllers.count; i ++) {
            SubViewController * viewController = self.viewControllers[i];
            [viewController setFrameWith:CGRectMake(self.selfFrame.size.width * i, 0, self.selfFrame.size.width, _scrollView.mj_h)];
            [_scrollView addSubview:viewController.view];
        }
    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollView.mj_offsetX / scrollView.mj_w;
    UIButton * button = [self viewWithTag:TopButtonTag + page];
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
}



@end
