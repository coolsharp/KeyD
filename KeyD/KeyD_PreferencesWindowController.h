/**********************************************************************************************
 Description : 설정 화면 헤더
 Date : 2018/02/22
 Author : coolsharp
 History : 설정 기능 추가
 ******************************************************************************coolsharp 2017**/

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
