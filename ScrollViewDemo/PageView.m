//
//  PageView.m
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import "PageView.h"
#import "SubViewController.h"

@interface PageView()

@property(nonatomic, strong)UILabel * topLabel;
@property(nonatomic, strong)UIScrollView * topTabScrollView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, assign)NSInteger currentPage;
@property(nonatomic, weak)UIViewController * viewController;
@property(nonatomic, strong)NSMutableArray * viewControllers;


@end


@implementation PageView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.viewControllers = @[].mutableCopy;
        [self setUpWithFrame:frame];
    }
    return self;
}

- (void)setUpWithFrame:(CGRect)frame{
    self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.text = @"标题";
    self.topLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.topLabel];
    SubViewController * subViewController = [[SubViewController alloc] init];
    [self.viewControllers addObject:subViewController];
    subViewController.view.frame = CGRectMake(0, 30, frame.size.width, frame.size.height-30);
    [self addSubview:subViewController.view];
}

@end
