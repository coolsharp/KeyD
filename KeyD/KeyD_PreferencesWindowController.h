/*
 -----------------------------------------------------------------------------------------
 Description : 설정 화면 코드
 Date : 2018/02/22
 Author : coolsharp
 History : 설정 기능 추가
 -----------------------------------------------------------------------------------------
*/

#import <Cocoa/Cocoa.h>

@interface KeyDPreferencesWindowController : NSWindowController
@property (assign) IBOutlet NSButtonCell *radioHotKeyOptionR;
@property (assign) IBOutlet NSButtonCell *radioHotKeyCommandR;
@property (assign) IBOutlet NSTextField *versionNumber;
@property (assign) IBOutlet NSTextField *displayDuration;
@property (assign) IBOutlet NSComboBox *cboDisplayMonitor;
@end
