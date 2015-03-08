//
//  YLLoadingView.h
//  JDRefreshTableHeaderView
//
//  Created by 邱 育良 on 15/3/8.
//  Copyright (c) 2015年 Qiu Yuliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLLoadingView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWidth;
- (void)startRotateAnimation;
- (void)stopRotateAnimation;
@end
