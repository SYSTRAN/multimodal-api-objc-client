#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranImageAnalyzeRegionResult.h"
#import "SystranErrorResponse.h"


@protocol SystranImageAnalyzeRegionResponse
@end

@interface SystranImageAnalyzeRegionResponse : SystranObject

/* Error at request level [optional]
 */
@property(nonatomic) SystranErrorResponse* error;

@property(nonatomic) SystranImageAnalyzeRegionResult* result;

@end
