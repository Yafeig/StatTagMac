//
//  StatTagWord2011AutomationTests.m
//  StatTag
//
//  Created by Eric Whitley on 7/11/16.
//  Copyright © 2016 StatTag. All rights reserved.
//

/*
 
 http://robnapier.net/scripting-bridge
 
 */

#import <XCTest/XCTest.h>
#import "StatTag.h"

//#import <Cocoa/Cocoa.h>
//#import <AppleScriptObjC/AppleScriptObjC.h>

//#import <StatTag/STMSWord2011TextRange+StatTagExtensions.h>


@interface StatTagWord2011AutomationTests : XCTestCase {
  STMSWord2011Application* app;
  STMSWord2011Document* doc;
}

@end

@implementation StatTagWord2011AutomationTests

- (void)setUp {
  [super setUp];
  
  app = [[[STGlobals sharedInstance] ThisAddIn] Application];
  doc = [app activeDocument];

}

- (void)tearDown {
  [super tearDown];
}

-(void)testAppleScriptBridge {

  //this works
//  STTag *tag = [[NSClassFromString(@"STTag") alloc] init];
//  tag.Name = @"my name";
//  NSLog(@"tag : %@", tag);
//  [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
//  
//  WordFind *find = [[NSClassFromString(@"WordFind") alloc] init];
//  NSLog(@"find : %@", find);
//  NSNumber *result = [find square: @3];
//  NSLog(@"Result: %@", result);
//  
//  
//  Class myClass = NSClassFromString(@"WordFind");
//  id<WordFindProtocol> myInstance = [[myClass alloc] init];
//  NSNumber *result2 = [myInstance square: @3];
//  NSLog(@"Result2: %@", result2);
  
  
  [WordHelpers TestAppleScript];
  
}

-(void)testWordAPI_ExecuteFind {
  
  //https://www.macosxautomation.com/applescript/apps/errata.html
  //http://appscript.sourceforge.net/asoc.html
  //http://stackoverflow.com/questions/25984559/objective-c-scripting-bridge-and-apple-remote-desktop
  //http://burnignorance.com/iphone-development-tips/call-apple-script-function-handler-from-cocoa-application/
  //http://stackoverflow.com/questions/16529800/pass-variable-or-string-from-os-x-cocoa-app-to-applescript
  //https://discussions.apple.com/thread/2642843?tstart=0
  //https://en.wikibooks.org/wiki/AppleScript_Programming/Sample_Programs/MS_Word_2008
  //http://stackoverflow.com/questions/14040096/office-mac-2011-how-to-create-a-new-word-document-and-save-it-with-applescript
  //http://macscripter.net/viewtopic.php?id=41958
  //http://www.satimage.fr/software/en/smile/computing/as_types/as_data_types.html
  //http://stackoverflow.com/questions/26935431/why-cant-i-add-these-two-strings-together
  //http://macscripter.net/viewtopic.php?pid=146835#p146835
  //http://macscripter.net/viewtopic.php?id=30478
  //http://pastebin.com/NJ6cG9BF
  //https://discussions.apple.com/thread/2642843?tstart=0
  //http://uchcode.github.io/2015/09/27/01.html

  STMSWord2011TextRange* range = [doc textObject];
  STMSWord2011Find *find = [range findObject];
  NSLog(@"BEGINNING: range -> start: %ld, end : %ld, content : %@", (long)[range startOfContent], (long)[range endOfContent], [range content]);
  
  BOOL really;
  STMSWord2011EFRt resultWorked;
  /*
   STMSWord2011EFRtTextRange = '\003\036\000\000',
   STMSWord2011EFRtInsertionPoint = '\003\036\000\001'
   */
  
  NSString* theText = @"<test field>";

  @try
  {
    
    resultWorked = [find executeFindFindText:theText
                    matchCase:YES
               matchWholeWord:YES //?
               matchWildcards:NO
              matchSoundsLike:NO
            matchAllWordForms:NO
                 matchForward:YES
                     wrapFind:STMSWord2011E265FindStop
                   findFormat:NO
                  replaceWith:@""
                      replace:STMSWord2011E273ReplaceNone];
    
//[result executeFindFindText:text matchCase:true matchWholeWord:false matchWildcards:false matchSoundsLike:false matchAllWordForms:false matchForward:true wrapFind:STMSWord2011E265FindStop findFormat:false replaceWith:@"" replace:STMSWord2011E273ReplaceNone]
    
//      [find executeFindFindText:@"FirstText"
//                         matchCase:YES
//                    matchWholeWord:YES
//                    matchWildcards:YES
//                   matchSoundsLike:NO
//                 matchAllWordForms:NO
//                      matchForward:YES
//                          wrapFind:STMSWord2011E265FindContinue
//                        findFormat:NO
//                       replaceWith:@"SecondText"
//                           replace:STMSWord2011E273ReplaceAll];
    
  }
  @catch(NSException * e)
  {
    NSLog(@"exception : %@", [e description]);
  }
  @finally
  {
  }

  NSLog(@"really : %hhd", really);
  NSLog(@"resultWorked : %u", resultWorked);
  NSLog(@"FOUND : %hhd", [find found]);
  NSLog(@"ENDING: range -> start: %ld, end : %ld, content : %@", (long)[range startOfContent], (long)[range endOfContent], [range content]);

  
}

