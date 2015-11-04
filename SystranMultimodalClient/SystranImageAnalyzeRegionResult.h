#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */



@protocol SystranImageAnalyzeRegionResult
@end

@interface SystranImageAnalyzeRegionResult : SystranObject

/* Region type 
 */
@property(nonatomic) NSString* type;
/* Background RGB color 
 */
@property(nonatomic) NSNumber* background;
/* Foreground RGB color 
 */
@property(nonatomic) NSNumber* foreground;
/* Region script 
 */
@property(nonatomic) NSString* script;
/* Font type 
 */
@property(nonatomic) NSString* fontType;

@end
