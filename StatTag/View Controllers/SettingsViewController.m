//
//  SettingsViewController.m
//  StatTag
//
//  Created by Eric Whitley on 9/21/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

/*
 For word wrapping on the file path, go to the size inspector and set "first runtime layout width" under "preferred width"
 */

#import "SettingsViewController.h"
#import "StatTagFramework.h"
#import "StatTagShared.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize buttonChooseFile;
@synthesize checkboxLogging;
@synthesize labelFilePath;
@synthesize boxView;
@synthesize boxGeneral;


@synthesize settings = _settings;
@synthesize settingsManager = _settingsManager;
@synthesize logManager = _logManager;

//we don't need this one...
//NSString* const ExecutableFileFilter = @"Application Executable|*.exe";
//NSString* const LogFileFilter = @"Log File|*.log";
NSString* const allowedExtensions_Log = @"txt/TXT/log/LOG";
NSString* const defaultLogFileName = @"StatTag.log";


- (void)viewWillLayout {
  [[self boxGeneral] setBoxType:NSBoxCustom];
  [[self boxGeneral] setBorderType:NSLineBorder];
  [[self boxGeneral] setFillColor:[NSColor whiteColor]];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  ////NSLog(@"SettingsViewController loaded");
}

-(void)viewWillAppear {
  [[self settingsManager] Load];
  self.settings = [[self settingsManager] Settings]; //just for setup
  [self setup];
}

- (void)awakeFromNib {
}

- (NSString *)nibName
{
  return @"SettingsViewController";
}

//restoring at runtime with storyboards
-(id) initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if(self) {
    [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController" owner:self topLevelObjects:nil];
  }
  return self;
}


-(void)setDefaultPath {
  //NSFileManager* fileManager = [NSFileManager defaultManager];
  //NSString* homeDirectory = NSHomeDirectory();
  NSString* documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
  
  [[self labelFilePath] setStringValue: [documentsDirectory stringByAppendingPathComponent:defaultLogFileName]];
}

-(void)setup {
  [[self checkboxLogging] setState: [[self settings] EnableLogging] ? NSOnState : NSOffState];
  if([[self settings] LogLocation] != nil && [[[self settings] LogLocation] length] > 0 && ![[[self settings] LogLocation] isEqualToString:@"Log Path Not Set"] && [[self logManager] IsValidLogPath: [[self settings] LogLocation]]) {
    [[self labelFilePath] setStringValue: [[self settings] LogLocation]];
  } else {
    [self setDefaultPath];
  }
  
  [self UpdateLoggingControls];
}

- (IBAction)checkboxLoggingChanged:(id)sender {
  [self UpdateLoggingControls];
  [self saveSettings];
}

- (IBAction)labelFilePathClicked:(id)sender {
}

- (IBAction)chooseFile:(id)sender {
  
  NSOpenPanel* openPanel = [NSOpenPanel openPanel];
  [openPanel setCanChooseFiles:YES];
  [openPanel setCanChooseDirectories:YES];
  [openPanel setCanSelectHiddenExtension:NO];
  [openPanel setPrompt:@"Select a File"];
  [openPanel setAllowsMultipleSelection:NO];
  
  
  NSArray<NSString*>* types = [allowedExtensions_Log pathComponents];
  [openPanel setAllowedFileTypes:types];
  
  
  BOOL isDir;
  NSFileManager* fileManager = [NSFileManager defaultManager];
  
  if ( [openPanel runModal] == NSModalResponseOK )
  {
    NSArray<NSURL*>* files = [openPanel URLs];
    
    for( NSInteger i = 0; i < [files count]; i++ )
    {
      NSURL* url = [files objectAtIndex:i];
      if ([fileManager fileExistsAtPath:[url path] isDirectory:&isDir] && isDir) {
        url = [url URLByAppendingPathComponent:defaultLogFileName];
      }
      
      [[self labelFilePath] setStringValue:[url path]];
    }
    
    [self saveSettings];
    
  }
  
  
}

-(void)saveSettings {
  [[self settings] setEnableLogging:[[self checkboxLogging] state ] == NSOnState ? YES : NO ];
  [[self settings] setLogLocation:[labelFilePath stringValue]];
  
  if ([[self settings] EnableLogging] && ![[self logManager] IsValidLogPath: [[self settings] LogLocation]])
  {
    [STUIUtility WarningMessageBoxWithTitle:@"Unable to access debug file." andDetail:@"The debug file you have selected appears to be invalid, or you do not have rights to access it.\r\nPlease select a valid path for the debug file, or disable debugging." logger:nil];
  } else {
    [[self settingsManager] setSettings:[self settings]];
    [[self settingsManager] Save];
    [[self logManager] UpdateSettings:[self settings]];
    //[[self logManager] UpdateSettings:[self properties]];
  }
}

-(void) UpdateLoggingControls
{
  BOOL enabled = [[self checkboxLogging] state]  == NSOnState ? YES : NO ;
  if (enabled == NO) {
    [[self labelFilePath] setTextColor:[NSColor grayColor]];
  } else {
    [[self labelFilePath] setTextColor:[NSColor controlTextColor]];
  }
}




@end
