#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGMusic : NSObject <PointerWrapper>
{
@package
    music pointer;
}

+ (NSArray *) arrayOfMusics:(music *)firstPtr size:(int)sz;
+ (void) getMusics:(music *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(music)ptr;

+ (float)volume;
+ (void)setVolume:(float)value;
+ (void)fadeOut:(int)ms;
+ (BOOL)isPlaying;
+ (void)stop;
- (id)initWithId:(music)ptr; 

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
- (void)playFadeIn:(int)ms;
- (void)playLooped:(int)loops  fadeIn:(int)ms;
- (void)play;
- (void)playWithLoops:(int)loops;
- (void)free;
@end
