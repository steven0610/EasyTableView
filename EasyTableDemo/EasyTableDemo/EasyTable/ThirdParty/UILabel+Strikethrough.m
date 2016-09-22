//
//  UILabel+Strikethrough.m
//  Wanhui
//
//  Created by Tozy on 13-10-24.
//  Copyright (c) 2013年 jing. All rights reserved.
//

#import "UILabel+Strikethrough.h"
#import "UIView+Sizes.h"

#define kStrikethroughViewTag    (7024 << 3)
#define kStrikethroughMargin    1

@implementation UILabel (Strikethrough)
- (BOOL)isStrikethroughEnable
{
    return (BOOL)[self viewWithTag:kStrikethroughViewTag];
}

- (void)setStrikethroughEnable:(BOOL)strikethroughEnable
{
    if (strikethroughEnable) {
        [self setStrikethroughWithColor:self.textColor length:self.width - 2 * kStrikethroughMargin offset:UIOffsetMake(kStrikethroughMargin, self.height * .5)];
    } else {
        [self viewWithTag:kStrikethroughViewTag].hidden = YES;
    }
}

- (void)setStrikethroughWithColor:(UIColor *)color length:(NSInteger)length offset:(UIOffset)offset
{
    UIView *strikethroughView = [self viewWithTag:kStrikethroughViewTag];
    if (!strikethroughView) {
        strikethroughView = [[UIView alloc] initWithFrame:CGRectZero];
        strikethroughView.tag = kStrikethroughViewTag;
        [self addSubview:strikethroughView];
    }
    strikethroughView.size = CGSizeMake(length, 1);
    strikethroughView.left = offset.horizontal;
    strikethroughView.top = offset.vertical;
    strikethroughView.backgroundColor = color;
}
@end

@implementation UILabel (SizeToFit)

-(void)fitText:(NSString*)text
{
    if (text) {
        self.text = text;
        [self sizeToFit];
    }
}


- (void)widthToFit
{
    if (self.numberOfLines == 1) {
        self.width = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
    }
}

- (void)widthFitsMaxWidth:(CGFloat)width
{
    [self widthToFit];
    CGRect rect = self.frame;
    if (rect.size.width > width) {
        rect.size.width = width;
    }
    self.frame = rect;
}

- (void)widthFitsMinWidth:(CGFloat)width
{

    [self widthToFit];
    CGRect rect = self.frame;
    if (rect.size.width < width) {
        rect.size.width = width;
    }
    self.frame = rect;
}

- (void)heightToFit
{
    self.height = ceilf([self.text boundingRectWithSize:CGSizeMake(self.width, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height);
}

- (void)heightFitsMaxHeight:(CGFloat)height
{
    [self heightToFit];
    CGRect rect = self.frame;
    if (rect.size.height > height) {
        rect.size.height = height;
    }
    self.frame = rect;
}

- (void)heightFitsMinHeight:(CGFloat)height
{
    [self heightToFit];
    CGRect rect = self.frame;
    if (rect.size.height < height) {
        rect.size.height = height;
    }
    self.frame = rect;
}
@end
