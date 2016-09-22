//
//  UIView+Line.m
//  steven
//
//  Created by Steven on 15/9/1.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView(Line)

- (DashedLineView *)addLine:(CGRect)frame
{
    return [self addLine:frame style:DashLineHorizontal dash:NO];
}

- (DashedLineView *)addLine:(CGRect)frame style:(DashLineDirection)style dash:(BOOL)dash
{
    DashedLineView *line = [[DashedLineView alloc] initWithFrame:frame];
    line.dash = dash;
    line.direction = style;
    line.hidden = NO;
    [self addSubview:line];
    
    return line;
}

@end
