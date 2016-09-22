//
//  TelephoneDetailCell.m
//  EasyTableDemo
//
//  Created by steven yang on 16/9/21.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "TelephoneDetailCell.h"

@implementation TelephoneDetailCell


#define CellHeight 60

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.topSeparatorLine.hidden = NO;
        self.bottomSeparatorLine.hidden = NO;
    }
    return self;
}

- (void)setupData:(id)data userInfo:(NSDictionary *)userInfo
{

    UIButton* telBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 100, 44)];
    telBtn.right = SCREEN_WIDTH - 20;
    [telBtn setBackgroundColor:[UIColor lightGrayColor]];
    [telBtn setTitle:@"拨打电话" forState:UIControlStateNormal];
    [telBtn addTarget:self action:@selector(telAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:telBtn];
}

- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    
    
}



+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}


-(void)telAction
{
    if ([self.delegate respondsToSelector:@selector(DetailCell:callWithData:)]) {
        [self.delegate DetailCell:self callWithData:nil];
    }

}


@end
