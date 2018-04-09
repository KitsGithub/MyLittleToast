//
//  LoginMessageView.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "LoginMessageView.h"

@interface LoginMessageView ()

@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.userName];
    [self addSubview:self.password];
    [self addSubview:self.loginBtn];
}

#pragma mark -layout
- (void)layoutSubviews {
    self.loginBtn.frame = CGRectMake(paddingLeft, self.bottom - 50, SCREEN_WIDTH - paddingLeft * 2, 50);
    
    self.password.frame = CGRectMake(paddingLeft, self.loginBtn.top - paddingLeft - 40, SCREEN_WIDTH - paddingLeft*2, 40);
    
    self.userName.frame = CGRectMake(paddingLeft, self.password.top - paddingLeft - 40, self.password.width, self.password.height);
}


#pragma mark - 私有方法
- (void)loginDidClick:(UIButton *)sener {
    
    /* 忽略判断条件
    if (!self.userName.text.length) {
        NSLog(@"请输入用户名");
        return;
    } else if (!self.password.text.length) {
        NSLog(@"请输入密码");
        return;
    }
    */
    
    NSString *userName = self.userName.text;
    NSString *password = self.password.text;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginWithUserName:password:)]) {
        [self.delegate loginWithUserName:userName password:password];
    }
}

#pragma mark - lazeLoad
- (UITextField *)userName {
    if (!_userName) {
        _userName = [UITextField new];
        _userName.backgroundColor = [COLOR_WHITE colorWithAlphaComponent:0.7];
        _userName.placeholder = @"请输入您的账号";
        _userName.layer.cornerRadius = 5;
        _userName.font = FONT_TITLE;
        _userName.textColor = COLOR_TEXT;
    }
    return _userName;
}

- (UITextField *)password {
    if (!_password) {
        _password = [UITextField new];
        _password.backgroundColor = [COLOR_WHITE colorWithAlphaComponent:0.7];
        _password.placeholder = @"请输入您的密码";
        _password.layer.cornerRadius = 5;
        _password.font = FONT_NORMAL;
    }
    return _password;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton new];
        _loginBtn.backgroundColor = COLOR_THEME;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5;
        [_loginBtn addTarget:self action:@selector(loginDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

@end
