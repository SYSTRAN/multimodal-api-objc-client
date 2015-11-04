#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranSpeechWord.h"


@protocol SystranSpeechTranscribeSegment
@end

@interface SystranSpeechTranscribeSegment : SystranObject

/* Channel id 
 */
@property(nonatomic) NSNumber* channel;
/* Speaker id 
 */
@property(nonatomic) NSString* speaker;
/* Confidence for the detected speaker 
 */
@property(nonatomic) NSNumber* speakerConfidence;
/* Start time (in seconds) 
 */
@property(nonatomic) NSNumber* start;
/* End time (in seconds) 
 */
@property(nonatomic) NSNumber* end;
/* Detected language ([details](#description_langage_code_values)) 
 */
@property(nonatomic) NSString* lang;
/* Confidence for the detected language 
 */
@property(nonatomic) NSNumber* langConfidence;
/* Array of words 
 */
@property(nonatomic) NSArray<SystranSpeechWord>* words;

@end
