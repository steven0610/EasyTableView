//
//  GoodsDetailVC.m
//  EasyTableDemo
//
//  Created by steven yang on 16/9/20.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "GoodsDetailVC.h"
#import "CellConfig.h"

@interface GoodsDetailVC ()

@end

@implementation GoodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    
    self.title = @"商品详情";
    
    [self setupUIWithData:nil];
    
    self.easyView.height = SCREEN_HEIGHT - 44; /* 注意:
                                                       在这里可以动态修改 table 的高度，
                                                一般情况下，VC 最下面会有一些例如 "立即购买" 的Button
                                                不随table 改变的空间，可以直接加在VC上。
                                                */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupUIWithData:(NSDictionary*)data
{
    [self nodeArrayAddSection:@[EasyNodeMake(DETAIL_HEAD_CELL,@"detailHeadImg")
                                ,EasyNodeMakeWithUserInfo(ORDER_DETAIL_SECTION_TT_CELL,@"商品详情",(@{@"style":@(GapTypeBottom),@"color":[UIColor orangeColor]}))
                                ]];
    
    
    [self nodeAdd:EasyNodeMakeWithUserInfo(ORDER_DETAIL_TITTLE_CONTENT_CELL,(@{@"商品价格":[NSString stringWithFormat:@"￥%@",@"100"]}),(@{@"style":@(GapTypeBottom),@"color":[UIColor whiteColor]}))];
    
    [self nodeAdd:EasyNodeMake(ORDER_DETAIL_TITTLE_CONTENT_CELL,(@{@"包装费":[NSString stringWithFormat:@"￥%@",@"20"]}))];
    
    [self nodeAdd:EasyNodeMake(DETAIL_TELEPHONE_CELL, nil)];
 
    
    [self reload];
}



/*
 * node 的点击处理可以写在这里  详情可以参考GoodsDetailVC 中的用法
 */
- (void)cellWithNode:(EasyTableViewCellNode *)node didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([node.className isEqualToString:DETAIL_HEAD_CELL]) {
        NSLog(@" 头图被点击了!!!! ");
    }else if ([node.className isEqualToString:ORDER_DETAIL_TITTLE_CONTENT_CELL]){
        NSLog(@"这是哪个node 被点击了呢？");
    }
}


- (void)DetailCell:(TelephoneDetailCell *)cell callWithData:(id)data
{
    NSLog(@" 电话被点击了!!!!!! ");
}

@end
