//
//  EasyTableVC.m
//  steven
//
//  Created by Steven on 15/9/6.
//  Copyright (c) 2015年 Steven. All rights reserved.
//

#import "EasyTableVC.h"
#import "EasyTableViewCell.h"
#import "ConstantDefine.h"


@interface EasyTableVC () <UITableViewDataSource, UITableViewDelegate, EasyTableViewCellDelegate>

@end

@implementation EasyTableVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _cellNodeArray = [NSMutableArray array];
    [self.view addSubview:self.easyView];
//    self.easyView.hidden = YES;
}

- (UITableView *)easyView
{
    if (_easyView == nil)
    {
        CGFloat startY = 0;
        CGFloat sizeH = appBounds.size.height - startY;
        CGRect frame = CGRectMake(self.view.left, startY, appBounds.size.width, sizeH);
        
        _easyView                              = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _easyView.autoresizingMask             = UIViewAutoresizingFlexibleHeight;
        _easyView.dataSource                   = self;
        _easyView.delegate                     = self;
        _easyView.showsVerticalScrollIndicator = NO;
        _easyView.separatorStyle               = UITableViewCellSeparatorStyleNone;
        _easyView.alwaysBounceVertical         = YES;
    }
    
    return _easyView;
}

- (void)nodeArrayAddSection:(NSArray *)section
{
    if ([section count] > 0)
    {
        NSMutableArray* nodes = [[NSMutableArray alloc] initWithArray:section];
        [_cellNodeArray addObject:nodes];
    }
}

- (void)nodeAdd:(id)node
{
    //如果第一个调用 nodeadd，section为空，所以无法添加node，因此添加第一个section
    if ([_cellNodeArray count]== 0) {
        NSMutableArray* array = [[NSMutableArray alloc] init];
        [_cellNodeArray addObject:array];
    }
    
    if (node) {
        [[_cellNodeArray lastObject] addObject:node];
    }
}

- (void)viewInsertSection:(NSArray *)sectionArray atIndex:(NSInteger)index
{
    NSInteger count = [sectionArray count];
    if (!count) {
        return;
    }
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger j = 0; j < count; ++j) {
        [indexArray addObject:[NSIndexPath indexPathForRow:j inSection:index]];
    }
    [self.cellNodeArray insertObject:sectionArray atIndex:index];
    [self.easyView beginUpdates];
    [self.easyView insertSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView endUpdates];
}

- (void)viewRemoveSectionAtIndex:(NSInteger)index
{
    NSInteger count = [self.cellNodeArray[index] count];
    if (count <= 0) {
        return;
    }
    
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger j = 0; j < count; ++j) {
        [indexArray addObject:[NSIndexPath indexPathForRow:j inSection:index]];
    }
    [self.cellNodeArray removeObjectAtIndex:index];
    [self.easyView beginUpdates];
    [self.easyView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView deleteSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView endUpdates];
}

/*!
 @brief  插入/删除 单个cell
 
 @param node      cell node 数据
 @param indexPath 位置
 */
- (void)viewInsertCell:(EasyTableViewCellNode *)node
           atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > self.cellNodeArray.count - 1) {
        return;
    }
    NSMutableArray *sectionArray = [self.cellNodeArray[indexPath.section] mutableCopy];
    if (indexPath.row > sectionArray.count) {
        return;
    }
    [self.cellNodeArray removeObjectAtIndex:indexPath.section];
    [sectionArray insertObject:node atIndex:indexPath.row];
    [self.cellNodeArray insertObject:sectionArray atIndex:indexPath.section];
    [self.easyView beginUpdates];
    [self.easyView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView endUpdates];
}

- (void)viewRemoveCellAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > self.cellNodeArray.count - 1) {
        return;
    }
    NSMutableArray *sectionArray = [self.cellNodeArray[indexPath.section] mutableCopy];
    if (indexPath.row > sectionArray.count - 1) {
        return;
    }
    [self.cellNodeArray removeObjectAtIndex:indexPath.section];
    [sectionArray removeObjectAtIndex:indexPath.row];
    [self.cellNodeArray insertObject:sectionArray atIndex:indexPath.section];
    [self.easyView beginUpdates];
    [self.easyView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.easyView endUpdates];
    
}

- (void)viewRemoveAllCellNodes
{
    if (self.cellNodeArray.count == 0) {
        return;
    }
    [self.cellNodeArray removeAllObjects];
    [self viewRefresh];
    
}

#pragma mark - UI Update
- (void)viewRefresh
{
    [_easyView reloadData];
}

