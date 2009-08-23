//
//  DeepSleepPreventer.h
//  iPhoneInsomnia
//
//  Created by Marco Peluso on 20.08.09.
//  Copyright 2009 Marco Peluso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVAudioPlayer;

@interface DeepSleepPreventer : NSObject {
	AVAudioPlayer *audioPlayer;
	NSTimer *preventSleepTimer;
}
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) NSTimer *preventSleepTimer;
- (void)playPreventSleepSound;
- (void)startPreventSleep;
- (void)stopPreventSleep;
@end
