//
//  DeepSleepPreventer.m
//  iPhoneInsomnia
//
//  Created by Marco Peluso on 20.08.09.
//  Copyright 2009 Marco Peluso. All rights reserved.
//

#import "DeepSleepPreventer.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation DeepSleepPreventer

@synthesize audioPlayer;
@synthesize preventSleepTimer;

- (id)init
{
    if ((self = [super init])) {
		// Activate audio session
		AudioSessionSetActive(true);
		// Set up audio session, to prevent iPhone from deep sleeping, while playing sounds
		UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
		AudioSessionSetProperty (
			kAudioSessionProperty_AudioCategory,
			sizeof (sessionCategory), 
			&sessionCategory
		);
		
		// Set up sound file
		NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"noSound"
																  ofType:@"wav"];
		NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
		
		// Set up audio player with sound file
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
		[self.audioPlayer prepareToPlay];
		
		// You may want to set this to 0.0 even if your sound file is silent.
		// I don't know exactly, if this affects battery life, but it can't hurt.
		[self.audioPlayer setVolume:0.0];
	}
    return self;
}

- (void)playPreventSleepSound {
	[self.audioPlayer play];
}

- (void)startPreventSleep {
	// We need to play a sound at least every 10 seconds to keep the iPhone awake.
	// We create a new repeating timer, that begins firing now and then every ten seconds.
	// Every time it fires, it calls -playPreventSleepSound
	self.preventSleepTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0]
												  interval:10.0
													target:self
												  selector:@selector(playPreventSleepSound)
												  userInfo:nil
												   repeats:YES];
	// We add this timer to the current run loop
	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	[runLoop addTimer:self.preventSleepTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopPreventSleep {
	[self.preventSleepTimer invalidate];
	self.preventSleepTimer = nil;
}

// Don't forget Memory management:
- (void)dealloc {
	[preventSleepTimer release];
	[audioPlayer release];
	[super dealloc];
}

@end