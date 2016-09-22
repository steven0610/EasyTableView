//
//  DetailGapCell.m
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "DetailGapCell.h"

@implementation DetailGapCell

#define Cell_Default_Height 10.0f
#define Cell_ClearBackgoundColor [UIColor clearColor]



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (CGFloat)cellHeightWithData:(id)data
                     userInfo:(NSDictionary *)userInfo
                  atIndexPath:(NSIndexPath *)indexPath
{
    if (data) {
        CGFloat height = [((NSNumber*)data) floatValue];
        return height;
    }
    
    return Cell_Default_Height;
}



- (void)refreshWithData:(id)data
               userInfo:(NSDictionary *)userInfo
            atIndexPath:(NSIndexPath *)indexPath
{
    
    [self clearCellConfigs];
    
    if (!userInfo) {
        [self setSeperatedTopLineHiden:YES BottomLineHiden:YES];
        return;
    }
    
    //cmd Line
    NSInteger style = [[userInfo valueForKey:@"style"] longValue];
    switch (style) {
        case GapTypeNone:
            [self setSeperatedTopLineHiden:YES BottomLineHiden:YES];
            break;
        case GapTypeTop:
            [self setSeperatedTopLineHiden:NO BottomLineHiden:YES];
            break;
        case GapTypeBottom:
            [self setSeperatedTopLineHiden:YES BottomLineHiden:NO];
            break;
        case GapTypeBoth:
            [self setSeperatedTopLineHiden:NO BottomLineHiden:NO];
            break;
        default:
            [self setSeperatedTopLineHiden:YES BottomLineHiden:YES];
            break;
    }
    
    //cmd Color
    if ([userInfo valueForKey:@"color"]) {
        UIColor* color = [userInfo valueForKey:@"color"];
        self.contentView.backgroundColor = color;
    }
}

- (void)setSeperatedTopLineHiden:(BOOL)top BottomLineHiden:(BOOL)bottom{
    self.topSeparatorLine.hidden = top;
    self.bottomSeparatorLine.hidden = bottom;
}

-(void)clearCellConfigs
{
    self.topSeparatorLine.hidden = YES;
    self.bottomSeparatorLine.hidden = YES;
    self.contentView.backgroundColor = [UIColor clearColor];
}

@end
