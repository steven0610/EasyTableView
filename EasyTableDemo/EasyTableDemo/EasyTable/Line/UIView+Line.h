//
//  UIView+Line.h
//  steven
//
//  Created by Steven on 15/9/1.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashedLineView.h"


@interface UIView(Line)

- (DashedLineView *)addLine:(CGRect)frame;
- (DashedLineView *)addLine:(CGRect)frame style:(DashLineDirection)style dash:(BOOL)dash;

@end
