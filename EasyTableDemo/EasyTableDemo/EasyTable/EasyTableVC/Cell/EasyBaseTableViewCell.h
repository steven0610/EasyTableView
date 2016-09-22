//
//  EasyBaseTableViewCell.h
//  steven
//
//  Created by Steven on 15/9/11.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashedLineView.h"

@interface EasyBaseTableViewCell : UITableViewCell

@property (nonatomic) UIEdgeInsets topSeparatorLineInsets;
@property (nonatomic) UIEdgeInsets bottomSeparatorLineInsets;

@property (nonatomic) DashedLineView *topSeparatorLine;
@property (nonatomic) DashedLineView *bottomSeparatorLine;

@property (nonatomic) UIImageView *arrowView;

@end
