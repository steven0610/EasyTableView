//
//  EasyBaseTableViewCell.m
//  steven
//
//  Created by Steven on 15/9/11.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "EasyBaseTableViewCell.h"
#import "DashedLineView.h"
#import "UIView+Sizes.h"

#define EasyArrowImg @"easy_arrow"

@implementation EasyBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _topSeparatorLineInsets = UIEdgeInsetsZero;
        _bottomSeparatorLineInsets = UIEdgeInsetsZero;
        _topSeparatorLine = [[DashedLineView alloc]initWithFrame:CGRectMake(0, 0, self.width, 1 / [UIScreen mainScreen].scale)];
        _topSeparatorLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _topSeparatorLine.dash = NO;
        _topSeparatorLine.hidden = YES;
        [self.contentView addSubview:_topSeparatorLine];
        _bottomSeparatorLine = [[DashedLineView alloc]initWithFrame:CGRectMake(0, self.height -  1 / [UIScreen mainScreen].scale, self.width, 1 / [UIScreen mainScreen].scale)];
        _bottomSeparatorLine.dash = NO;
        _bottomSeparatorLine.hidden = YES;
        _bottomSeparatorLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:_bottomSeparatorLine];
        _arrowView       = [[UIImageView alloc] initWithImage:[UIImage imageNamed:EasyArrowImg]];
        _arrowView.right = self.contentView.width - 15.0f;
        _arrowView.centerY = self.height / 2;
        
        _arrowView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
        | UIViewAutoresizingFlexibleBottomMargin
        | UIViewAutoresizingFlexibleLeftMargin;
        
        _arrowView.image = [UIImage imageNamed:EasyArrowImg];
        _arrowView.hidden = YES;
        [self.contentView addSubview:_arrowView];
        
    }
    return self;
}

- (void)setTopSeparatorLineInsets:(UIEdgeInsets)topSeparatorLineInsets
{
    _topSeparatorLineInsets = topSeparatorLineInsets;
    CGRect frame = _topSeparatorLine.frame;
    frame.origin.x = _topSeparatorLineInsets.left;
    frame.size.width -= _topSeparatorLineInsets.left + _topSeparatorLineInsets.right;
    _topSeparatorLine.frame = frame;
}

- (void)setBottomSeparatorLineInsets:(UIEdgeInsets)bottomSeparatorLineInsets
{
    _bottomSeparatorLineInsets = bottomSeparatorLineInsets;
    CGRect frame = _bottomSeparatorLine.frame;
    frame.origin.x = _bottomSeparatorLine.left;
    frame.size.width -= _bottomSeparatorLineInsets.left + _bottomSeparatorLineInsets.right;
    _bottomSeparatorLine.frame = frame;
}
@end
