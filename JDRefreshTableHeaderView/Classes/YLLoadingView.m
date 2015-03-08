//
//  YLLoadingView.m
//  JDRefreshTableHeaderView
//
//  Created by 邱 育良 on 15/3/8.
//  Copyright (c) 2015年 Qiu Yuliang. All rights reserved.
//

#import "YLLoadingView.h"
#define DegreesToRadians(degrees) ((degrees) * M_PI / 180)
#define RadiansToDegrees(radians) ((radians) * 180 / M_PI)
@interface YLLoadingView ()
{
    BOOL _down;
}
@property (nonatomic, assign) NSInteger progress;
@property (nonatomic, assign) NSTimer *timer;
@end

@implementation YLLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.progress = 320;
        _down = YES;
    }
    return self;
}

- (void)drawPath:(NSTimer *)timer
{
    if (self.progress == 320) {
        _down = YES;
    } else if (self.progress == 0) {
        _down = NO;
    }
    if (_down) {
        self.progress --;
    } else {
        self.progress ++;
    }
    
    [self setNeedsDisplay];
}

- (void)startRotateAnimation
{
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(drawPath:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.z";
    animation.duration = 1;
    animation.fromValue = @(0);
    animation.toValue  = @(2 * M_PI);
    animation.repeatCount = 1000;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"rotate"];
}

- (void)stopRotateAnimation
{
    [self.timer invalidate];
    self.timer = nil;
    self.progress = 0;
    [self setNeedsDisplay];
    [self.layer removeAnimationForKey:@"rotate"];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.color) {
        CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    } else {
        CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    }
    if (self.lineWidth && self.lineWidth > 0) {
        CGContextSetLineWidth(context, self.lineWidth);
    } else {
        CGContextSetLineWidth(context, 1);
    }
    
    CGContextAddArc(context, rect.size.width/2.0, rect.size.width/2.0, rect.size.width/2.0 - 1, DegreesToRadians(0), DegreesToRadians(self.progress), 0);
    CGContextStrokePath(context);
}


@end
