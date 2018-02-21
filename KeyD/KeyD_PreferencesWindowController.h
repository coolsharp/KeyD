//
//  ISHPreferenceWindowController.h
//  isHUD
//
//  Created by ghawkgu on 11/20/11.
//  Copyright (c) 2011 ghawkgu.
//

#import <Cocoa/Cocoa.h>

@interface ISHPreferencesWindowController : NSWindowController
@property (assign) IBOutlet NSButtonCell *radioHotKeyOptionR;
@property (assign) IBOutlet NSButtonCell *radioHotKeyCommandR;
@property (assign) IBOutlet NSTextField *versionNumber;
@property (assign) IBOutlet NSTextField *displayDuration;
@property (assign) IBOutlet NSTextField *fadeIn;
@property (assign) IBOutlet NSTextField *fadeOut;
@property (assign) IBOutlet NSComboBox *cboDisplayMonitor;
- (IBAction)changeHotkey:(id)sender;
@end
