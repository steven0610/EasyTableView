//
//  DetailBaseCell.h
//  EasyTableDemo
//
//  Created by steven yang on 16/9/21.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "EasyDetailCell.h"


@class TelephoneDetailCell;
@protocol TeleponeDetailCellDelegate <EasyTableViewCellDelegate>

@optional
- (void)DetailCell:(TelephoneDetailCell *)cell callWithData:(id)data;
@end


@interface DetailBaseCell : EasyDetailCell

@property(nonatomic,weak)id<TeleponeDetailCellDelegate> delegate;

@end
