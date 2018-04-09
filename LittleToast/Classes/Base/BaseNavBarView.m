//
//  BaseTapBarView.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "BaseNavBarView.h"

@interface BaseNavBarView ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UITextField *titleView;

@end

@implementation BaseNavBarView {
    BOOL _isListning;
    CGFloat _lastY;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title superView:(UIScrollView *)supperView {
    if (self = [super initWithFrame:frame]) {
        self.title = title;
        self.supperView = supperView;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.backgroundView];
    [self addSubview:self.titleView];
}

- (void)setSupperView:(UIScrollView *)supperView {
    //注册KVO，监听scrllView的滑动距离
    if (supperView && [[supperView class] isSubclassOfClass:[UIScrollView class]]) {
        _supperView = supperView;
        _isListning = YES;
        [_supperView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
}


#pragma mark - kvo监听值变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"] && object == self.supperView) {
        id newValue = [change valueForKey:NSKeyValueChangeNewKey];
        CGPoint newPoint = CGPointZero;
        [(NSValue*)newValue getValue:&newPoint];
        if (self.maxDistentce != 0 && newPoint.y != _lastY && newPoint.y <= self.maxDistentce + 10) {
            [self scrollViewDidScorll:newPoint];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

#pragma mark - 处理滑动事件
- (void)scrollViewDidScorll:(CGPoint)contentOffset {
    _lastY = contentOffset.y;
    
    CGFloat alpha = 1;
    if (_lastY < 0) {
        alpha = 1;
    } else if (_lastY > 0 && _lastY <= self.maxDistentce) {
        alpha = 1 - (_lastY / (CGFloat)self.maxDistentce);
    } else if (_lastY > self.maxDistentce) {
        alpha = 0;
    }
    
    [self changBackgroundAlpha:alpha];
}

#pragma mark - 滑动颜色变换
- (void)changBackgroundAlpha:(CGFloat)alpha {
    self.backgroundView.backgroundColor = [COLOR_THEME colorWithAlphaComponent:alpha];
}


- (void)dealloc {
    //移除KVO
    if (_isListning) {
        [self.supperView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)layoutSubviews {
    
    self.backgroundView.frame = self.bounds;
    self.titleView.frame = CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, NavigationBar_Height);
}


#pragma mark -lazyLoad
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = COLOR_THEME;
    }
    return _backgroundView;
}

- (UITextField *)titleView {
    if (!_titleView) {
        _titleView = [UITextField new];
        _titleView.text = self.title;
        _titleView.textAlignment = NSTextAlignmentCenter;
        _titleView.font = [UIFont boldSystemFontOfSize:16];
    }
    return _titleView;
}
@end
