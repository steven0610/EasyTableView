//
//  EasyTableViewCellNode.h
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  创建节点
 *
 *  @param cln 类名
 *  @param d   数据
 *
 *  @return 节点
 */
#define EasyNodeMake(_className, _data) ([EasyTableViewCellNode nodeWithClassName:_className data:_data])

/**
 *  创建节点
 *
 *  @param cln 类名
 *  @param d   数据
 *  @param u   特殊信息
 *
 *  @return 节点
 */
#define EasyNodeMakeWithUserInfo(_className, _data, _userInfo) ([EasyTableViewCellNode nodeWithClassName:_className data:_data userInfo:_userInfo])


@interface EasyTableViewCellNode : NSObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic) id data;
@property (nonatomic, copy) NSDictionary *userInfo;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic) Class viewClass;

/**
 *  创建节点
 *
 *  @param className 类名
 *  @param data      数据
 *
 *  @return 节点
 */
+ (instancetype)nodeWithClassName:(NSString *)className data:(id)data;

/**
 *  创建节点
 *
 *  @param className 类名
 *  @param data      数据
 *
 *  @return 节点
 */
- (instancetype)initWithClassName:(NSString *)className data:(id)data;

/**
 *  创建节点
 *
 *  @param className 类名
 *  @param data      数据
 *  @param userInfo  特殊信息
 *
 *  @return 节点
 */
+ (instancetype)nodeWithClassName:(NSString *)className
                             data:(id)data
                         userInfo:(NSDictionary *)userInfo;

/**
 *  创建节点
 *
 *  @param className 类名
 *  @param data      数据
 *  @param userInfo  特殊信息
 *
 *  @return 节点
 */
- (instancetype)initWithClassName:(NSString *)className
                             data:(id)data
                         userInfo:(NSDictionary *)userInfo;

/**
 *  跟新节点
 *
 *  @param className 类名
 *  @param data      数据
 *  @param userInfo  特殊信息
 */
- (void)updateWithClassName:(NSString *)className
                       data:(id)data
                   userInfo:(NSDictionary *)userInfo;

/**
 *  更新节点
 *
 *  @param data     数据
 *  @param userInfo 特殊信息
 */
- (void)updateWithData:(id)data userInfo:(NSDictionary *)userInfo;

/**
 *  更新节点
 */
- (void)update;

@end
