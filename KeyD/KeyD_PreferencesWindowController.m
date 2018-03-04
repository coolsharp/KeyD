/*
 -----------------------------------------------------------------------------------------
 Description : 설정 화면 코드
 Date : 2018/02/22
 Author : coolsharp
 History : 설정 기능 추가
 -----------------------------------------------------------------------------------------
*/

#import "KeyD_PreferencesWindowController.h"
#import "KeyD_Defaults.h"
#import "KeyD_AppDelegate+.h"

@implementation KeyDPreferencesWindowController
@synthesize versionNumber;
@synthesize displayDuration;
@synthesize displayMonitor;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self.window setLevel:kCGMaximumWindowLevelKey];
    NSBundle *mainBundle = [NSBundle mainBundle];
    [self.versionNumber setStringValue:[mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    
    [self loadPreference];
    
    [displayMonitor setDelegate:self];
    [displayDuration setDelegate:self];
}

/*
 설정 값 가져오기
*/
- (void) loadPreference {
    NSString* displayMonitorValue = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULT_KEY_DISPLAY_MONITOR];
    if (nil != displayMonitorValue) {
        [displayMonitor setTitleWithMnemonic:displayMonitorValue];
    }
    NSString* displayDurationValue = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULT_KEY_DISPLAY_DURATION];
    if (nil != displayDurationValue) {
        [displayDuration setTitleWithMnemonic:displayDurationValue];
    }
}

- (void) saveValue:(NSTextField*) value {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* valueString = [value stringValue];
    int tag = [value tag];
    if (1000 == tag) {
        [userDefaults setValue:valueString forKey:DEFAULT_KEY_DISPLAY_MONITOR];
    }
    else if (2000 == tag) {
        [userDefaults setValue:valueString forKey:DEFAULT_KEY_DISPLAY_DURATION];
    }
    [userDefaults synchronize];
    [(KeyDAppDelegate *)[NSApp delegate] loadPreferences];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    [self saveValue:textField];
    NSLog(@"controlTextDidChange: stringValue == %@", [textField stringValue]);
}
@end
