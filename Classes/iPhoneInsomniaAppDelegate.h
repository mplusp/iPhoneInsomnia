//
//  iPhoneInsomniaAppDelegate.h
//  iPhoneInsomnia
//
//  Created by Marco Peluso on 20.08.09.
//  Copyright Marco Peluso 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iPhoneInsomniaViewController;
@class DeepSleepPreventer;

@interface iPhoneInsomniaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iPhoneInsomniaViewController *viewController;
	DeepSleepPreventer *deepSleepPreventer;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iPhoneInsomniaViewController *viewController;
@property (nonatomic, retain) DeepSleepPreventer *deepSleepPreventer;

@end

