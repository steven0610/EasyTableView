//
//  ViewController.m
//  EasyTableDemo
//
//  Created by steven yang on 16/9/20.
//  Copyright © 2016年 steven yang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Sizes.h"
#import "GoodsDetailVC.h"
#import "OrderDetailVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* detailBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 150, 60)];
    [detailBtn setTitle:@"商品详情" forState:UIControlStateNormal];
    detailBtn.backgroundColor = [UIColor lightGrayColor];
    detailBtn.centerX = self.view.centerX;
    [detailBtn addTarget:self action:@selector(pushGoodsDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detailBtn];
    
    
    UIButton* orderBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, detailBtn.bottom+20, 150, 60)];
    [orderBtn setTitle:@"订单详情" forState:UIControlStateNormal];
    orderBtn.backgroundColor = [UIColor lightGrayColor];
    orderBtn.centerX = self.view.centerX;
    [orderBtn addTarget:self action:@selector(pushOrderDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orderBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pushGoodsDetail
{
    GoodsDetailVC* goodsDetailVC = [[GoodsDetailVC alloc] init];
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
}

-(void)pushOrderDetail
{
    OrderDetailVC* orderDetailVC = [[OrderDetailVC alloc] init];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

@end
