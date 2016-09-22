//
//  EasyTableViewCellNode.m
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "EasyTableViewCellNode.h"
#import "EasyTableViewCell.h"



@interface EasyTableViewCellNode ()

@end

@implementation EasyTableViewCellNode

+ (instancetype)nodeWithClassName:(NSString *)className data:(id)data
{
    return [[EasyTableViewCellNode alloc]initWithClassName:className data:data userInfo:nil];
}

- (instancetype)initWithClassName:(NSString *)className data:(id)data
{
    return [self initWithClassName:className data:data userInfo:nil];
}

+ (instancetype)nodeWithClassName:(NSString *)className
                             data:(id)data
                         userInfo:(NSDictionary *)userInfo
{
    return [[EasyTableViewCellNode alloc]initWithClassName:className data:data userInfo:userInfo];
}

- (instancetype)initWithClassName:(NSString *)className
                             data:(id)data
                         userInfo:(NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        _viewClass = NULL;
        _className = [className copy];
        _userInfo  = [userInfo copy];
        _data = data;
        if ([className length]) {
            _viewClass = NSClassFromString(_className);
        }else {
            _viewClass = NULL;
        }
        if (_viewClass == NULL) {
            _height = .0f;
        } else {
            _height = [_viewClass cellHeightWithData:_data userInfo:_userInfo atIndexPath:nil];
        }
    }
    return self;
}

- (void)updateWithClassName:(NSString *)className
                       data:(id)data
                   userInfo:(NSDictionary *)userInfo
{
    if ([className length])
    {
        _className = [className copy];
    }
    
    if (userInfo)
    {
        _userInfo  = [userInfo copy];
    }
    
    if (data)
    {
        _data = data;
    }
    
    if ([className length])
    {
        _viewClass = NSClassFromString(_className);
    }
    
    if (_viewClass == NULL)
    {
        _height = .0f;
    }
    else
    {
        _height = [_viewClass cellHeightWithData:_data userInfo:_userInfo atIndexPath:nil];
    }
}

- (void)updateWithData:(id)data userInfo:(NSDictionary *)userInfo
{
    [self updateWithClassName:nil data:data userInfo:userInfo];
}

- (void)update
{
    [self updateWithClassName:nil data:nil userInfo:nil];
}

- (NSString *)description
{
    NSString *des = [NSString stringWithFormat:@"Class Name : %@ \nUserInfo : %@ \nheght : %f", _className, _userInfo, _height];
    return des;
}

@end
