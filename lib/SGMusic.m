#import "SGMusic.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGMusic : NSObject

+ (void) getMusics:(music *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGMusic *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfMusics:(music *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGMusic *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGMusic createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(music)ptr
{
    if (ptr == nil) return nil;
    id obj = [PointerManager objectForKey: (id)ptr];
    
    if (obj == nil)
    {
        // Create and assign to obj...
        obj = [[[self alloc] initWithId:ptr] autorelease];
    }
    
    return obj;
}

- (id)initWithId:(music)ptr
{
    if (ptr == nil)
    {
        [self release];
        return nil;
    }
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        pointer = ptr;
        [PointerManager registerObject:self withKey:(id)ptr];
    }
    return self;
}

- (void)releasePointer
{
    pointer = nil;
}


+ (float)volume
{
    float result;
    result = sg_Audio_MusicVolume();
    return result;
}

+ (void)setVolume:(float)value
{
    sg_Audio_SetMusicVolume(value);
}

+ (void)fadeOut:(int)ms
{
    sg_Audio_FadeMusicOut(ms);
}

+ (BOOL)isPlaying
{
    BOOL result;
    result = sg_Audio_MusicPlaying() != 0;
    return result;
}

+ (void)stop
{
    sg_Audio_StopMusic();
}


- (id)initFromFile:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGMusic * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Audio_LoadMusic(filename_temp)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGMusic * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Audio_LoadMusicNamed(name_temp, filename_temp)];
    return result;
}



@dynamic filename;
@dynamic name;


- (NSString *)filename
{
    char result[2048];
    sg_Audio_MusicFilename(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (NSString *)name
{
    char result[2048];
    sg_Audio_MusicName(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (void)playFadeIn:(int)ms
{
    sg_Audio_FadeMusicIn(self->pointer, ms);
}

- (void)playLooped:(int)loops  fadeIn:(int)ms
{
    sg_Audio_FadeMusicInWithLoops(self->pointer, loops, ms);
}

- (void)play
{
    sg_Audio_PlayMusicWithLoops(self->pointer, -1);
}

- (void)playWithLoops:(int)loops
{
    sg_Audio_PlayMusicWithLoops(self->pointer, loops);
}

- (void)free
{
    sg_Audio_FreeMusic(&self->pointer);
}


@end
