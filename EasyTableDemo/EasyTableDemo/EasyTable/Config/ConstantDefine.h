//
//  ConstantDefine.h
//  steven
//
//  Created by Steven on 15/11/27.
//  Copyright © 2015年 Steven. All rights reserved.
//  公共宏定义

#ifndef ConstantDefine_h
#define ConstantDefine_h


#import "UIView+Sizes.h"

#define LINEHEIGHT  (1 / ([UIScreen mainScreen].scale)) //常用分割线高

/** iOS版本号 */
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//界面尺寸不加状态栏
#define appFrame            [[UIScreen mainScreen] applicationFrame]
#define appStatusBarFrame   [[UIApplication sharedApplication] statusBarFrame]
#define appStatusBarHeight  appStatusBarFrame.size.height

// 状态栏高度变化（如：在接电话时查看应用）
#define appBounds (appStatusBarHeight > 20 ? CGRectMake([[UIScreen mainScreen] bounds].origin.x,[[UIScreen mainScreen] bounds].origin.y,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height-(appStatusBarHeight-20)+(IOS_VERSION<7?20:0)) : [[UIScreen mainScreen] bounds])

#pragma mark - 尺寸相关
#define SCREEN_BOUNDS       appBounds
#define SCREEN_WIDTH        SCREEN_BOUNDS.size.width
#define SCREEN_HEIGHT       SCREEN_BOUNDS.size.height
#define SCREEN_MAX_LENGTH   MAX(SCREEN_WIDTH, SCREEN_HEIGHT)
#define SCREEN_MIN_LENGTH   MIN(SCREEN_WIDTH, SCREEN_HEIGHT)

#pragma mark - window尺寸相关
#define WINDOW_SCREEN_BOUNDS       [[UIScreen mainScreen] bounds]
#define WINDOW_SCREEN_WIDTH        WINDOW_SCREEN_BOUNDS.size.width
#define WINDOW_SCREEN_HEIGHT       WINDOW_SCREEN_BOUNDS.size.height
#define WINDOW_SCREEN_MAX_LENGTH   MAX(WINDOW_SCREEN_WIDTH, WINDOW_SCREEN_HEIGHT)
#define WINDOW_SCREEN_MIN_LENGTH   MIN(WINDOW_SCREEN_WIDTH, WINDOW_SCREEN_HEIGHT)

#pragma mark - 设备相关
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define IS_IPAD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


#define IS_IPHONE_2208 (IS_IPHONE && WINDOW_SCREEN_HEIGHT == 736.f)
#define IS_IPHONE_1334 (IS_IPHONE && WINDOW_SCREEN_HEIGHT == 667.f)
#define IS_IPHONE_1136 (IS_IPHONE && WINDOW_SCREEN_HEIGHT == 568.f)
#define IS_IPHONE_960 (IS_IPHONE && WINDOW_SCREEN_HEIGHT == 480.f)

#endif
