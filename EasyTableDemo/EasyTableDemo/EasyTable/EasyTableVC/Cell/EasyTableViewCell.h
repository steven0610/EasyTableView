//
//  EasyTableViewCell.h
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyTableViewCellNode.h"
#import "EasyBaseTableViewCell.h"


#define SynthesizeEasyProp synthesize easyView = _easyView, indexPath = _indexPath, delegate = _delegate, node = _node
#define SynthesizeDelegate synthesize delegate = _delegate

@protocol EasyTableViewCellDelegate <NSObject>

@end

@protocol EasyTableViewCellStyleDelegate <NSObject>
@property (nonatomic, strong) UIScrollView               *easyView;
@property (nonatomic, copy  ) NSIndexPath                *indexPath;

@property (nonatomic, weak  ) EasyTableViewCellNode     *node;

@property (nonatomic, weak  ) id<EasyTableViewCellDelegate> delegate;

/*!
 *  计数cell高度, 解析数据后调用各cell自有高度计算
 *
 *  @param data     数据
 *  @param userInfo 额外参数
 *
 *  @return 高度
 */
+ (CGFloat)cellHeightWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath;

@optional
/*!
 *  初始化装载数据
 *
 *  @param data     数据
 *  @param userInfo 额外参数
 */
- (void)setupData:(id)data userInfo:(NSDictionary *)userInfo;

@optional
/*!
 *  刷新cell, 解析数据后调用各cell自由刷新UI方法
 *
 *  @param data     数据
 *  @param userInfo 额外参数
 */
- (void)refreshWithData:(id)data userInfo:(NSDictionary *)userInfo atIndexPath:(NSIndexPath *)indexPath;




@end

@protocol EasyTableViewCellAnimationDelegate <NSObject>

@optional

- (void)cellDidAppear;

@end


@interface EasyTableViewCell : EasyBaseTableViewCell <EasyTableViewCellStyleDelegate>


@end
