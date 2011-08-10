#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGSoundEffect : NSObject <PointerWrapper>
{
@package
    sound_effect pointer;
}

+ (NSArray *) arrayOfSoundEffects:(sound_effect *)firstPtr size:(int)sz;
+ (void) getSoundEffects:(sound_effect *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(sound_effect)ptr;

- (id)initWithId:(sound_effect)ptr; 

- (id)initFromFile:(NSString *)filename;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * filename;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * name;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (NSString *)filename;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)name;
#endif
- (BOOL)isPlaying;
- (void)play;
- (void)playVolume:(float)vol;
- (void)playLooped:(int)loops;
- (void)playLooped:(int)loops  vol:(float)vol;
- (void)stop;
- (void)free;
@end
