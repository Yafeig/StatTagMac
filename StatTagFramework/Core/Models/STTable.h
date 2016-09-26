//
//  STTable.h
//  StatTag
//
//  Created by Eric Whitley on 6/14/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STJSONable.h"
#import "STConstants.h"


/**
  A table is a generic representation of a matrix, vector, list, etc. from different
  statistical packages.  It provides a consistent interface across the statistical
  package representations, but is not necessarily an optimized view of the data.
 */
@interface STTable : NSObject<STJSONAble> {
  NSMutableArray<NSString*>* _RowNames;
  NSMutableArray<NSString*>* _ColumnNames;
  int _RowSize;
  int _ColumnSize;
  NSMutableArray<NSNumber*>* _Data; //type is double
  NSMutableArray<NSString*>* _FormattedCells;
}

@property (strong, nonatomic) NSMutableArray<NSString*>* RowNames;
@property (strong, nonatomic) NSMutableArray<NSString*>* ColumnNames;
@property int RowSize;
@property int ColumnSize;
@property (strong, nonatomic) NSMutableArray<NSNumber*>* Data; //type is double
@property (strong, nonatomic) NSMutableArray<NSString*>* FormattedCells;

-(id)init;
-(id)init:(NSArray <NSString *>*)rowNames columnNames:(NSArray <NSString *>*)columnNames rowSize:(int)rowSize columnSize:(int)columnSize data:(NSArray <NSNumber *>*)data;

-(BOOL)isEmpty;
-(NSString*)ToString; //used by STTableFormat



//MARK: JSON
-(NSDictionary *)toDictionary;
-(NSString*)Serialize:(NSError**)error;
+(NSString*)SerializeList:(NSArray<STTable*>*)list error:(NSError**)error;
+(NSArray<STTable*>*)DeserializeList:(id)List error:(NSError**)error;
-(instancetype)initWithDictionary:(NSDictionary*)dict;
-(instancetype)initWithJSONString:(NSString*)JSONString error:(NSError**)error;


@end
