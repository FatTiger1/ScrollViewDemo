//
//  MainCell.h
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainCell : UITableViewCell
@property(nonatomic, copy)void(^pageChangedBlock)(NSInteger selectedIndex);
//cell内部VC是否能滚动
@property(nonatomic, assign)BOOL cellCanScroll;
//能否内部刷新，（是否达到时机，外部tableview.contentoffset.y==0）
@property(nonatomic, assign)BOOL isRefresh;
//使内部vc滚动到顶部
- (void)scrollToTop;

@end

NS_ASSUME_NONNULL_END
