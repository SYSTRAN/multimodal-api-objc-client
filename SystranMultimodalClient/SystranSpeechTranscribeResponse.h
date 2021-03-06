#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranSpeechTranscribeSegment.h"
#import "SystranSpeechTranscribeSpeaker.h"
#import "SystranSpeechChannel.h"
#import "SystranErrorResponse.h"


@protocol SystranSpeechTranscribeResponse
@end

@interface SystranSpeechTranscribeResponse : SystranObject

/* Error at request level [optional]
 */
@property(nonatomic) SystranErrorResponse* error;
/* Array of channels 
 */
@property(nonatomic) NSArray<SystranSpeechChannel>* channels;
/* Array of speakers 
 */
@property(nonatomic) NSArray<SystranSpeechTranscribeSpeaker>* speakers;
/* Array of segments 
 */
@property(nonatomic) NSArray<SystranSpeechTranscribeSegment>* segments;

@end
