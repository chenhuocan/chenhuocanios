//
//  sound.m
//  ios工程模板
//
//  Created by 陈火灿 on 2020/7/11.
//  Copyright © 2020 陈火灿. All rights reserved.
//

//// 创建一个音频文件的URL(URL就是文件路径对象)
//NSURL *url = [[NSBundle mainBundle] URLForResource:@"音频文件名" withExtension:@"音频文件的扩展名"];
//// 创建播放器
//self.player = [AVPlayer playerWithURL:url];
//// 播放
//[self.player play];

#import "sound.h"
#import <AVFoundation/AVFoundation.h>

@interface sound ()
/** 播放器 */
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation sound

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self soundPlay];
    
}

- (void)soundPlay {
// 获取资源
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"mySong1.mp3" ofType:nil];
//    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mySong1.mp3" withExtension:nil];
    // 创建播放器曲目
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    [self.player play];
    
}


- (void)soundPause {
    [self.player pause];
}

- (void)changeMusic {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mySong2.mp3" withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self.player play];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
