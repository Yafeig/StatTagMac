//
//  OfficeMacVBAPublic.c
//  StatTag
//
//  Created by Eric Whitley on 8/3/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#include "OfficeMacVBAPublic.h"
#import <Cocoa/Cocoa.h>

#import "STWindowLauncher.h"

void StatTagOpenSettings()
{
  [STWindowLauncher openSettings];
}

void StatTagOpenUpdateOutput()
{
  [STWindowLauncher openUpdateOutput];
}
