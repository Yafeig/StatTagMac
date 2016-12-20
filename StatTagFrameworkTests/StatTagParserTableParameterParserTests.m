//
//  StatTagParserTableParameterParser.m
//  StatTag
//
//  Created by Eric Whitley on 6/29/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StatTagFramework.h"

@interface StatTagParserTableParameterParserTests : XCTestCase

@end

@implementation StatTagParserTableParameterParserTests

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}

- (void)testParse_EmptyParams_Defaults {
  
  STTag* tag = [[STTag alloc] init];
  
  [STTableParameterParser Parse:@"Table" tag:tag];
  
  XCTAssert([[STConstantsRunFrequency Always] isEqualToString:[tag RunFrequency]]);
  XCTAssertEqual([STConstantsTableParameterDefaults FilterEnabled], [[[tag TableFormat] ColumnFilter] Enabled]);
  XCTAssertEqual([STConstantsTableParameterDefaults FilterEnabled], [[[tag TableFormat] RowFilter] Enabled]);

}

- (void)testParse_SingleParams {
  
  // Check each parameter by itself to ensure there are no spacing/boundary errors in our regex
  STTag* tag = [[STTag alloc] init];
  
  [STTableParameterParser Parse:@"Table(Label=\"Test\")" tag:tag];
  XCTAssert([@"Test" isEqualToString:[tag Name]]);

  [STTableParameterParser Parse:@"Table(ColumnNames=True)" tag:tag];
  XCTAssertFalse([[[tag TableFormat] ColumnFilter] Enabled]);

  [STTableParameterParser Parse:@"Table(RowNames=True)" tag:tag];
  XCTAssertFalse([[[tag TableFormat] RowFilter] Enabled]);
  

}

//- (void)testParse_AllParams {
//  
//  STTag* tag = [[STTag alloc] init];
//  
//  [STTableParameterParser Parse:@"Table(Label=\"Test\", ColumnNames=True, RowNames=False)" tag:tag];
//  XCTAssert([@"Test" isEqualToString:[tag Name]]);
//  XCTAssertTrue([[tag TableFormat] IncludeColumnNames]);
//  XCTAssertFalse([[tag TableFormat] IncludeRowNames]);
//
//  
//  // Run it again, flipping the order of parameters to test it works in any order
//  [STTableParameterParser Parse:@"Table(RowNames=True, ColumnNames=False, Label=\"Test\")" tag:tag];
//  XCTAssert([@"Test" isEqualToString:[tag Name]]);
//  XCTAssertFalse([[tag TableFormat] IncludeColumnNames]);
//  XCTAssertTrue([[tag TableFormat] IncludeRowNames]);
//  
//  // Run one more time, playing around with spacing
//  [STTableParameterParser Parse:@"Table( RowNames = True , ColumnNames = True , Label = \"Test\" ) " tag:tag];
//  XCTAssert([@"Test" isEqualToString:[tag Name]]);
//  XCTAssertTrue([[tag TableFormat] IncludeColumnNames]);
//  XCTAssertTrue([[tag TableFormat] IncludeRowNames]);
//
//  
//}


-(void)testParse_ReturnDefaults
{
  XCTAssertTrue(false);

//  // If the table filter values aren't set, make sure we set defaults.
//  var tag = new Tag();
//  TableParameterParser.Parse("Table(Label=\"Test\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterEnabled, tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.ColumnFilter.Value);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterEnabled, tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.RowFilter.Value);
}

-(void)testParse_AllParams
{
  XCTAssertTrue(false);

//  var tag = new Tag();
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=True, ColFilterType=\"Exclude\", ColFilterValue=\"1,3-5\", RowFilterEnabled=True, RowFilterType=\"Include\", RowFilterValue=\"2\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.ColumnFilter.Value);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("Include", tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual("2", tag.TableFormat.RowFilter.Value);
//  
//  // Run it again, flipping the order of parameters to test it works in any order
//  TableParameterParser.Parse("Table(ColFilterEnabled=True, Label=\"Test\", RowFilterEnabled=True, ColFilterType=\"Exclude\", RowFilterValue=\"2\", ColFilterValue=\"1,3-5\", RowFilterType=\"Include\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.ColumnFilter.Value);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("Include", tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual("2", tag.TableFormat.RowFilter.Value);
//  
//  // Run one more time, playing around with spacing
//  TableParameterParser.Parse("Table( RowNames = True , ColumnNames = True , Label = \"Test\" ) ", tag);
//  TableParameterParser.Parse("Table ( ColFilterEnabled = True, Label  = \"Test\", RowFilterEnabled=  True, ColFilterType  =\"Exclude\", RowFilterValue=  \"2\", ColFilterValue=\"1,3-5\", RowFilterType=\"Include\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.ColumnFilter.Value);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("Include", tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual("2", tag.TableFormat.RowFilter.Value);
}

