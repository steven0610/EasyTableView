//
//  OrderDetailCell.h
//  steven
//
//  Created by steven on 15/9/25.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "EasyDetailCell.h"
#import "DetailGapCell.h"

#define kLeftPading 16.0f



#define ORDER_DETAIL_GAP_CELL                             @"OrderDetailGapCell"
#define ORDER_DETAIL_SECTION_TT_CELL                      @"OrderSectionTittleCell"
#define ORDER_DETAIL_TITTLE_CONTENT_CELL                  @"OrderDetailTittleAndContentCell"
#define ORDER_DETAIL_WITH_TEL_CELL                        @"OrderDetailWithTelCell"
#define ORDER_DETAIL_WHITE_GAP_CELL                       @"OrderDetailWhiteGapCell"
#define ORDER_DETAIL_THREE_LABLE_CELL                     @"OrderDetailThreeLabelCell"



@class DetailGapCell;
@protocol OrderDetailCellDelegate <EasyTableViewCellDelegate>
@optional
- (void)orderDetailCell:(DetailGapCell *)cell callWithData:(id)data;
@end



@interface OrderDetailCell : DetailGapCell

@property (nonatomic,weak)id <OrderDetailCellDelegate> delegate;
@end
