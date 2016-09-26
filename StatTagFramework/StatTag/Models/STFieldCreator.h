//
//  STFieldCreator.h
//  StatTag
//
//  Created by Eric Whitley on 7/12/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMSWord2011.h"

@interface STFieldCreator : NSObject {
//  NSString* _FieldOpen;
//  NSString* _FieldClose;
}

//@property (readonly, nonatomic) NSString* FieldOpen;
//@property (readonly, nonatomic) NSString* FieldClose;

+(NSString*)FieldOpen;
+(NSString*)FieldClose;


//extern NSString *const FieldOpen;
//extern NSString *const FieldClose;


-(NSArray<STMSWord2011Field*>*)InsertField:(STMSWord2011TextRange*)range theString:(NSString*)theString fieldOpen:(NSString*)fieldOpen fieldClose:(NSString*)fieldClose;
-(NSArray<STMSWord2011Field*>*)InsertField:(STMSWord2011TextRange*)range;
-(NSArray<STMSWord2011Field*>*)InsertField:(STMSWord2011TextRange*)range theString:(NSString*)theString;
-(NSArray<STMSWord2011Field*>*)InsertField:(STMSWord2011TextRange*)range theString:(NSString*)theString fieldOpen:(NSString*)fieldOpen;


@end