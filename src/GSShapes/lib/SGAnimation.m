#import "SGAnimation.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGAnimation : NSObject

+ (void) getAnimations:(animation *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGAnimation *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfAnimations:(animation *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGAnimation *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGAnimation createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(animation)ptr
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

- (id)initWithId:(animation)ptr
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



- (id)initAsName:(NSString *)identifier  from:(SGAnimationScript *)frames
{
    char identifier_temp[[identifier length] + 1];
    SGAnimation * result;
    [identifier getCString:identifier_temp maxLength:[identifier length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Animations_CreateAnimationNamed(identifier_temp, frames->pointer)];
    return result;
}

- (id)initAtIndex:(int)identifier  from:(SGAnimationScript *)frames
{
    SGAnimation * result;
    result = [self initWithId: sg_Animations_CreateAnimationWithSound(identifier, frames->pointer)];
    return result;
}

- (id)initAtIndex:(int)identifier  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound
{
    SGAnimation * result;
    result = [self initWithId: sg_Animations_CreateAnimation(identifier, frames->pointer, (withSound ? 1 : 0))];
    return result;
}

- (id)initAsName:(NSString *)identifier  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound
{
    char identifier_temp[[identifier length] + 1];
    SGAnimation * result;
    [identifier getCString:identifier_temp maxLength:[identifier length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Animations_CreateAnimationNamedWithSound(identifier_temp, frames->pointer, (withSound ? 1 : 0))];
    return result;
}



@dynamic currentCell;
@dynamic ended;
@dynamic enteredFrame;
@dynamic frameTime;


- (int)currentCell
{
    int result;
    result = sg_Animations_AnimationCurrentCell(self->pointer);
    return result;
}

- (BOOL)ended
{
    BOOL result;
    result = sg_Animations_AnimationEnded(self->pointer) != 0;
    return result;
}

- (BOOL)enteredFrame
{
    BOOL result;
    result = sg_Animations_AnimationEnteredFrame(self->pointer) != 0;
    return result;
}

- (float)frameTime
{
    float result;
    result = sg_Animations_AnimationFrameTime(self->pointer);
    return result;
}

- (void)assignAnimationNamed:(NSString *)name  from:(SGAnimationScript *)frames
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Animations_AssignAnimationNamed(self->pointer, name_temp, frames->pointer);
}

- (void)assignAnimation:(int)idx  from:(SGAnimationScript *)frames
{
    sg_Animations_AssignAnimation(self->pointer, idx, frames->pointer);
}

- (void)assignAnimationNamed:(NSString *)name  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Animations_AssignAnimationNamedWithSound(self->pointer, name_temp, frames->pointer, (withSound ? 1 : 0));
}

- (void)assignAnimation:(int)idx  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound
{
    sg_Animations_AssignAnimationWithSound(self->pointer, idx, frames->pointer, (withSound ? 1 : 0));
}

- (void)drawBitmap:(SGBitmap *)bmp  pt:(SGPoint2D *)pt
{
    sg_Animations_DrawAnimationAtPoint(self->pointer, bmp->pointer, &pt->data);
}

- (void)drawOnto:(SGAnimation *)ani  using:(SGBitmap *)bmp  pt:(SGPoint2D *)pt
{
    sg_Animations_DrawAnimationOntoDestAtPt(self->pointer, ani->pointer, bmp->pointer, &pt->data);
}

- (void)drawBitmap:(SGBitmap *)bmp  x:(int)x  y:(int)y
{
    sg_Animations_DrawAnimation(self->pointer, bmp->pointer, x, y);
}

- (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)bmp  x:(int)x  y:(int)y
{
    sg_Animations_DrawAnimationOntoDest(dest->pointer, self->pointer, bmp->pointer, x, y);
}

- (void)drawBitmap:(SGBitmap *)bmp  onScreenAtPt:(SGPoint2D *)pt
{
    sg_Animations_DrawAnimationOnScreenAtPt(self->pointer, bmp->pointer, &pt->data);
}

- (void)drawBitmap:(SGBitmap *)bmp  onScreenAtX:(int)x  y:(int)y
{
    sg_Animations_DrawAnimationOnScreen(self->pointer, bmp->pointer, x, y);
}

- (void)resetWithSound:(BOOL)withSound
{
    sg_Animations_ResetAnimationWithSound(self->pointer, (withSound ? 1 : 0));
}

- (void)restart
{
    sg_Animations_RestartAnimation(self->pointer);
}

- (void)update
{
    sg_Animations_UpdateAnimation(self->pointer);
}

- (void)updatePct:(float)pct
{
    sg_Animations_UpdateAnimationPct(self->pointer, pct);
}

- (void)updatePct:(float)pct  withSound:(BOOL)withSound
{
    sg_Animations_UpdateAnimationPctAndSound(self->pointer, pct, (withSound ? 1 : 0));
}

- (void)free
{
    sg_Animations_FreeAnimation(&self->pointer);
}


@end