- (void)viewUpdate
{
    for (NSArray *sectionArray in _cellNodeArray) {
        for (EasyTableViewCellNode *node in sectionArray) {
            [node update];
        }
    }
    [self viewRefresh];
}

- (void)viewUpdateAtIndexPath:(NSIndexPath *)indexPath
{
    [self viewUpdateAtIndexPath:indexPath withAnimation:EasyViewRowAnimationAutomatic];
}

- (void)viewUpdateAtIndexPath:(NSIndexPath *)indexPath withAnimation:(EasyViewRowAnimation)animation
{
    EasyTableViewCellNode *node = [self cellNodeAtIndexPath:indexPath];
    [node update];
    [_easyView beginUpdates];
    [_easyView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimation)animation];
    [_easyView endUpdates];
}


- (void)allVisibleViewsDidAppear
{
    self.easyView.hidden = NO;
    
    for (EasyTableViewCell *cell in [self.easyView visibleCells])
    {
        if ([cell conformsToProtocol:@protocol(EasyTableViewCellAnimationDelegate)])
        {
            __weak id <EasyTableViewCellAnimationDelegate> item = (id <EasyTableViewCellAnimationDelegate>)cell;
            if ([item respondsToSelector:@selector(cellDidAppear)])
            {
                [item cellDidAppear];
            }
        }
    }
}

-(void)reload
{
    [self viewUpdate];
    [self allVisibleViewsDidAppear];
}

- (UIView *)makeViewAtIndexPath:(NSIndexPath *)indexPath
{
    EasyTableViewCellNode *node = [self cellNodeAtIndexPath:indexPath];
    return [self makeViewWithNode:node];
}

#pragma mark - Get Node

- (UIView *)viewAtIndexPath:(NSIndexPath *)indexPath
{
    return [_easyView cellForRowAtIndexPath:indexPath];
}

- (EasyTableViewCellNode *)cellNodeAtIndexPath:(NSIndexPath *)indexPath
{
    return _cellNodeArray[indexPath.section][indexPath.row];
}

- (NSString *)cellIdentiferAtIndexPath:(NSIndexPath *)indexPath
{
    return [(EasyTableViewCellNode *)_cellNodeArray[indexPath.section][indexPath.row] className];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_cellNodeArray count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < 0 || section > [_cellNodeArray count] - 1) {
        return 0;
    }
    return [_cellNodeArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EasyTableViewCellNode *node = [self cellNodeAtIndexPath:indexPath];
    
    EasyTableViewCell *cell = (EasyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:node.className];
    if (cell == nil) {
        cell = (EasyTableViewCell *)[self viewWithNode:node];
    }
    cell.indexPath = indexPath;
    cell.node = node;
    
    if ([cell respondsToSelector:@selector(refreshWithData:userInfo:atIndexPath:)]) {
        [cell refreshWithData:node.data userInfo:node.userInfo atIndexPath:indexPath];
    }
    
    return cell;
}

- (UIView *)makeViewWithNode:(EasyTableViewCellNode *)node
{
    EasyTableViewCell *cell = (EasyTableViewCell *)[self viewWithNode:node];
    cell.height = node.height;
    cell.width  = self.easyView.width;
    cell.node = node;
    if ([cell respondsToSelector:@selector(refreshWithData:userInfo:atIndexPath:)]) {
        [cell refreshWithData:node.data userInfo:node.userInfo atIndexPath:nil];
    }
    
    return cell;
}

- (UIView *)viewWithNode:(EasyTableViewCellNode *)node
{
    if (node == nil) {
        NSLog(@"node is nil");
        return nil;
    }
    
    Class cellClass = node.viewClass;
    if (cellClass == NULL) {
        NSLog(@"node viewClass is NULL");
        return nil;
    }
    EasyTableViewCell *cell = (EasyTableViewCell *)[[(id)cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:node.className];
    cell.easyView = _easyView;
    cell.delegate  = self;
    if ([cell respondsToSelector:@selector(setupData:userInfo:)]) {
        [cell setupData:node.data userInfo:node.userInfo];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EasyTableViewCellNode *node = [self cellNodeAtIndexPath:indexPath];
    
    return node.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EasyTableViewCellNode *node = [self cellNodeAtIndexPath:indexPath];
    [self cellWithNode:node didSelectRowAtIndexPath:indexPath];
}

- (void)cellWithNode:(EasyTableViewCellNode *)node didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Maybe some error !!!o_O");
}

@end
