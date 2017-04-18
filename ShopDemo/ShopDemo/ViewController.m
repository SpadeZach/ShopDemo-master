//
//  ViewController.m
//  HomePageShop
//
//  Created by 赵博 on 17/4/14.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ShopHomePageCell.h"
#import "FootView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
static NSString *const cellIndetify = @"ShopHomePageCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self creatTable];
    
    
    
}
#pragma mark - TableView
- (void)creatTable{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = (SCREEN_WIDTH - 20) / 3+160;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}
#pragma mark - tableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark - tableCell
- (ShopHomePageCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //避免重用
    ShopHomePageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[ShopHomePageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.recvieArr  = @[@"1",@"2"];
    return cell;
}
#pragma mark - footView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    FootView *footView = [[FootView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1000)];
    footView.backgroundColor = [UIColor greenColor];
    return footView;
}
#pragma mark - footHeight
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
#warning 网络请求回来处理
    return 1000;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}

@end
