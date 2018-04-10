//
//  LoginMessageView.h
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginMessageView;
@protocol loginMessageDelegate <NSObject>

@optional
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password touchPoint:(CGPoint)touchPoint;

@end

@interface LoginMessageView : UIView

@property (nonatomic, weak) id <loginMessageDelegate> delegate;

@end