-(void)testWordAPI_FieldInsert {
  //- (void) createNewFieldTextRange:(STMSWord2011TextRange *)textRange fieldType:(STMSWord2011E183)fieldType fieldText:(NSString *)fieldText preserveFormatting:(BOOL)preserveFormatting;  // Create a new field

  NSString* theText = @"<test field>";
  
//  STMSWord2011TextRange* aRange = [doc createRangeStart:[[doc textObject] startOfContent] end:([[doc textObject] startOfContent] + [theText length])];

  STMSWord2011TextRange* aRange = [doc createRangeStart:[[doc textObject] startOfContent] end:([[doc textObject] endOfContent])];

  
  NSLog(@"aRange -> start: %ld, end : %ld, content : %@", (long)[aRange startOfContent], (long)[aRange endOfContent], [aRange content]);
  
  STFieldCreator* creator = [[STFieldCreator alloc] init];
  NSArray<STMSWord2011Field*>* fields = [creator InsertField:aRange theString:@"<test field>"];
  NSLog(@"fields count : %lu, values : %@", (unsigned long)[fields count], fields);
  
//  [app createNewFieldTextRange:aRange fieldType:STMSWord2011E183FieldEmpty fieldText:@"sample field" preserveFormatting:false];
//  STMSWord2011Field* firstField = [app fields]
  
}

-(void)testWordAPI_Range {
  
  STMSWord2011Field* firstField = [[doc fields] firstObject];
  if(firstField != nil) {
    
    NSLog(@"firstField fieldText : %@", [firstField fieldText]);
    
    STMSWord2011TextRange* range = [firstField fieldCode];//which is a range...
    NSLog(@"range content : %@", [range content]);
    NSLog(@"range start : %ld , end : %ld", (long)[range startOfContent], (long)[range endOfContent]);
    
    STMSWord2011TextRange* rangeCopy = [doc createRangeStart:[range startOfContent] end:[range endOfContent]];
    
    NSLog(@"range: (%@), rangeCopy: (%@)", NSStringFromClass([range class]), NSStringFromClass([rangeCopy class]));

    NSLog(@"rangeCopy == range : %hhd", [rangeCopy isEqual:range]);
    NSLog(@"rangeCopy content : %@", [rangeCopy content]);
    NSLog(@"rangeCopy start : %ld , end : %ld", (long)[rangeCopy startOfContent], (long)[rangeCopy endOfContent]);
    
    NSLog(@"Properties same? %hhd", [[range properties] isEqualToDictionary: [rangeCopy properties]]);
    NSLog(@"range properties : %@", [range properties]);
    NSLog(@"rangeCopy properties : %@", [rangeCopy properties]);

    [rangeCopy select];
    //go look...
    
  } else {
    NSLog(@"field is nil");
  }
  

  
}

- (void)testExample {

  STMSWord2011Application* app = [[[STGlobals sharedInstance] ThisAddIn] Application];
  NSLog(@"app : %@", app);

  NSLog(@"app -> isRunning : %hhd", [app isRunning]);
  
  STMSWord2011Document* doc = [app activeDocument];
  NSLog(@"doc : %@", doc);
  
  NSLog(@"doc -> fullname : %@", [doc fullName]);
  NSLog(@"doc -> variables (count) : %lu", (unsigned long)[[doc variables] count]);
  NSLog(@"doc -> variables : %@", [doc variables]);

  STDocumentManager* manager = [[STDocumentManager alloc] init];
  
  [manager LoadCodeFileListFromDocument:doc];
  NSLog(@"GetCodeFileList : %@", [manager GetCodeFileList]);
  [manager AddCodeFile:@"/Users/ewhitley/Documents/work_other/NU/Word Plugin/_code/WindowsVersion/Word_Files_Working_Copies/simple-macro-test.do"];
  NSLog(@"GetCodeFileList : %@", [manager GetCodeFileList]);
  
  NSLog(@"GetTags : %@", [manager GetTags]);
  
  STStatsManager* stats = [[STStatsManager alloc] init:manager];
  for(STCodeFile* cf in [manager GetCodeFileList]) {
    NSLog(@"codeFile content: %@", [cf Content]);
    NSLog(@"original codeFile tags");
    NSLog(@"======================");
    for(STTag* tag in [cf Tags]) {
      NSLog(@"original codeFile tag -> name: %@, type: %@", [tag Name], [tag Type]);
      NSLog(@"original codeFile tag -> formatted result: %@", [tag FormattedResult]);
    }
    
    //STStatsManagerExecuteResult* result = [stats ExecuteStatPackage:cf];
    STStatsManagerExecuteResult* result = [stats ExecuteStatPackage:cf filterMode:[STConstantsParserFilterMode IncludeAll]];
    
    //[STConstantsParserFilterMode ExcludeOnDemand]
    
    NSLog(@"new codeFile tags");
    NSLog(@"======================");
    for(STTag* tag in [cf Tags]) {
      NSLog(@"new codeFile tag -> name: %@, type: %@", [tag Name], [tag Type]);
      NSLog(@"new codeFile tag -> formatted result: %@", [tag FormattedResult]);
    }

    
    NSLog(@"result length : %lu", (unsigned long)[[result UpdatedTags] count]);
    for(STTag* tag in [result UpdatedTags]) {
      NSLog(@"tag -> name: %@, type: %@", [tag Name], [tag Type]);
      NSLog(@"tag -> formatted result: %@", [tag FormattedResult]);
      //FormattedResult
    }
    
  }
  
}


@end
