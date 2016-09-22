//
//  OrderDetailWhiteGapCell.m
//  steven
//
//  Created by LWX on 15/10/8.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "OrderDetailWhiteGapCell.h"

#define Cell_Default_Height 10.0f
@implementation OrderDetailWhiteGapCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    if (data) {
        CGFloat height = [((NSNumber*)data) floatValue];
        return height;
    }
    
    return Cell_Default_Height;
}

- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath{}

@end
