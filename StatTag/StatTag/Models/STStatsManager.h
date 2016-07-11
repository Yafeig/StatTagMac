//
//  STStatsManager.h
//  StatTag
//
//  Created by Eric Whitley on 7/8/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STTag;
@class STDocumentManager;

/**
 Used exclusively by ExecuteStatPackage as its return value type.
 */
@interface STStatsManagerExecuteResult : NSObject {
  BOOL _Success;
  NSMutableArray<STTag*>* UpdatedTags;
}

/**
 Did the call to ExecuteStatPackage complete without any errors
 */
@property BOOL Success;
/**
 A list of Tags that were detected as having changed values since they
 were originally inserted into the document
*/
@property (copy, nonatomic) NSMutableArray<STTag*>* UpdatedTags;


@end


/**
 Manages the execution of code files in the correct statistical package.
 */
@interface STStatsManager : NSObject {
  STDocumentManager* _Manager;
}

@property (strong, nonatomic) STDocumentManager* Manager;

-(instancetype)init:(STDocumentManager*)manager;

@end