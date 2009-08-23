//
//  iPhoneInsomniaAppDelegate.m
//  iPhoneInsomnia
//
//  Created by Marco Peluso on 20.08.09.
//  Copyright Marco Peluso 2009. All rights reserved.
//

#import "iPhoneInsomniaAppDelegate.h"
#import "iPhoneInsomniaViewController.h"
#import "DeepSleepPreventer.h"

@implementation iPhoneInsomniaAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize deepSleepPreventer;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	// Here we create our deepSleepPreventer and get it to keep our iPhone from deep sleeping
	self.deepSleepPreventer = [[DeepSleepPreventer alloc] init];
	[self.deepSleepPreventer startPreventSleep];
	
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[deepSleepPreventer release];
    [viewController release];
    [window release];
    [super dealloc];
}

@end
