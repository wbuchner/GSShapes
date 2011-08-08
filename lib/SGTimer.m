#import "SGTimer.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGTimer : NSObject

+ (void) getTimers:(timer *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGTimer *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfTimers:(timer *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGTimer *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGTimer createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(timer)ptr
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

- (id)initWithId:(timer)ptr
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



- (id)timer
{
    SGTimer * result;
    result = [self initWithId: sg_Timers_CreateTimer()];
    return result;
}

- (id)timer:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGTimer * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Timers_CreateTimerNamed(name_temp)];
    return result;
}



@dynamic ticks;


- (uint)ticks
{
    uint result;
    result = sg_Timers_TimerTicks(self->pointer);
    return result;
}

- (void)pause
{
    sg_Timers_PauseTimer(self->pointer);
}

- (void)reset
{
    sg_Timers_ResetTimer(self->pointer);
}

- (void)resume
{
    sg_Timers_ResumeTimer(self->pointer);
}

- (void)start
{
    sg_Timers_StartTimer(self->pointer);
}

- (void)stop
{
    sg_Timers_StopTimer(self->pointer);
}

- (void)free
{
    sg_Timers_FreeTimer(&self->pointer);
}


@end
