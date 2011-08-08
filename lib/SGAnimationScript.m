#import "SGAnimationScript.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGAnimationScript : NSObject

+ (void) getAnimationScripts:(animation_script *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGAnimationScript *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfAnimationScripts:(animation_script *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGAnimationScript *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGAnimationScript createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(animation_script)ptr
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

- (id)initWithId:(animation_script)ptr
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
    SGAnimationScript * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Animations_LoadAnimationScript(filename_temp)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGAnimationScript * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Animations_LoadAnimationScriptNamed(name_temp, filename_temp)];
    return result;
}





- (int)indexOfAnimation:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Animations_AnimationIndex(self->pointer, name_temp);
    return result;
}

- (NSString *)nameOfAnimation:(int)idx
{
    char result[2048];
    sg_Animations_AnimationName(self->pointer, idx, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (void)free
{
    sg_Animations_FreeAnimationScript(&self->pointer);
}


@end
