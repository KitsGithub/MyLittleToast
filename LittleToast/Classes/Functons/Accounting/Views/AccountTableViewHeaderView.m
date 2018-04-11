//
//  AccountTableViewHeaderView.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "AccountTableViewHeaderView.h"

@interface AccountTableViewHeaderView ()

@property (nonatomic, strong) UIImageView *headerPhotos;
@property (nonatomic, strong) UIButton *accountting;

@end

@implementation AccountTableViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.headerPhotos];
    [self addSubview:self.accountting];
}

- (void)layoutSubviews {
    self.headerPhotos.frame = CGRectMake(self.x, self.y, self.width, self.height - 25);
    self.accountting.frame = CGRectMake(paddingLeft, self.bottom - 50, SCREEN_WIDTH - paddingLeft * 2, 50);
}


#pragma mark - lazyLoad
- (UIImageView *)headerPhotos {
    if (!_headerPhotos) {
        NSString *headerImgPath = [[NSBundle mainBundle] pathForResource:@"AccountHeader.jpg" ofType:@""];
        _headerPhotos = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:headerImgPath]];
    }
    return _headerPhotos;
}

- (UIButton *)accountting {
    if (!_accountting) {
        _accountting = [UIButton new];
        _accountting.backgroundColor = COLOR_THEME;
        _accountting.layer.cornerRadius = 5;
        _accountting.titleLabel.font = FONT_TITLE;
        [_accountting setTitle:@"记一笔" forState:UIControlStateNormal];
    }
    return _accountting;
}

@end
