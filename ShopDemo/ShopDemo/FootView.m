//
//  FootView.m
//  Temp
//
//  Created by 赵博 on 17/4/14.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "FootView.h"
#import "UIView+CustomSize.h"
#import "ShopHomeCollectionCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface FootView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation FootView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //假分区头
        UIButton *sectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sectionBtn setTitle:@"推荐商品" forState:UIControlStateNormal];
        [sectionBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        sectionBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        sectionBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 22);
        sectionBtn.backgroundColor = [UIColor colorWithRed:230 /255.0f green:230 /255.0f blue:230 /255.0f alpha:1];
        [self addSubview:sectionBtn];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH / 3 - 8,  (SCREEN_WIDTH - 20) / 3 + 26);
        layout.minimumInteritemSpacing = 4;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(5, 30,SCREEN_WIDTH - 10,self.custom_height) collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollEnabled = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.showsVerticalScrollIndicator = NO;
        [self addSubview:collectionView];
        
        [collectionView registerNib:[UINib nibWithNibName:@"ShopHomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
        
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 23;
}

- (ShopHomeCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopHomeCollectionCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.layer.borderColor=[UIColor darkGrayColor].CGColor;;
    cell.layer.borderWidth=0.5;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


@end
