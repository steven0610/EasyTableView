//
//  OrderDetailGapCell.m
//  steven
//
//  Created by steven on 15/9/25.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "OrderDetailGapCell.h"
#import "DetailGapCell.h"
#define kGapCellHeight 12.f

@implementation OrderDetailGapCell
+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    if (data){
        CGFloat height = [((NSNumber*)data) floatValue];
        return height;
    }
    
    return kGapCellHeight;
}



@end
