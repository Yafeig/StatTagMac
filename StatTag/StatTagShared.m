//
//  StatTagShared.m
//  StatTag
//
//  Created by Eric Whitley on 9/22/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import "StatTagShared.h"


#import "StatTagFramework.h"
#import "MainTabViewController.h"
#import "ManageCodeFilesViewController.h"
#import "SettingsViewController.h"
#import "UpdateOutputViewController.h"
#import "StatTagNeedsWordViewController.h"
#import "AppEventListener.h"
#import "ViewUtils.h"
#import "FileMonitor.h"

@implementation StatTagShared

@synthesize docManager = _docManager;
@synthesize doc = _doc;
@synthesize app = _app;
@synthesize mainVC = _mainVC;

@synthesize propertiesManager = _propertiesManager;
@synthesize logManager = _logManager;
@synthesize fileMonitors = _fileMonitors;

static StatTagShared *sharedInstance = nil;

+ (StatTagShared*)sharedInstance {
  if (sharedInstance == nil) {
    sharedInstance = [[super allocWithZone:NULL] init];
  }
  
  return sharedInstance;
}

- (id)init
{
  self = [super init];
  if (self) {
    [self setWordAppStatusMessage:@""];
    [self setFileMonitors:[[NSMutableArray<FileMonitor*> alloc] init]];
    [self setLogManager:[[STLogManager alloc] init]];
  }
  return self;
}

-(void)dealloc
{
  for(FileMonitor* fm in [self fileMonitors])
  {
    [fm stopMonitoring];
  }
}

+ (id)allocWithZone:(NSZone*)zone {
  return [self sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}


+ (NSColor*)colorFromRGBRed:(CGFloat)r  green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
  //our colors weren't right, so... had to read up on color spaces
  //http://stackoverflow.com/questions/426979/how-do-i-create-nscolor-instances-that-exactly-match-those-in-a-photoshop-ui-moc
  
  CGFloat rFloat = ((int)r) % 256 / 255.0;
  CGFloat gFloat = ((int)g) % 256 / 255.0;
  CGFloat bFloat = ((int)b) % 256 / 255.0;

  return [NSColor colorWithCalibratedRed:rFloat green:gFloat blue:bFloat alpha:a];
}



-(void)initializeWordViews
{
  //mainWindow was hit or miss, so we're not using it - really unclear to me why this is nil during setup
  //  self.mainVC = (MainTabViewController*)[[[[NSApplication sharedApplication] mainWindow] windowController] contentViewController];//[[NSApp mainWindow] windowController];
  
  StatTagShared* shared = [StatTagShared sharedInstance];
  
  NSWindow *window = [[[NSApplication sharedApplication] windows] firstObject];

  
  //get our root view controller
  //  shared.mainVC = (MainTabViewController*)[[window windowController] contentViewController];
  //hrm... I wonder if we're screwing this up by assigning this here...

  MainTabViewController* t = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"MainTabViewController"];
  [[window windowController] setContentViewController:t];
  shared.mainVC = t;
    
  //set up some of our shared stattag stuff
  shared.app= [[[STGlobals sharedInstance] ThisAddIn] Application];
  shared.doc = [[shared app] activeDocument]; //this will be problematic ongoing when we open / close documents, etc.
  shared.docManager = [[STDocumentManager alloc] init];
  
  shared.logManager = [[STLogManager alloc] init];
  shared.propertiesManager = [[STPropertiesManager alloc] init];
  
  //get our code file list on startup
  //  [[shared docManager] LoadCodeFileListFromDocument:[shared doc]];
  
  // Set up Code File Manager
  //-----------
  //send over our managers, etc.
  ManageCodeFilesViewController* codeFilesVC = (ManageCodeFilesViewController*)[[[[shared mainVC ] tabView] tabViewItemAtIndex:(StatTagTabIndexes)ManageCodeFiles] viewController];
  shared.codeFilesViewController = codeFilesVC;
  codeFilesVC.documentManager = [shared docManager];
  //  codeFilesVC.codeFiles = [[shared docManager] GetCodeFileList]; //just for setup
  
  // Set up Preferences Manager
  //-----------
  SettingsViewController* settingsVC = (SettingsViewController*)[[[[shared mainVC ] tabView] tabViewItemAtIndex:(StatTagTabIndexes)Settings] viewController];
  settingsVC.propertiesManager = [shared propertiesManager];
  settingsVC.logManager = [shared logManager];
  [[settingsVC propertiesManager] Load];
  settingsVC.properties = [[shared propertiesManager] Properties]; //just for setup
  [[StatTagShared sharedInstance] setSettingsViewController: settingsVC];
  //  [propertiesManager Load];
  
  
  // Set up Code File Manager
  //-----------
  //send over our managers, etc.
  UpdateOutputViewController* updateOutputVC = (UpdateOutputViewController*)[[[[shared mainVC ] tabView] tabViewItemAtIndex:(StatTagTabIndexes)UpdateOutput] viewController];
  updateOutputVC.documentManager = [shared docManager];
  //updateOutputVC.codeFiles = [[shared docManager] GetCodeFileList]; //just for setup
  
  
  NSStoryboard* storyBoard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
  if(storyBoard != nil) {
    StatTagNeedsWordViewController* wc = [storyBoard instantiateControllerWithIdentifier:@"StatTagNeedsWordViewController"];
    shared.needsWordController = wc;
    
    //    [AppEventListener updateWordViewController];
    
    if([AppEventListener wordIsOK]) {
      [[shared docManager] LoadCodeFileListFromDocument:[shared doc]];
      codeFilesVC.codeFiles = [[shared docManager] GetCodeFileList]; //just for setup
      [[window windowController] setContentViewController:shared.mainVC ];
      [window setStyleMask:[window styleMask] | NSResizableWindowMask];
    } else {
      [[window windowController] setContentViewController:shared.needsWordController ];
      [window setStyleMask:[window styleMask] & ~NSResizableWindowMask];
    }
  }
}

-(void)setArchivedWindowFrame:(NSRect)archivedWindowFrame
{
  _archivedWindowFrame = archivedWindowFrame;

  //save our rect
  NSMutableDictionary* prefs = [[NSMutableDictionary alloc] init];
  [prefs setValue:NSStringFromRect(_archivedWindowFrame) forKey:@"windowRect"];
  [[NSUserDefaults standardUserDefaults] setPersistentDomain:prefs forName:[STCocoaUtil currentBundleIdentifier]];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSRect)archivedWindowFrame
{
  if(_archivedWindowFrame.size.height == 0)
  {
    //try to restore from preference
    NSDictionary* prefsDict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:[STCocoaUtil currentBundleIdentifier]];
    NSRect rect = NSRectFromString([prefsDict valueForKey:@"windowRect"]);
    _archivedWindowFrame = rect;
  }
  return _archivedWindowFrame;
}


-(void)saveWindowFrame
{
  NSWindow* window = [[[NSApplication sharedApplication] windows] firstObject];
  [[StatTagShared sharedInstance] setArchivedWindowFrame:[window frame]];
}

-(void)restoreWindowFrame
{
  NSWindow* window = [[[NSApplication sharedApplication] windows] firstObject];
  if([[window windowController] contentViewController] == [[StatTagShared sharedInstance] mainVC])
  {
    NSRect frame = [[StatTagShared sharedInstance] archivedWindowFrame];
    if(frame.size.width > 0) {
      [window setFrame:frame display:YES animate:YES];
    }
  }
}


@end
