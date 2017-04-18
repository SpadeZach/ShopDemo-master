//
//  HomeShopBtn.m
//  HomePageShop
//
//  Created by 赵博 on 17/4/14.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "HomeShopBtn.h"
#import "UIView+CustomSize.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface HomeShopBtn ()
//详情
@property(nonatomic, strong)UILabel *detailLabel;
@end

@implementation HomeShopBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        [self setTitleColor:[UIColor colorWithRed:216 / 255.0f green:46/255.0f blue:50/255.0f alpha:1] forState:UIControlStateNormal];
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.custom_x = 69;
        self.detailLabel.custom_y = 28;
        self.detailLabel.custom_width = SCREEN_WIDTH - 61 - 15;
        self.detailLabel.custom_height = 13;
        
        self.detailLabel.font = [UIFont systemFontOfSize:13];
        self.detailLabel.textColor = [UIColor colorWithRed:107 / 255.0f green:107 /255.0f blue:107/255.0f alpha:1];
        [self addSubview:self.detailLabel];

        
        UIImageView *locationView = [[UIImageView alloc] initWithFrame:CGRectMake(69, 46, 12, 15)];
        [locationView setImage:[UIImage imageNamed:@"pinaddress."]];
        [self addSubview:locationView];
        
        UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 45, 46, 30, 10)];
        moreLabel.text = @"更多>";
        moreLabel.textAlignment = NSTextAlignmentRight;
        moreLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:moreLabel];
        
    }
    return self;
}
- (void)setDetailText:(NSString *)detailText{
    _detailText = detailText;
    self.detailLabel.text = _detailText;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.custom_y = 8;
    self.imageView.custom_height = 53;
    self.imageView.custom_width = 53;
    self.imageView.custom_x = 8;
    
    self.titleLabel.custom_x = self.imageView.custom_right + 8;
    self.titleLabel.custom_y = self.imageView.custom_y;
    self.titleLabel.custom_width =  SCREEN_WIDTH - self.titleLabel.custom_x - 15;
    self.titleLabel.custom_height = 13;
}

@end
