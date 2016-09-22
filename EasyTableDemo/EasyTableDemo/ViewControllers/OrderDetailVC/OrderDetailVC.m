//
//  OrderDetailVC.m
//  EasyTableDemo
//
//  Created by steven yang on 16/9/20.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "OrderDetailVC.h"
#import "CellConfig.h"

@interface OrderDetailVC ()

@end

@implementation OrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"订单详情";
    
    
    [self setupUIWithData:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupUIWithData:(NSDictionary*)data
{
    
    [self nodeArrayAddSection:@[EasyNodeMake(ORDER_DETAIL_GAP_CELL,nil)
                                ,EasyNodeMake(ORDER_DETAIL_SECTION_TT_CELL,@"订单详情")
                                ,EasyNodeMake(ORDER_DETAIL_WHITE_GAP_CELL, nil)]];
    

    
    
    [self nodeAdd:EasyNodeMake(ORDER_DETAIL_TITTLE_CONTENT_CELL,(@{@"商品价格":[NSString stringWithFormat:@"￥%@",@"100"]}))];
    
    [self nodeAdd:EasyNodeMake(ORDER_DETAIL_TITTLE_CONTENT_CELL,(@{@"包装费":[NSString stringWithFormat:@"￥%@",@"20"]}))];
    //配送信息
    [self nodeArrayAddSection:@[EasyNodeMake(ORDER_DETAIL_GAP_CELL,nil)
                                ,EasyNodeMake(ORDER_DETAIL_SECTION_TT_CELL,@"配送信息")
                                ,EasyNodeMake(ORDER_DETAIL_WHITE_GAP_CELL, nil)]];
    
    [self nodeArrayAddSection:@[EasyNodeMake(ORDER_DETAIL_TITTLE_CONTENT_CELL,@{@"配送地址":@"北京市海淀区*********"})
                                ,EasyNodeMake(ORDER_DETAIL_TITTLE_CONTENT_CELL,@{@"配送方":@"空运 😊"})
                                ]];
    
    [self reload];
}



/*
 * node 的点击处理可以写在这里  详情可以参考GoodsDetailVC 中的用法
 */
- (void)cellWithNode:(EasyTableViewCellNode *)node didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
