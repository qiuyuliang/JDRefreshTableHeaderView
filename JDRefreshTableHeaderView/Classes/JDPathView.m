//
//  JDPathView.m
//  JDRefreshTableHeaderView
//
//  Created by 邱 育良 on 15/3/8.
//  Copyright (c) 2015年 Qiu Yuliang. All rights reserved.
//

#import "JDPathView.h"

@implementation JDPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGFloat progress = (M_PI * 10 / 4 + 15 + M_PI * 20 / 2 + 20) * self.progress;
    if (progress >= 0 && progress <= M_PI * 10 / 4) {
        CGContextAddArc(context, 5, 20, 5, M_PI/2, M_PI/2 - progress/(M_PI * 10 /4), 1);
    } else if (progress <= M_PI * 10 / 4 + 15){
        CGContextAddArc(context, 5, 20, 5, M_PI/2, 0, 1);
        CGContextAddLineToPoint(context, 10, 20 - 20 * (progress - M_PI * 10 / 4)/(M_PI * 10 /4 + 15));//20-5
    } else if (progress <= M_PI * 10 / 4 + 15 + M_PI * 20 / 4){
        CGContextAddArc(context, 5, 20, 5, M_PI/2, 0, 1);
        CGContextAddLineToPoint(context, 10, 5);
        CGContextMoveToPoint(context, 15, 25);
        CGContextAddArc(context, 15, 15, 10, M_PI/2, M_PI/2 - M_PI/2 * (progress - M_PI * 10 / 4 - 15)/(M_PI * 20 / 4), 1);
    } else if (progress <= M_PI * 10 / 4 + 15 + M_PI * 20 / 2) {
        CGContextAddArc(context, 5, 20, 5, M_PI/2, 0, 1);
        CGContextAddLineToPoint(context, 10, 5);
        CGContextMoveToPoint(context, 15, 25);
        CGContextAddArc(context, 15, 15, 10, M_PI/2, 0, 1);
        CGContextAddArc(context, 15, 15, 10, 2 * M_PI, 2 * M_PI - 1 * M_PI / 2 * (progress - M_PI * 10 / 4 - 15 - M_PI * 20 / 4)/(M_PI * 20 / 4), 1);
    } else {
        CGContextAddArc(context, 5, 20, 5, M_PI/2, 0, 1);
        CGContextAddLineToPoint(context, 10, 5);
        CGContextMoveToPoint(context, 15, 25);
        CGContextAddArc(context, 15, 15, 10, M_PI/2, M_PI * 3 / 2, 1);
        CGContextAddLineToPoint(context, 15, 5 + (progress - M_PI * 10 / 4 - 15 - M_PI * 20 / 2));
    }
    CGContextStrokePath(context);
}


@end
