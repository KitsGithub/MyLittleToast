//
//  LoginViewController.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/9.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "LoginViewController.h"
#import <AVFoundation/AVFoundation.h>

#import "LoginMessageView.h"
#import "MainViewController.h"

@interface LoginViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,loginMessageDelegate>

//播放窗口
@property (nonatomic, strong) UIView *playerView;
//播放视频相关
@property (nonatomic, strong) AVPlayerItem *item;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;



@end

@implementation LoginViewController

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //开始播放视频
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player pause];
    self.player = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNotification];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupView {
    
    [self.view addSubview:self.playerView];
    //创建播放窗口
    [self.playerView.layer addSublayer:self.playerLayer];
    
    LoginMessageView *messageView = [[LoginMessageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBar_Height)];
    messageView.delegate = self;
    [self.view addSubview:messageView];
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark - 登录
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password {
    // 配对数据库，查出该用户和密码
    // todo
    
    
    // todo 转场动画
    
    // 跳转主界面
    UIViewController *main = [[MainViewController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = main;
    [window makeKeyAndVisible];
    
}

#pragma maark - 播放通知
- (void)playerFinished:(NSNotification *)notification {
    NSLog(@"播放结束，循环播放");
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}


#pragma mark - lazyLoad
- (UIView *)playerView {
    if (!_playerView) {
        _playerView = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    return _playerView;
}

- (AVPlayerItem *)item {
    if (!_item) {
        NSString *filePath = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] resourcePath],@"/LoginVideo.mp4"];
        NSURL *assetURL = [NSURL fileURLWithPath:filePath];
        _item = [AVPlayerItem playerItemWithURL:assetURL];
    }
    return _item;
}

- (AVPlayer *)player {
    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:self.item];
    }
    return _player;
}

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = self.playerView.bounds;
    }
    return _playerLayer;
}

@end
