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
@synthesize radioHotKeyOptionR;
@synthesize radioHotKeyCommandR;
@synthesize versionNumber;
@synthesize displayDuration;
@synthesize cboDisplayMonitor;

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
    
    [cboDisplayMonitor removeAllItems];

    int i = 0;
    for(NSScreen* screen in [NSScreen screens]) {
        NSDictionary* screenDictionary = [screen deviceDescription];
        NSNumber* screenID = [screenDictionary objectForKey:@"NSScreenNumber"];
        CGDirectDisplayID aID = [screenID unsignedIntValue];
        NSLog(@"Screen number %i is%@ builtin", i, CGDisplayIsBuiltin(aID)? @"": @" not");
        i++;
        
        [cboDisplayMonitor addItemWithObjectValue:CGDisplayIsBuiltin(aID)? [@"internal " stringByAppendingString:@(i).stringValue]: [@"external " stringByAppendingString:@(i).stringValue]];
    }
    
    [displayDuration setDelegate:self];
}

/*
 설정 값 가져오기
*/
- (void) loadPreference {
    NSString* displayDurationValue = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULT_KEY_DISPLAY_DURATION];
    if (nil != displayDurationValue) {
        [displayDuration setTitleWithMnemonic:displayDurationValue];
    }
}

- (void) saveValue:(NSTextField*) value {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* valueString = [value stringValue];
    NSLog(@"Display duration %@", valueString);
    [userDefaults setValue:valueString forKey:DEFAULT_KEY_DISPLAY_DURATION];
    [userDefaults synchronize];
    [(KeyDAppDelegate *)[NSApp delegate] loadPreferences];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    [self saveValue:textField];
    NSLog(@"controlTextDidChange: stringValue == %@", [textField stringValue]);
}
@end
