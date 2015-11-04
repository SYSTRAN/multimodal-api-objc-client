#import "SystranSpeechApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranSpeechAlignResponse.h"
#import "SystranSpeechDetectLanguageResponse.h"
#import "SystranSpeechSegmentResponse.h"
#import "SystranSpeechSupportedLanguagesResponse.h"
#import "SystranSpeechTranscribeResponse.h"


@interface SystranSpeechApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranSpeechApi

static SystranSpeechApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SystranConfiguration *config = [SystranConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SystranApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SystranApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SystranSpeechApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranSpeechApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranSpeechApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranSpeechApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SystranApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Align speech
/// Align text and audio files.
///  @param audioFile Audio file ([details](#description_audio_files)).
///
///  @param textFile Plain text file, ASCII, ISO-8859 or UTF8 encoded.\n\nThe text should include one sentence or clause per line ending with a punctuation mark.
///
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param model Model name
///
///  @param sampling Sampling quality of the audio file.\n * high: wide band audio such as radio and TV broadcast (sampling higher or equal to 16KHz)\n * low: telephone data with sampling rates higher or equal to 8KHz. It is highly recommended to not use a bit rate lower than 32Kbps.
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSpeechAlignResponse*
///
-(NSNumber*) multimodalSpeechAlignPostWithCompletionBlock: (NSURL*) audioFile
         textFile: (NSURL*) textFile
         lang: (NSString*) lang
         model: (NSString*) model
         sampling: (NSString*) sampling
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSpeechAlignResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'audioFile' is set
    if (audioFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `audioFile` when calling `multimodalSpeechAlignPost`"];
    }
    
    // verify the required parameter 'textFile' is set
    if (textFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `textFile` when calling `multimodalSpeechAlignPost`"];
    }
    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `multimodalSpeechAlignPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/speech/align"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(model != nil) {
        
        queryParams[@"model"] = model;
    }
    if(sampling != nil) {
        
        queryParams[@"sampling"] = sampling;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"audioFile"] = audioFile;
    
    
    
    files[@"textFile"] = textFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSpeechAlignResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSpeechAlignResponse*)data, error);
              }
          ];
}

///
/// Speech language detection
/// Detect languages from an audio file.
///  @param audioFile Audio file ([details](#description_audio_files)).
///
///  @param sampling Sampling quality of the audio file.\n * high: wide band audio such as radio and TV broadcast (sampling higher or equal to 16KHz)\n * low: telephone data with sampling rates higher or equal to 8KHz. It is highly recommended to not use a bit rate lower than 32Kbps.
///
///  @param maxSpeaker Maximum number of speakers. Default 1 for low sampling and infinity for high sampling
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSpeechDetectLanguageResponse*
///
-(NSNumber*) multimodalSpeechDetectLanguagePostWithCompletionBlock: (NSURL*) audioFile
         sampling: (NSString*) sampling
         maxSpeaker: (NSNumber*) maxSpeaker
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSpeechDetectLanguageResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'audioFile' is set
    if (audioFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `audioFile` when calling `multimodalSpeechDetectLanguagePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/speech/detectLanguage"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(sampling != nil) {
        
        queryParams[@"sampling"] = sampling;
    }
    if(maxSpeaker != nil) {
        
        queryParams[@"maxSpeaker"] = maxSpeaker;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"audioFile"] = audioFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSpeechDetectLanguageResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSpeechDetectLanguageResponse*)data, error);
              }
          ];
}

///
/// Segment speech
/// Segment an audio file.
///  @param audioFile Audio file ([details](#description_audio_files)).
///
///  @param sampling Sampling quality of the audio file.\n * high: wide band audio such as radio and TV broadcast (sampling higher or equal to 16KHz)\n * low: telephone data with sampling rates higher or equal to 8KHz. It is highly recommended to not use a bit rate lower than 32Kbps.
///
///  @param maxSpeaker Maximum number of speakers. Default 1 for low sampling and infinity for high sampling
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSpeechSegmentResponse*
///
-(NSNumber*) multimodalSpeechSegmentPostWithCompletionBlock: (NSURL*) audioFile
         sampling: (NSString*) sampling
         maxSpeaker: (NSNumber*) maxSpeaker
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSpeechSegmentResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'audioFile' is set
    if (audioFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `audioFile` when calling `multimodalSpeechSegmentPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/speech/segment"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(sampling != nil) {
        
        queryParams[@"sampling"] = sampling;
    }
    if(maxSpeaker != nil) {
        
        queryParams[@"maxSpeaker"] = maxSpeaker;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"audioFile"] = audioFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSpeechSegmentResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSpeechSegmentResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of languages in which Speech is supported.
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSpeechSupportedLanguagesResponse*
///
-(NSNumber*) multimodalSpeechSupportedLanguagesGetWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranSpeechSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/speech/supportedLanguages"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSpeechSupportedLanguagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSpeechSupportedLanguagesResponse*)data, error);
              }
          ];
}

///
/// Transcribe speech
/// Get text from an audio file.
///  @param audioFile Audio file ([details](#description_audio_files)).
///
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param model Model name
///
///  @param sampling Sampling quality of the audio file.\n * high: wide band audio such as radio and TV broadcast (sampling higher or equal to 16KHz)\n * low: telephone data with sampling rates higher or equal to 8KHz. It is highly recommended to not use a bit rate lower than 32Kbps.
///
///  @param maxSpeaker Maximum number of speakers. Default 1 for low sampling and infinity for high sampling
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSpeechTranscribeResponse*
///
-(NSNumber*) multimodalSpeechTranscribePostWithCompletionBlock: (NSURL*) audioFile
         lang: (NSString*) lang
         model: (NSString*) model
         sampling: (NSString*) sampling
         maxSpeaker: (NSNumber*) maxSpeaker
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSpeechTranscribeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'audioFile' is set
    if (audioFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `audioFile` when calling `multimodalSpeechTranscribePost`"];
    }
    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `multimodalSpeechTranscribePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/speech/transcribe"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(model != nil) {
        
        queryParams[@"model"] = model;
    }
    if(sampling != nil) {
        
        queryParams[@"sampling"] = sampling;
    }
    if(maxSpeaker != nil) {
        
        queryParams[@"maxSpeaker"] = maxSpeaker;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"audioFile"] = audioFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSpeechTranscribeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSpeechTranscribeResponse*)data, error);
              }
          ];
}



@end
