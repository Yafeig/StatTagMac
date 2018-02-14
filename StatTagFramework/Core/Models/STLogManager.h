//
//  STLogManager.h
//  StatTag
//
//  Created by Eric Whitley on 7/29/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STIFileHandler.h"

@class STUserSettings;

@interface STLogManager : NSObject {
  BOOL _Enabled;
  NSURL* _LogFilePath;
  NSDateFormatter* dateFormatter;
  NSObject<STIFileHandler>* _FileHandler;
}

@property (nonatomic) BOOL Enabled;
@property (copy, nonatomic) NSURL* LogFilePath;

@property (strong, nonatomic) NSObject<STIFileHandler>* FileHandler;

+ (id)sharedInstance;

-(instancetype)init;
-(instancetype)initWithFileHandler:(NSObject<STIFileHandler>*)handler;

/**
 Determine if a given path is accessible and can be opened with write access.
 
 @param logFilePath : The file path to check
 
 @returns : True if the path is valid, false otherwise.
 */

-(BOOL)IsValidLogPath:(NSString*)logFilePath;


/**
 Updates the internal settings used by this log manager, when given a set of application settings.
 
 @remark : This should ba called any time the application settings are loaded or updated.
 
 @param settings : Application settings
 */
-(void)UpdateSettings:(STUserSettings*)settings;


/**
 Updates the internal settings used by this log manager, when given a set of application settings.
 
 @remark : This should ba called any time the application settings are loaded or updated. If the log path is not valid, we will disable logging.
 
 @param enabled : If logging is enabled by the user
 @param filePath : The path of the log file to write to.
 */
-(void)UpdateSettings:(BOOL)enabled filePath:(NSString*)filePath;


/**
 Writes a message to the log file.
 @remark : Can be safely called any time, even if logging is disabled.
 @param text : The text to write to the log file.
 */
-(void) WriteMessage:(NSString*)text;

/**
 Writes the details of an exception to the log file.
 @remark Can be safely called any time, even if logging is disabled. Recursively called for all inner exceptions.
 @param exc : The exception to write to the log file.
 */
//-(void)WriteException:(NSException*) exc;
-(void)WriteException:(id) exc;

//#define LOG_STATTAGFRAMEWORK_MESSAGE(var, ...) [[STLogManager sharedInstance] WriteMessage:var, ## __VA_ARGS__]
//#define LOG_STATTAGFRAMEWORK_EXCEPTION(var, ...) [[STLogManager sharedInstance] logManager] WriteException:var, ## __VA_ARGS__]


@end
