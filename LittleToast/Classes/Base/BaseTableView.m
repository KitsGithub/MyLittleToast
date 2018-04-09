//
//  BaseTableView.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/8.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self adaptationIOS11];
    }
    return self;
}

- (void)adaptationIOS11 {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        
    }
}


@end
