//
//  EasyTableVC.h
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "EasyTableViewCellNode.h"


typedef NS_ENUM(NSInteger, EasyViewRowAnimation) {
    EasyViewRowAnimationFade,
    EasyViewRowAnimationRight,
    EasyViewRowAnimationLeft,
    EasyViewRowAnimationTop,
    EasyViewRowAnimationBottom,
    EasyViewRowAnimationNone,
    EasyViewRowAnimationMiddle,
    EasyViewRowAnimationAutomatic = 100
};

@interface EasyTableVC : UIViewController

@property (nonatomic, strong) UITableView *easyView;

@property (nonatomic, strong) NSMutableArray *cellNodeArray;

/*!
 *  插入数据
 *
 *  @param section 段数据 (数组中的节点被划在一个section中)
 */
- (void)nodeArrayAddSection:(NSArray *)section;



/**
 *  添加单独 node 到最后一个section
 *
 *  @param node  添加node
 */
-(void)nodeAdd:(id)node;



/*!
 *  插入/删除数据 并且更新 UI
 *
 *  @param sectionArray 段数据 (数组中的节点被划在一个section中)
 *  @param index        插入位置
 */
- (void)viewInsertSection:(NSArray *)sectionArray
                  atIndex:(NSInteger)index;

- (void)viewRemoveSectionAtIndex:(NSInteger)index;

/*!
 @brief  插入/删除 单个cell
 
 @param node      cell node 数据
 @param indexPath 位置
 */
- (void)viewInsertCell:(EasyTableViewCellNode *)node
           atIndexPath:(NSIndexPath *)indexPath;

- (void)viewRemoveCellAtIndexPath:(NSIndexPath *)indexPath;


/*!
 *  刷新对应位置UI
 *
 *  @param indexPath 位置索引
 */
- (void)viewUpdateAtIndexPath:(NSIndexPath *)indexPath;

/*!
 @brief  刷新对应位置UI
 
 @param indexPath indexPath 位置索引
 @param animation 动画
 */
- (void)viewUpdateAtIndexPath:(NSIndexPath *)indexPath
                withAnimation:(EasyViewRowAnimation)animation;

/*!
 *  刷新全部
 */
- (void)viewUpdate;

/*!
 @brief  只刷新UI
 */
- (void)viewRefresh;

/*!
 *  通知所有视野范围内的view
 */
- (void)allVisibleViewsDidAppear;

/**
 *  删除所有的
 */
- (void)viewRemoveAllCellNodes;


/*!
 *  节点信息
 *
 *  @param indexPath 位置索引
 *
 *  @return EasyTableViewCellNode
 */
- (EasyTableViewCellNode *)cellNodeAtIndexPath:(NSIndexPath *)indexPath;

/*!
 *  索引查找cell标识
 *
 *  @param indexPath 索引
 *
 *  @return 标识
 */
- (NSString *)cellIdentiferAtIndexPath:(NSIndexPath *)indexPath;

/*!
 *  指定位置视图
 *
 *  @param indexPath 位置索引
 *
 *  @return UIView
 */
- (UIView *)viewAtIndexPath:(NSIndexPath *)indexPath;

/*!
 *  创建指定位置视图
 *
 *  @param indexPath 位置索引
 *
 *  @return UIView
 */
- (UIView *)makeViewAtIndexPath:(NSIndexPath *)indexPath;

/*!
 *  根据节点数据创建视图
 *
 *  @param node 数据
 *
 *  @return UIView
 */
- (UIView *)makeViewWithNode:(EasyTableViewCellNode *)node;



/*!
 *  显示数据
 */

-(void)reload;

/*!
 *  视图被点击后的回调
 *
 *  @param node      被点击视图对应的数据节点
 *  @param indexPath 被点击视图对应的位置索引
 */
- (void)cellWithNode:(EasyTableViewCellNode *)node didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
