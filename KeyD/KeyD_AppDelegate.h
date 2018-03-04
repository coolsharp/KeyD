/**
 -----------------------------------------------------------------------------------------
 Description : 앱 기본 기능
 Date : 2018/02/22
 Author : coolsharp
 History : 설정 기능 추가
 -----------------------------------------------------------------------------------------
 **/

#import <Cocoa/Cocoa.h>
#import "KeyD_PreferencesWindowController.h"

@interface KeyDAppDelegate : NSObject <NSApplicationDelegate> {
@private
    BOOL fadingOut;
    float duration;
    int monitor;
}
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *isName;
@property (assign) IBOutlet NSMenu *statusMenu;
@property (assign) IBOutlet NSView *panelView;
@property (assign) IBOutlet NSImageView *isImage;
@property (retain) NSStatusItem *myStatusMenu;
@property (retain) KeyDPreferencesWindowController *preferencesController;

- (IBAction)quit:(id)sender;
- (IBAction)toggleLoginItem:(id)sender;
- (IBAction)openPreferences:(id)sender;

- (IBAction)showKeyD:(id)sender;
@end
