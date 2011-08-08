#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGAudio.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGAudio : NSObject


+ (BOOL)audioReady
{
    BOOL result;
    result = sg_Audio_AudioReady() != 0;
    return result;
}

+ (void)closeAudio
{
    sg_Audio_CloseAudio();
}

+ (void)playMusic:(SGMusic *)mus  fadeIn:(int)ms
{
    sg_Audio_FadeMusicIn(mus->pointer, ms);
}

+ (void)playMusicNamed:(NSString *)name  fadeIn:(int)ms
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_FadeMusicNamedIn(name_temp, ms);
}

+ (void)playMusicNamed:(NSString *)name  looped:(int)loops  fadeIn:(int)ms
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_FadeMusicNamedInWithLoops(name_temp, loops, ms);
}

+ (void)playMusic:(SGMusic *)mus  looped:(int)loops  fadeIn:(int)ms
{
    sg_Audio_FadeMusicInWithLoops(mus->pointer, loops, ms);
}

+ (void)fadeMusicOut:(int)ms
{
    sg_Audio_FadeMusicOut(ms);
}

+ (void)freeMusic:(SGMusic *)mus
{
    sg_Audio_FreeMusic(&mus->pointer);
}

+ (void)freeSoundEffect:(SGSoundEffect *)effect
{
    sg_Audio_FreeSoundEffect(&effect->pointer);
}

+ (BOOL)hasMusic:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Audio_HasMusic(name_temp) != 0;
    return result;
}

+ (BOOL)hasSoundEffect:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Audio_HasSoundEffect(name_temp) != 0;
    return result;
}

+ (SGMusic *)loadMusic:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGMusic * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGMusic createWithId:sg_Audio_LoadMusic(filename_temp)];
    return result;
}

+ (SGMusic *)loadMusicNamed:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGMusic * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGMusic createWithId:sg_Audio_LoadMusicNamed(name_temp, filename_temp)];
    return result;
}

+ (SGSoundEffect *)loadSoundEffect:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGSoundEffect * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSoundEffect createWithId:sg_Audio_LoadSoundEffect(filename_temp)];
    return result;
}

+ (SGSoundEffect *)loadSoundEffectNamed:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGSoundEffect * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSoundEffect createWithId:sg_Audio_LoadSoundEffectNamed(name_temp, filename_temp)];
    return result;
}

+ (NSString *)musicFilename:(SGMusic *)mus
{
    char result[2048];
    sg_Audio_MusicFilename(mus->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)musicName:(SGMusic *)mus
{
    char result[2048];
    sg_Audio_MusicName(mus->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGMusic *)musicNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGMusic * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGMusic createWithId:sg_Audio_MusicNamed(name_temp)];
    return result;
}

+ (BOOL)musicPlaying
{
    BOOL result;
    result = sg_Audio_MusicPlaying() != 0;
    return result;
}

+ (float)musicVolume
{
    float result;
    result = sg_Audio_MusicVolume();
    return result;
}

+ (void)openAudio
{
    sg_Audio_OpenAudio();
}

+ (void)playMusic:(SGMusic *)mus
{
    sg_Audio_PlayMusicWithLoops(mus->pointer, -1);
}

+ (void)playMusicNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlayMusicNamedWithLoops(name_temp, -1);
}

+ (void)playMusic:(SGMusic *)mus  looped:(int)loops
{
    sg_Audio_PlayMusicWithLoops(mus->pointer, loops);
}

+ (void)playMusicNamed:(NSString *)name  looped:(int)loops
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlayMusicNamedWithLoops(name_temp, loops);
}

+ (void)playSoundEffect:(SGSoundEffect *)effect
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(effect->pointer, 1, 1.0f);
}

+ (void)playSoundEffectNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlaySoundEffectNamedWithLoopAndVolume(name_temp, 1, 1.0f);
}

+ (void)playSoundEffectNamed:(NSString *)name  atVolume:(float)vol
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlaySoundEffectNamedWithLoopAndVolume(name_temp, 1, vol);
}

+ (void)playSoundEffect:(SGSoundEffect *)effect  atVolume:(float)vol
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(effect->pointer, 1, vol);
}

+ (void)playSoundEffectNamed:(NSString *)name  looped:(int)loops
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlaySoundEffectNamedWithLoopAndVolume(name_temp, loops, 1.0f);
}

+ (void)playSoundEffect:(SGSoundEffect *)effect  looped:(int)loops
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(effect->pointer, loops, 1.0f);
}

+ (void)playSoundEffect:(SGSoundEffect *)effect  looped:(int)loops  atVolume:(float)vol
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(effect->pointer, loops, vol);
}

+ (void)playSoundEffectNamed:(NSString *)name  looped:(int)loops  atVolume:(float)vol
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_PlaySoundEffectNamedWithLoopAndVolume(name_temp, loops, vol);
}

+ (void)releaseAllMusic
{
    sg_Audio_ReleaseAllMusic();
}

+ (void)releaseAllSoundEffects
{
    sg_Audio_ReleaseAllSoundEffects();
}

+ (void)releaseMusic:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_ReleaseMusic(name_temp);
}

+ (void)releaseSoundEffect:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_ReleaseSoundEffect(name_temp);
}

+ (void)setMusicVolume:(float)value
{
    sg_Audio_SetMusicVolume(value);
}

+ (NSString *)soundEffectFilename:(SGSoundEffect *)effect
{
    char result[2048];
    sg_Audio_SoundEffectFilename(effect->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)soundEffectName:(SGSoundEffect *)effect
{
    char result[2048];
    sg_Audio_SoundEffectName(effect->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGSoundEffect *)soundEffectNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGSoundEffect * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSoundEffect createWithId:sg_Audio_SoundEffectNamed(name_temp)];
    return result;
}

+ (BOOL)soundEffectPlaying:(SGSoundEffect *)effect
{
    BOOL result;
    result = sg_Audio_SoundEffectPlaying(effect->pointer) != 0;
    return result;
}

+ (void)stopMusic
{
    sg_Audio_StopMusic();
}

+ (void)stopSoundEffect:(SGSoundEffect *)effect
{
    sg_Audio_StopSoundEffect(effect->pointer);
}

+ (void)stopSoundEffectNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Audio_StopSoundEffectNamed(name_temp);
}

+ (BOOL)tryOpenAudio
{
    BOOL result;
    result = sg_Audio_TryOpenAudio() != 0;
    return result;
}









@end
