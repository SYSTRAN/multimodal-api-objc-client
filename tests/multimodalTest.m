#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SystranApiClient.h"
#import "SystranFileApi.h"
#import "SystranSpeechApi.h"
#import "SystranConfiguration.h"
@interface multimodalTest : XCTestCase {
    NSString *key;
    NSString *path;
    NSString *sample;
    SystranConfiguration *configuration;
    SystranFileApi *fileApi;
    SystranSpeechApi *speechApi;
    NSURL *lidAudioFilePath;
    NSURL *alignmentAudioFilePath;
    NSURL *file;
}

@end

@implementation multimodalTest

- (void)setUp {
    
    lidAudioFilePath =  [[NSURL alloc] initFileURLWithPath:@"<SPEECH_LID_FILE_PATH_HERE>"];
    alignmentAudioFilePath =  [[NSURL alloc] initFileURLWithPath:@"<SPEECH_ALIGN_FILE_PATH_HERE>"];
    file  =  [[NSURL alloc] initFileURLWithPath:@"<SPEECH_TEXT_FILE_PATH_HERE>"];
    
    path = @"<API_KEY_FILE_PATH_HERE>";
    key = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [[SystranConfiguration sharedConfig] setApiKey:key forApiKeyIdentifier:@"key"];
    [[SystranConfiguration sharedConfig] setHost:@"https://platform.systran.net:8904"];
    
    speechApi = [[SystranSpeechApi alloc]init];
    fileApi = [[SystranFileApi alloc]init];
    
    sample = @"The quick brown fox jumps over the lazy dog";
}

- (void)testSupportedFileFormats {
    
    NSNumber* tags = nil;
    NSString *callback = nil;
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSupportedFileFormats"];
    
    //  NSArray* status = [[NSArray alloc] initWithObjects:@"available", nil];
    [fileApi multimodalFileSupportedFormatsGetWithCompletionBlock: tags callback: callback completionHandler:^(SystranFileSupportedFormatsResponse *fileResponse, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(fileResponse == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",fileResponse);
            XCTAssertNotNil(fileResponse, @"Pass");
            [expectation fulfill];
            
        }
    }];
    
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testmultimodalFileExtraction {
    XCTestExpectation *expectation = [self expectationWithDescription:@"testFileExtraction"];
    
    [fileApi multimodalFileExtractTextPostWithCompletionBlock:file lang:@"auto" format:nil profile:nil callback:nil completionHandler:^(SystranFileExtractTextResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to extract file content");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSpeechSupportedLanguages {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSupportedLanguages"];
    [speechApi multimodalSpeechSupportedLanguagesGetWithCompletionBlock:nil completionHandler:^(SystranSpeechSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch supported languages");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSpeechTranscription {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSpeechTranscription"];
    
    
    [speechApi multimodalSpeechTranscribePostWithCompletionBlock:lidAudioFilePath lang: @"en" model:nil sampling:nil maxSpeaker:nil callback:nil completionHandler:^(SystranSpeechTranscribeResponse *output, NSError *error)
     {
         if(error) {
             XCTFail(@"got error %@", error);
         }
         if(output == nil){
             XCTFail(@"failed to transcribe");
         }
         else {
             NSLog(@"%@",output);
             XCTAssertNotNil(output, @"Pass");
             [expectation fulfill];
         }
     }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSpeechSegmentation {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSpeechSegmentation"];
    
    
    [speechApi multimodalSpeechSegmentPostWithCompletionBlock:lidAudioFilePath sampling:nil maxSpeaker:nil callback:nil completionHandler:^(SystranSpeechSegmentResponse *output, NSError *error)     {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to segment speech");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSpeechLanguageDetection {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testLanguageDetection"];
    
    
    [speechApi multimodalSpeechDetectLanguagePostWithCompletionBlock:lidAudioFilePath sampling:nil maxSpeaker:nil callback:nil completionHandler:^(SystranSpeechDetectLanguageResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to detect language");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSpeechAlignment {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"testSpeechAlignment"];
    
    [speechApi multimodalSpeechAlignPostWithCompletionBlock:alignmentAudioFilePath textFile:file lang:@"en" model:nil sampling:nil callback:nil completionHandler:^(SystranSpeechAlignResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to  align speech");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}




@end