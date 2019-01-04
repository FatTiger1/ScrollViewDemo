//
//  PageView.h
//  ScrollViewDemo
//
//  Created by default on 2018/12/28.
//  Copyright © 2018 default. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageView : UIScrollView

@property (nonatomic, copy) void (^pageChangedBlock)(NSInteger selectedIndex);
@property(nonatomic, strong)NSArray * viewControllers;//控制器数组
- (id)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers titles:(NSArray *)titles headHeight:(CGFloat)headHeight;

@end

NS_ASSUME_NONNULL_END
