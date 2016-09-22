//
//  DashedLineView.m
//  steven
//
//  Created by Steven on 15/9/1.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "DashedLineView.h"

@implementation DashedLineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _dash = YES;
        _lineColor = [UIColor lightGrayColor];
        _bezierPattern = NULL;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = UIBezierPath.bezierPath;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    bezierPath.lineWidth = 2;
    [_lineColor setStroke];
    
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    if (_direction == DashLineHorizontal)
    {
        CGFloat width = rect.size.width;
        [bezierPath addLineToPoint:CGPointMake(width, 0)];
    }
    else if (_direction == DashLineVertical)
    {
        CGFloat height = rect.size.height;
        [bezierPath addLineToPoint:CGPointMake(0, height)];
    }

    if (_dash)// 设置虚线
    {
        if (_bezierPattern)
        {
            [bezierPath setLineDash:_bezierPattern count:_bezierPatternCount phase:0];
        }
        else
        {
            CGFloat bezierPattern[] = {4, 2};
            [bezierPath setLineDash:bezierPattern count:2 phase:0];
        }
    }
    
    [bezierPath stroke];
}

- (void)setDash:(BOOL)dash
{
    _dash = dash;
    
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    
    [self setNeedsDisplay];
}

@end
