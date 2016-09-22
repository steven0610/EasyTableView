//
//  UILabel+Strikethrough.h
//  Wanhui
//
//  Created by Tozy on 13-10-24.
//  Copyright (c) 2013年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Strikethrough)
@property (nonatomic, assign, getter = isStrikethroughEnable) BOOL strikethroughEnable;
- (void)setStrikethroughWithColor:(UIColor *)color length:(NSInteger)length offset:(UIOffset)offset;
@end

@interface UILabel (SizeToFit)
// only numberOfLines == 1
- (void)widthToFit;
- (void)widthFitsMinWidth:(CGFloat)width;
- (void)widthFitsMaxWidth:(CGFloat)width;
// not change width
- (void)heightToFit;
- (void)heightFitsMinHeight:(CGFloat)height;
- (void)heightFitsMaxHeight:(CGFloat)height;

//fit size default
-(void)fitText:(NSString*)text;
@end
