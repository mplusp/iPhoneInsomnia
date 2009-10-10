//
//  DeepSleepPreventer.h
//  iPhoneInsomnia
//
//  Created by Marco Peluso on 20.08.09.
//  Copyright 2009 Marco Peluso. All rights reserved.
//

//===============================================
#pragma mark -
#pragma mark Import
//===============================================

#import <Foundation/Foundation.h>




//===============================================
#pragma mark -
#pragma mark Forward Declaration
//===============================================

@class AVAudioPlayer;




//===============================================
#pragma mark -
#pragma mark Interface
//===============================================

@interface DeepSleepPreventer : NSObject
{
	AVAudioPlayer *audioPlayer;
	NSTimer *preventSleepTimer;
}




//===============================================
#pragma mark -
#pragma mark Property
//===============================================

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) NSTimer *preventSleepTimer;




//===============================================
#pragma mark -
#pragma mark Public Methods
//===============================================

- (void)playPreventSleepSound;	// FIXXXME: make this private
- (void)startPreventSleep;
- (void)stopPreventSleep;
- (void)setUpAudioSession;		// FIXXXME: make this private

@end