-(void)testParse_ColFilter
{
  XCTAssertTrue(false);

//  var tag = new Tag();
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=True, ColFilterType=\"Exclude\", ColFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.ColumnFilter.Value);
//  
//  // Default value
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=True, ColFilterType=\"Exclude\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.ColumnFilter.Value);
//  
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=True, ColFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.ColumnFilter.Value);
//  
//  // If someone says a filter is enabled but turns on nothing else, we will allow it.  It's the same as turning
//  // off the filter, so maybe we should disable it, but won't do that for now.
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=True)", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.ColumnFilter.Value);
//  
//  // If the filter is not enabled, we are going to ignore that any other parameters exist for the filter
//  TableParameterParser.Parse("Table(Label=\"Test\", ColFilterEnabled=False, ColFilterType=\"Exclude\", ColFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsFalse(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Value);
}

-(void)testParse_RowFilter
{
  XCTAssertTrue(false);

//  var tag = new Tag();
//  TableParameterParser.Parse("Table(Label=\"Test\", RowFilterEnabled=True, RowFilterType=\"Exclude\", RowFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.RowFilter.Value);
//  
//  // Default value
//  TableParameterParser.Parse("Table(Label=\"Test\", RowFilterEnabled=True, RowFilterType=\"Exclude\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("Exclude", tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.RowFilter.Value);
//  
//  TableParameterParser.Parse("Table(Label=\"Test\", RowFilterEnabled=True, RowFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual("1,3-5", tag.TableFormat.RowFilter.Value);
//  
//  // If someone says a filter is enabled but turns on nothing else, we will allow it.  It's the same as turning
//  // off the filter, so maybe we should disable it, but won't do that for now.
//  TableParameterParser.Parse("Table(Label=\"Test\", RowFilterEnabled=True)", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterType, tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual(Constants.TableParameterDefaults.FilterValue, tag.TableFormat.RowFilter.Value);
//  
//  // If the filter is not enabled, we are going to ignore that any other parameters exist for the filter
//  TableParameterParser.Parse("Table(Label=\"Test\", RowFilterEnabled=False, RowFilterType=\"Exclude\", RowFilterValue=\"1,3-5\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsFalse(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Value);
}

/// <summary>
/// We moved from row/column name attributes to row/column filters in v2.  We set up a migration path for
/// those who created tags in v1, and this verifies that those tags are automatically converted as we would
/// expect.  This also verifies we can continue to parse those attributes, even though they won't be
/// officially supported going forward.
/// </summary>
-(void)testParse_v1_To_v2_Migration
{
  XCTAssertTrue(false);
//  var tag = new Tag();
//  TableParameterParser.Parse("Table(Label=\"Test\", ColumnNames=True, RowNames=False)", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("1", tag.TableFormat.RowFilter.Value);
//  Assert.AreEqual(Constants.FilterType.Exclude, tag.TableFormat.RowFilter.Type);
//  Assert.IsFalse(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Value);
//  
//  // Run it again, flipping the order of parameters to test it works in any order
//  TableParameterParser.Parse("Table(RowNames=False, ColumnNames=True, Label=\"Test\")", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("1", tag.TableFormat.RowFilter.Value);
//  Assert.AreEqual(Constants.FilterType.Exclude, tag.TableFormat.RowFilter.Type);
//  Assert.IsFalse(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Type);
//  Assert.AreEqual(string.Empty, tag.TableFormat.ColumnFilter.Value);
//  
//  // Playing around with spacing
//  TableParameterParser.Parse("Table( RowNames = False , ColumnNames = False , Label = \"Test\" ) ", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual("1", tag.TableFormat.RowFilter.Value);
//  Assert.AreEqual(Constants.FilterType.Exclude, tag.TableFormat.RowFilter.Type);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("1", tag.TableFormat.ColumnFilter.Value);
//  Assert.AreEqual(Constants.FilterType.Exclude, tag.TableFormat.ColumnFilter.Type);
//  
//  // Run one more time, with just columns
//  TableParameterParser.Parse("Table( RowNames = True , ColumnNames = False , Label = \"Test\" ) ", tag);
//  Assert.AreEqual("Test", tag.Name);
//  Assert.IsTrue(tag.TableFormat.ColumnFilter.Enabled);
//  Assert.AreEqual("1", tag.TableFormat.ColumnFilter.Value);
//  Assert.AreEqual(Constants.FilterType.Exclude, tag.TableFormat.ColumnFilter.Type);
//  Assert.IsFalse(tag.TableFormat.RowFilter.Enabled);
//  Assert.AreEqual(string.Empty, tag.TableFormat.RowFilter.Type);
//  Assert.AreEqual(string.Empty, tag.TableFormat.RowFilter.Value);
}

@end