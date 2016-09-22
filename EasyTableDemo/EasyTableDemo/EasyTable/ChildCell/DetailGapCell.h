//
//  DetailGapCell.h
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "EasyDetailCell.h"


typedef NS_ENUM(NSInteger, GapType) {
    GapTypeNone=0,           // 上下都没有线(默认)
    GapTypeTop,              // 上面有线
    GapTypeBottom,           // 下面有线
    GapTypeBoth              // 上下都有线
};

@interface DetailGapCell : EasyDetailCell

@end
