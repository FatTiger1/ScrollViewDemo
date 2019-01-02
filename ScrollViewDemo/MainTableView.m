//
//  MainTableView.m
//  ScrollViewDemo
//
//  Created by default on 2019/1/2.
//  Copyright © 2019 default. All rights reserved.
//

#import "MainTableView.h"

@interface MainTableView ()<UIGestureRecognizerDelegate>

@end

@implementation MainTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
