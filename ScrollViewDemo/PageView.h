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

@property(nonatomic, strong)NSMutableArray * viewControllers;

@property (nonatomic, copy) void (^pageChangedBlock)(NSInteger selectedIndex);

@end

NS_ASSUME_NONNULL_END
