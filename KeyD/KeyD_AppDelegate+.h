/**
 -----------------------------------------------------------------------------------------
 Description : 앱 기본 기능
 Date : 2018/02/22
 Author : coolsharp
 History : 설정 기능 추가
 -----------------------------------------------------------------------------------------
 **/

#import "KeyD_AppDelegate.h"
#import <Carbon/Carbon.h>

@interface KeyDAppDelegate ()
@property (retain) NSTimer *timerToFadeOut;
@property (retain) NSTimer *timerForHotKeyDelay;

- (void) fadeInKeyD;
- (void) fadeOutKeyD;;
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
-(void) loadPreferences;
@end
