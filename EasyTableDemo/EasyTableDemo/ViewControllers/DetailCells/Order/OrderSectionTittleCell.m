//
//  OrderSectionTittleCell.m
//  steven
//
//  Created by steven on 15/9/25.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "OrderSectionTittleCell.h"

#define kTopPading 12.0f
#define Cell_Height 38.0f


#define TittleLabel_FONT [UIFont systemFontOfSize:14.0f]
#define TittleLabel_TEXTCOLOR UIColorFromRGB(0x000000)

@interface OrderSectionTittleCell ()
{
    UILabel* tittleLabel;

}
@end

@implementation OrderSectionTittleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.bottomSeparatorLine.hidden = NO;
        self.topSeparatorLine.hidden = NO;
        self.bottomSeparatorLine.left = kLeftPading;
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    tittleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kLeftPading, kTopPading, 100, 12)];
    tittleLabel.font = [UIFont systemFontOfSize:15.0f];
    tittleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:tittleLabel];
    tittleLabel.centerY = Cell_Height/2;
}


- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    [super refreshWithData:data userInfo:userInfo atIndexPath:indexPath];
    
    [tittleLabel fitText:(NSString*)data];
}



+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    return Cell_Height;
}


@end
