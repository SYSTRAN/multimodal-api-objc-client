#import "SystranImageApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranImageAnalyzeLayoutResponse.h"
#import "SystranImageAnalyzeRegionResponse.h"
#import "SystranSupportedLanguagesResponse.h"
#import "SystranImageTranscribeResponse.h"


@interface SystranImageApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranImageApi

static SystranImageApi* singletonAPI = nil;

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

+(SystranImageApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranImageApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranImageApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranImageApi alloc] init];
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
/// Image layout analysis
/// Analyze the layout of an image.
///  @param imageFile Image file
///
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranImageAnalyzeLayoutResponse*
///
-(NSNumber*) multimodalImageAnalyzeLayoutPostWithCompletionBlock: (NSURL*) imageFile
         lang: (NSString*) lang
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranImageAnalyzeLayoutResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'imageFile' is set
    if (imageFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `imageFile` when calling `multimodalImageAnalyzeLayoutPost`"];
    }
    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `multimodalImageAnalyzeLayoutPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/image/analyze/layout"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
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
    
    
    
    files[@"imageFile"] = imageFile;
    
    
    

    
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
                                         responseType: @"SystranImageAnalyzeLayoutResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranImageAnalyzeLayoutResponse*)data, error);
              }
          ];
}

///
/// Image region analysis
/// Analyze the region properties of an image.
///  @param imageFile Image file
///
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranImageAnalyzeRegionResponse*
///
-(NSNumber*) multimodalImageAnalyzeRegionPostWithCompletionBlock: (NSURL*) imageFile
         lang: (NSString*) lang
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranImageAnalyzeRegionResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'imageFile' is set
    if (imageFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `imageFile` when calling `multimodalImageAnalyzeRegionPost`"];
    }
    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `multimodalImageAnalyzeRegionPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/image/analyze/region"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
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
    
    
    
    files[@"imageFile"] = imageFile;
    
    
    

    
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
                                         responseType: @"SystranImageAnalyzeRegionResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranImageAnalyzeRegionResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of languages in which Image processing is supported.
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSupportedLanguagesResponse*
///
-(NSNumber*) multimodalImageSupportedLanguagesGetWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/image/supportedLanguages"];

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
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
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
                                         responseType: @"SystranSupportedLanguagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSupportedLanguagesResponse*)data, error);
              }
          ];
}

///
/// Image text transcription
/// Transcribe text from an image.
///  @param imageFile Image file
///
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranImageTranscribeResponse*
///
-(NSNumber*) multimodalImageTranscribePostWithCompletionBlock: (NSURL*) imageFile
         lang: (NSString*) lang
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranImageTranscribeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'imageFile' is set
    if (imageFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `imageFile` when calling `multimodalImageTranscribePost`"];
    }
    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `multimodalImageTranscribePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/image/transcribe"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
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
    
    
    
    files[@"imageFile"] = imageFile;
    
    
    

    
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
                                         responseType: @"SystranImageTranscribeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranImageTranscribeResponse*)data, error);
              }
          ];
}



@end
