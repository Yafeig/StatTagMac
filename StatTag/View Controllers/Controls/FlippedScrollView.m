//
//  FlippedScrollView.m
//  StatTag
//
//  Created by Eric Whitley on 10/4/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import "FlippedScrollView.h"

@implementation FlippedScrollView

- (void)drawRect:(NSRect)dirtyRect {
  [super drawRect:dirtyRect];
}

-(BOOL)isFlipped {
  return true;
}

@end
