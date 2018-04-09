//
//  BaseTapBarView.h
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavBarView : UIView

/**
 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 滑动变化最远距离
 */
@property (nonatomic, assign) CGFloat maxDistentce;


/**
 依赖的滑动对象
 */
@property (nonatomic, weak) UIScrollView *supperView;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title superView:(UIScrollView *)superView;


@end
