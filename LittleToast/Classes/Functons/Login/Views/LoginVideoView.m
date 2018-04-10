//
//  LoginVideoView.m
//  LittleToast
//
//  Created by Mr_kit on 2018/4/10.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "LoginVideoView.h"
#import <AVFoundation/AVFoundation.h>

@interface LoginVideoView ()

//播放窗口
@property (nonatomic, strong) UIView *playerView;
//蒙版
@property (nonatomic, strong) UIView *coverView;

//播放视频相关
@property (nonatomic, strong) AVPlayerItem *item;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;;

@end

@implementation LoginVideoView {
    CGRect _frame;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _frame = frame;
        [self setupView];
        [self addNotification];
    }
    return self;
}

- (void)setupView {
    
    [self addSubview:self.playerView];
    [self addSubview:self.coverView];
    //创建播放窗口
    [self.playerView.layer addSublayer:self.playerLayer];
    
    [self.player play];
}


- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

#pragma mark 公开方法
- (void)play {
    [self.player play];
}

- (void)pause {
    [self.player pause];
}

- (void)remove {
    [self.player pause];
//    self.player = nil;
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
        _playerView = [[UIView alloc] initWithFrame:_frame];
    }
    return _playerView;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:_frame];
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
