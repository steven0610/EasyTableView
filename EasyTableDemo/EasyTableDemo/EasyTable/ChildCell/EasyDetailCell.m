//
//  EasyDetailCell.m
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "EasyDetailCell.h"



@implementation EasyDetailCell
@SynthesizeDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor             = [UIColor clearColor];
        self.selectionStyle              = UITableViewCellSelectionStyleNone;
        self.topSeparatorLine.hidden = YES;
        self.bottomSeparatorLine.hidden = YES;
        self.arrowView.hidden = YES;
    }
    return self;
}


@end
