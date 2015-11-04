#import "SystranFileApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranFileExtractTextResponse.h"
#import "SystranFileSupportedFormatsResponse.h"


@interface SystranFileApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranFileApi

static SystranFileApi* singletonAPI = nil;

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

+(SystranFileApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranFileApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranFileApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranFileApi alloc] init];
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
/// Extract text from a file
/// Extract text from a file.
///  @param inputFile Input File
///
///  @param lang Language code of the input ([details](#description_langage_code_values)) or `auto` for automatic detection
///
///  @param format Format of the input file.\n\nValid values are the mimetypes returned by the supportedFormats service.
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranFileExtractTextResponse*
///
-(NSNumber*) multimodalFileExtractTextPostWithCompletionBlock: (NSURL*) inputFile
         lang: (NSString*) lang
         format: (NSString*) format
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranFileExtractTextResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'inputFile' is set
    if (inputFile == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `inputFile` when calling `multimodalFileExtractTextPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/file/extract/text"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
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
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded", @"*/*"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"inputFile"] = inputFile;
    
    
    

    
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
                                         responseType: @"SystranFileExtractTextResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranFileExtractTextResponse*)data, error);
              }
          ];
}

///
/// Supported file formats
/// Get a list of supported file formats.
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranFileSupportedFormatsResponse*
///
-(NSNumber*) multimodalFileSupportedFormatsGetWithCompletionBlock: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranFileSupportedFormatsResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/multimodal/file/supportedFormats"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
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
                                         responseType: @"SystranFileSupportedFormatsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranFileSupportedFormatsResponse*)data, error);
              }
          ];
}



@end
