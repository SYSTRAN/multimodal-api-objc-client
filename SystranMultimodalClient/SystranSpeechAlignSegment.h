#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranSpeechWord.h"


@protocol SystranSpeechAlignSegment
@end

@interface SystranSpeechAlignSegment : SystranObject

/* Channel id 
 */
@property(nonatomic) NSNumber* channel;
/* Start time (in seconds) 
 */
@property(nonatomic) NSNumber* start;
/* End time (in seconds) 
 */
@property(nonatomic) NSNumber* end;
/* Detected language ([details](#description_langage_code_values)) 
 */
@property(nonatomic) NSString* lang;
/* Confidence for the text 
 */
@property(nonatomic) NSNumber* textConfidence;
/* Array of words 
 */
@property(nonatomic) NSArray<SystranSpeechWord>* words;

@end
