//
//  ISHPreferenceWindowController.m
//  isHUD
//
//  Created by ghawkgu on 11/20/11.
//  Copyright (c) 2011 ghawkgu.
//

#import "KeyD_PreferencesWindowController.h"
#import "KeyD_KeyCode.h"
#import "KeyD_Defaults.h"
#import "KeyD_AppDelegate+.h"

@implementation ISHPreferencesWindowController
@synthesize radioHotKeyOptionR;
@synthesize radioHotKeyCommandR;
@synthesize versionNumber;
@synthesize displayDuration;
@synthesize fadeIn;
@synthesize fadeOut;
@synthesize cboDisplayMonitor;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//ssh://coolsharp@58.226.214.120/volume1/homes/coolsharp/git/KD.git

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self.window setLevel:kCGMaximumWindowLevelKey];
    NSBundle *mainBundle = [NSBundle mainBundle];
    [self.versionNumber setStringValue:[mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSUInteger hotkey = [[NSUserDefaults standardUserDefaults] integerForKey:DEFAULT_KEY_SELECT_INPUT_SOURCE];
    
    [self.radioHotKeyOptionR setState:NSOffState];
    [self.radioHotKeyCommandR setState:NSOffState];
    
    if (hotkey == OPTION_R) {
        [self.radioHotKeyOptionR setState:NSOnState];
    } else if (hotkey == COMMAND_R) {
        [self.radioHotKeyCommandR setState:NSOnState];
    }
    
    [cboDisplayMonitor removeAllItems];

    int i = 0;
    for(NSScreen* screen in [NSScreen screens]) {
        NSDictionary* screenDictionary = [screen deviceDescription];
        NSNumber* screenID = [screenDictionary objectForKey:@"NSScreenNumber"];
        CGDirectDisplayID aID = [screenID unsignedIntValue];
        NSLog(@"Screen number %i is%@ builtin", i, CGDisplayIsBuiltin(aID)? @"": @" not");
        i++;
        
        [cboDisplayMonitor addItemWithObjectValue:CGDisplayIsBuiltin(aID)? @"internal": @"external"];
    }
    
    [displayDuration setTitleWithMnemonic:@"0.5"];
    [fadeIn setTitleWithMnemonic:@"0.25"];
    [fadeOut setTitleWithMnemonic:@"0.25"];
}

- (void) saveHotKey:(NSUInteger) hotkey {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:hotkey forKey:DEFAULT_KEY_SELECT_INPUT_SOURCE];
    [userDefaults synchronize];
    [(ISHAppDelegate *)[NSApp delegate] loadPreferences];
}

- (IBAction)changeHotkey:(id)sender {
    NSMatrix *matrix = (NSMatrix *)sender;
    
    if (matrix.selectedCell == self.radioHotKeyOptionR) {
        GHKLOG(@"Change hot key Option R");
        [self saveHotKey:OPTION_R];
    } else if (matrix.selectedCell == self.radioHotKeyCommandR) {
        GHKLOG(@"Change hot key Command R");
        [self saveHotKey:COMMAND_R];
    }
}
@end
