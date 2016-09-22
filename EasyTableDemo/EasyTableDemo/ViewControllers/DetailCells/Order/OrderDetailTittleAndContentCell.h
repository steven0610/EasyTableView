//
//  OrderDetailTittleAndContentCell.h
//  Steven
//
//  Created by steven on 15/9/25.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "OrderDetailCell.h"

#define kRightPading 16.0f
#define kTopPading 10.0f
#define Cell_Height 32.0f

#define TittleLabel_FONT [UIFont systemFontOfSize:14.0f]
#define TittleLabel_TEXTCOLOR UIColorFromRGB(0x555555)
#define ContentLabel_FONT_SIZE 14.0f
#define ContentLabel_FONT [UIFont systemFontOfSize:ContentLabel_FONT_SIZE]
#define ContentLabel_TEXTCOLOR UIColorFromRGB(0x555555)

@interface OrderDetailTittleAndContentCell : OrderDetailCell
{
    UILabel* tittleLabel;
    UILabel* contentLabel;
}
-(void)setupUI;
- (void)setupContent;
+ (CGFloat)computeStringHeight:(NSString*)str;
@end
