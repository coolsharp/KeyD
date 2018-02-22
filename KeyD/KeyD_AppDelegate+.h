//
//  ISHAppDelegate+.h
//  isHUD
//
//  Created by ghawkgu on 11/20/11.
//  Copyright (c) 2011 ghawkgu.
//

#import "KeyD_AppDelegate.h"
#import <Carbon/Carbon.h>

@interface KeyDAppDelegate ()
@property (retain) NSTimer *timerToFadeOut;
@property (retain) NSTimer *timerForHotKeyDelay;

- (void) fadeInHud;
- (void) fadeOutHud;
- (void) didFadeIn;
- (void) didFadeOut;
@end

#pragma mark - Helpers
@interface KeyDAppDelegate (Helper)
-(void) dumpInputResource:(TISInputSourceRef)inputResource;
@end

#pragma mark - Login item helpers
@interface KeyDAppDelegate (LoginItem)
- (BOOL) isLoginItem;
- (void) addAppAsLoginItem;
- (void) deleteAppFromLoginItem;
@end

#pragma mark - HotKey
@interface KeyDAppDelegate (HotKey)
- (void)registerHotKey;
- (void)unregisterHotKey;
@end

#pragma mark - Preferences
@interface KeyDAppDelegate (Preferences)
-(void) registerDefaultPreferences;
-(void) loadPreferences;
@end
