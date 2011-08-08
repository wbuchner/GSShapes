#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "SGPoint2D.h"
#import "SGVector.h"
#import "SGRectangle.h"
#import "SGCircle.h"
#import "SGLineSegment.h"
#import "SGTriangle.h"
#import "SGSoundEffect.h"
#import "SGMusic.h"
#import "SGMatrix2D.h"
#import "SGAnimationScript.h"
#import "SGAnimation.h"
#import "SGBitmap.h"
#import "SGBitmapCell.h"
#import "SGSprite.h"
#import "SGTimer.h"
#import "SGFont.h"
#import "SGDirectionAngles.h"
#import "SGCharacter.h"


@interface SGAudio : NSObject
{
  
}

+ (BOOL)audioReady;
+ (void)closeAudio;
+ (void)playMusic:(SGMusic *)mus  fadeIn:(int)ms;
+ (void)playMusicNamed:(NSString *)name  fadeIn:(int)ms;
+ (void)playMusicNamed:(NSString *)name  looped:(int)loops  fadeIn:(int)ms;
+ (void)playMusic:(SGMusic *)mus  looped:(int)loops  fadeIn:(int)ms;
+ (void)fadeMusicOut:(int)ms;
+ (void)freeMusic:(SGMusic *)mus;
+ (void)freeSoundEffect:(SGSoundEffect *)effect;
+ (BOOL)hasMusic:(NSString *)name;
+ (BOOL)hasSoundEffect:(NSString *)name;
+ (SGMusic *)loadMusic:(NSString *)filename;
+ (SGMusic *)loadMusicNamed:(NSString *)name  fromFile:(NSString *)filename;
+ (SGSoundEffect *)loadSoundEffect:(NSString *)filename;
+ (SGSoundEffect *)loadSoundEffectNamed:(NSString *)name  fromFile:(NSString *)filename;
+ (NSString *)musicFilename:(SGMusic *)mus;
+ (NSString *)musicName:(SGMusic *)mus;
+ (SGMusic *)musicNamed:(NSString *)name;
+ (BOOL)musicPlaying;
+ (float)musicVolume;
+ (void)openAudio;
+ (void)playMusic:(SGMusic *)mus;
+ (void)playMusicNamed:(NSString *)name;
+ (void)playMusic:(SGMusic *)mus  looped:(int)loops;
+ (void)playMusicNamed:(NSString *)name  looped:(int)loops;
+ (void)playSoundEffect:(SGSoundEffect *)effect;
+ (void)playSoundEffectNamed:(NSString *)name;
+ (void)playSoundEffectNamed:(NSString *)name  atVolume:(float)vol;
+ (void)playSoundEffect:(SGSoundEffect *)effect  atVolume:(float)vol;
+ (void)playSoundEffectNamed:(NSString *)name  looped:(int)loops;
+ (void)playSoundEffect:(SGSoundEffect *)effect  looped:(int)loops;
+ (void)playSoundEffect:(SGSoundEffect *)effect  looped:(int)loops  atVolume:(float)vol;
+ (void)playSoundEffectNamed:(NSString *)name  looped:(int)loops  atVolume:(float)vol;
+ (void)releaseAllMusic;
+ (void)releaseAllSoundEffects;
+ (void)releaseMusic:(NSString *)name;
+ (void)releaseSoundEffect:(NSString *)name;
+ (void)setMusicVolume:(float)value;
+ (NSString *)soundEffectFilename:(SGSoundEffect *)effect;
+ (NSString *)soundEffectName:(SGSoundEffect *)effect;
+ (SGSoundEffect *)soundEffectNamed:(NSString *)name;
+ (BOOL)soundEffectPlaying:(SGSoundEffect *)effect;
+ (void)stopMusic;
+ (void)stopSoundEffect:(SGSoundEffect *)effect;
+ (void)stopSoundEffectNamed:(NSString *)name;
+ (BOOL)tryOpenAudio;








@end

