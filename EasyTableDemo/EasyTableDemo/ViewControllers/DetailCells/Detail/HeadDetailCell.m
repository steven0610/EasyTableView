//
//  HeadDetailCell.m
//  EasyTableDemo
//
//  Created by steven yang on 16/9/21.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "HeadDetailCell.h"

#define CellHeight 200

@implementation HeadDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupData:(id)data userInfo:(NSDictionary *)userInfo
{
    NSString* imgName = data;
    
    UIImageView* headImge = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CellHeight)];
    headImge.image = [UIImage imageNamed:imgName];
    [self.contentView addSubview:headImge];
    
}

- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
 
    
    
}



+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}
@end
