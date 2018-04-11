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


#import "UINavigationController+XWTransition.h"
#import "UIViewController+XWTransition.h"
#import "XWCircleSpreadAnimator.h"


@interface LoginViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,loginMessageDelegate>

//播放窗口
@property (nonatomic, strong) UIView *playerView;
//蒙版
@property (nonatomic, strong) UIView *coverView;

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
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player pause];
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
//    [self.view addSubview:self.coverView];
    
    LoginMessageView *messageView = [[LoginMessageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBar_Height)];
    messageView.delegate = self;
    [self.view addSubview:messageView];
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark - 登录
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password touchPoint:(CGPoint)touchPoint{
    // 配对数据库，查出该用户和密码
    // todo
    
    
    [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(touchPoint) forKey:@"LoginTouchPoint"];
    
    //创建转场动画
    UIViewController *main = [[MainViewController alloc] init];
    XWCircleSpreadAnimator *animator = [XWCircleSpreadAnimator xw_animatorWithStartCenter:touchPoint radius:20];
    animator.toDuration = 0.3f;
    animator.backDuration = 0.5f;
    // 跳转主界面
    [self xw_presentViewController:main withAnimator:animator];
    
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

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.view.bounds];
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, _coverView.width , _coverView.height);
        [_coverView addSubview:effectView];
    }
    return _coverView;
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
