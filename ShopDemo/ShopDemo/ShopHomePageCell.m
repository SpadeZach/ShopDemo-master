//
//  ShopHomePageCell.m
//  HomePageShop
//
//  Created by 赵博 on 17/4/14.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "ShopHomePageCell.h"
#import "HomeShopBtn.h"
#import "ShopHomeCollectionCell.h"
#import "UIView+CustomSize.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ShopHomePageCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageCtrl;
}
@end

@implementation ShopHomePageCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
#warning temp
        //假分区头
        UIButton *sectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sectionBtn setTitle:@"商家推荐" forState:UIControlStateNormal];
        [sectionBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        sectionBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        sectionBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 22);
        sectionBtn.backgroundColor = [UIColor colorWithRed:230 /255.0f green:230 /255.0f blue:230 /255.0f alpha:1];
        [self.contentView addSubview:sectionBtn];
        ////////////////////
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH, (SCREEN_WIDTH - 20) / 3+120)];
//        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
        scrollView.backgroundColor = [UIColor whiteColor];
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:scrollView];
        _scrollView = scrollView;
      
        UIPageControl *pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, scrollView.custom_botton - 5, self.bounds.size.width, 20)];
//        pageCtrl.backgroundColor = [UIColor redColor];
        pageCtrl.currentPage = 0;
        pageCtrl.currentPageIndicatorTintColor = [UIColor colorWithRed:216 / 255.0f green:46 / 255.0f blue:50 / 255.0f alpha:1];
        pageCtrl.pageIndicatorTintColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1];
        [pageCtrl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:pageCtrl];
        _pageCtrl = pageCtrl;
    }
    return self;
}
#pragma mark - scrollDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageCtrl setCurrentPage:offset.x / bounds.size.width];
}
#pragma mark - pageCtrl
- (void)pageTurn:(UIPageControl*)sender{
    //令UIScrollView做出相应的滑动显示
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * _pageCtrl.currentPage, 0) animated:YES];

}
#pragma mark - setter
- (void)setRecvieArr:(NSArray *)recvieArr{
    _recvieArr = recvieArr;
    _scrollView.contentSize =CGSizeMake(SCREEN_WIDTH * _recvieArr.count, 0);
    _pageCtrl.numberOfPages = _recvieArr.count;
    for (int i = 0; i < _recvieArr.count; i++) {
        HomeShopBtn *shopBtn = [[HomeShopBtn alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, 68)];
        [shopBtn setTitle:@"123123" forState:UIControlStateNormal];
        [shopBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        shopBtn.detailText = _recvieArr[i];
        [_scrollView addSubview:shopBtn];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH / 3 - 8, _scrollView.custom_height - 94);
        layout.minimumInteritemSpacing = 4;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i + 5, 78,SCREEN_WIDTH - 10,_scrollView.custom_height - 94) collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollEnabled = NO;
        collectionView.tag = 1000+i;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.showsVerticalScrollIndicator = NO;
        [_scrollView addSubview:collectionView];
    
        [collectionView registerNib:[UINib nibWithNibName:@"ShopHomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (ShopHomeCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopHomeCollectionCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];

    cell.layer.borderColor=[UIColor darkGrayColor].CGColor;;
    cell.layer.borderWidth=0.5;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}









- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
