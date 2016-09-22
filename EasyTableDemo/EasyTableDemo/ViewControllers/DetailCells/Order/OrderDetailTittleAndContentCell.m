//
//  OrderDetailTittleAndContentCell.m
//  Steven
//
//  Created by steven on 15/9/25.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "OrderDetailTittleAndContentCell.h"

@interface OrderDetailTittleAndContentCell ()
@end


@implementation OrderDetailTittleAndContentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
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
    
    [self setupContent];
    
    self.bottomSeparatorLine.left = 15;

}

- (void)setupContent
{
    contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(kLeftPading, kTopPading, 100, 12)];
    contentLabel.font = [UIFont systemFontOfSize:15.0f];
    contentLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:contentLabel];
    contentLabel.centerY = tittleLabel.centerY;
}


- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    
    [super refreshWithData:data userInfo:userInfo atIndexPath:indexPath];
    
    NSDictionary* dic = (NSDictionary*)data;
    
    NSArray* allKeys = [dic allKeys];
    
    NSString* tittleStr = [allKeys objectAtIndex:0];
    NSString* contentStr = [dic objectForKey:tittleStr];

    [tittleLabel fitText:tittleStr];
    [contentLabel fitText:contentStr];
    contentLabel.numberOfLines = 0;
    contentLabel.width = (SCREEN_WIDTH - 2 * kRightPading) * 2 /3;
    [contentLabel heightToFit];
//    CGFloat labelH = contentLabel.height;
//    NSInteger lineCount = labelH/contentLabel.font.lineHeight;
//    contentLabel.textAlignment = lineCount > 1 ? NSTextAlignmentLeft: NSTextAlignmentRight;
    contentLabel.textAlignment = NSTextAlignmentRight;
    contentLabel.right = SCREEN_WIDTH - kRightPading;
    contentLabel.top = tittleLabel.top;
    
    
}



+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = Cell_Height;
    if (data) {

        NSDictionary *dict = (NSDictionary *)data;
        NSString *key = dict.allKeys[0];
        if (dict[key])
        {
            NSString *str = dict[key];
            CGFloat height = [self computeStringHeight:str];
            cellHeight = cellHeight + height - ContentLabel_FONT_SIZE - 2;
        }
        
    }
    return cellHeight;
}

+ (CGFloat)computeStringHeight:(NSString*)str {
    if (str) {
        if ([str isKindOfClass:[NSString class]]) {
            return [str boundingRectWithSize:CGSizeMake((SCREEN_WIDTH - 2 * kRightPading) * 2 /3, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:ContentLabel_FONT} context:nil].size.height;
        }
        
    }
    return 0;
}
@end
