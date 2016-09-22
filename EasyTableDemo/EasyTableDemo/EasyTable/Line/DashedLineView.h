//
//  DashedLineView.h
//  steven
//
//  Created by Steven on 15/9/1.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DashLineDirection)
{
    DashLineHorizontal,
    DashLineVertical
};

@interface DashedLineView : UIView

@property (nonatomic) DashLineDirection direction;
@property (nonatomic, getter=isDash) BOOL dash;
@property (nonatomic) const CGFloat *bezierPattern;
@property (nonatomic, assign) NSInteger bezierPatternCount;
@property (nonatomic, strong) UIColor *lineColor;

@end
