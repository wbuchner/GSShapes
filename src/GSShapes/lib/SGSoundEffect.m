#import "SGSoundEffect.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGSoundEffect : NSObject

+ (void) getSoundEffects:(sound_effect *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGSoundEffect *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfSoundEffects:(sound_effect *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGSoundEffect *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGSoundEffect createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(sound_effect)ptr
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

- (id)initWithId:(sound_effect)ptr
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



- (id)initFromFile:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGSoundEffect * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Audio_LoadSoundEffect(filename_temp)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGSoundEffect * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Audio_LoadSoundEffectNamed(name_temp, filename_temp)];
    return result;
}



@dynamic filename;
@dynamic name;


- (NSString *)filename
{
    char result[2048];
    sg_Audio_SoundEffectFilename(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (NSString *)name
{
    char result[2048];
    sg_Audio_SoundEffectName(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (BOOL)isPlaying
{
    BOOL result;
    result = sg_Audio_SoundEffectPlaying(self->pointer) != 0;
    return result;
}

- (void)play
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(self->pointer, 1, 1.0f);
}

- (void)playVolume:(float)vol
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(self->pointer, 1, vol);
}

- (void)playLooped:(int)loops
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(self->pointer, loops, 1.0f);
}

- (void)playLooped:(int)loops  vol:(float)vol
{
    sg_Audio_PlaySoundEffectWithLoopAndVolume(self->pointer, loops, vol);
}

- (void)stop
{
    sg_Audio_StopSoundEffect(self->pointer);
}

- (void)free
{
    sg_Audio_FreeSoundEffect(&self->pointer);
}


@end
