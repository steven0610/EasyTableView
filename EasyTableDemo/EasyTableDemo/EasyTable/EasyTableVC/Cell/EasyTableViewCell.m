//
//  EasyTableViewCell.m
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#define Cell_Defatult_Height 50.0f

#import "EasyTableViewCell.h"

@implementation EasyTableViewCell
@SynthesizeEasyProp;


+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    return Cell_Defatult_Height;
}


@end
