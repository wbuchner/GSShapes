#import "SGDirectionAngles.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGDirectionAngles ( Private )
- (id) init;
@end

@implementation SGWrappedDirectionAngles : SGDirectionAngles

+ (SGWrappedDirectionAngles *) directionAnglesWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedDirectionAngles *ret = [[SGWrappedDirectionAngles alloc] initDirectionAnglesWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initDirectionAnglesWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        call_on_update = sel1;
        call_on_read   = sel2;
        delegate       = del;
        
        [delegate retain];
    }
    return self;
}

- (void) dealloc
{
    [delegate release];
    [super dealloc];
}

- (void) callUpdate
{
    if (delegate == nil || call_on_update == nil) return;
    
    NSMethodSignature *sig = [self methodSignatureForSelector:call_on_update];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature: sig];
    [inv setArgument:&self atIndex:2]; //first arg after self + _cmd (for call)
    [inv invokeWithTarget: delegate]; //call on the delegate
}

- (void) callRead
{
    if (delegate == nil || call_on_read == nil) return;
    
    NSMethodSignature *sig = [self methodSignatureForSelector:call_on_read];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature: sig];
    [inv invokeWithTarget: delegate]; //call on the delegate
    
    SGDirectionAngles *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (int)max
{
    [self callRead];
    int result;
    result = data.max;
    return result;
}

- (void)setMax:(int)value
{
    data.max = value;
    [self callUpdate];
}

- (int)min
{
    [self callRead];
    int result;
    result = data.min;
    return result;
}

- (void)setMin:(int)value
{
    data.min = value;
    [self callUpdate];
}


@end


@implementation SGDirectionAngles ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGDirectionAngles : NSObject

//
// Update the DirectionAngles objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateDirectionAnglessIn:(NSArray *)arr fromDataIn:(direction_angles *)firstPtr size:(int)sz
{
    int i;
    SGDirectionAngles *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGDirectionAngles *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfDirectionAngless:(direction_angles *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGDirectionAngles *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGDirectionAngles alloc] initWithDirectionAngles: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGDirectionAngles *) directionAnglesForData: (direction_angles)dat
{
    SGDirectionAngles *ret = [[SGDirectionAngles alloc] initWithDirectionAngles: dat];
    [ret autorelease];
    return ret;
}

+ (void) getDirectionAngless:(direction_angles *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGDirectionAngles *)[arr objectAtIndex: i]) data];
    }
}

- (SGDirectionAngles *)initWithDirectionAngles:(direction_angles)dat
{
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        data = dat;
    }
    return self;
}

- (direction_angles) data
{
    return data;
}

- (void) setData:(direction_angles)dat
{
    data = dat;
}




@dynamic max;
@dynamic min;




- (int)max
{
    int result;
    result = data.max;
    return result;
}

- (void)setMax:(int)value
{
    data.max = value;
}

- (int)min
{
    int result;
    result = data.min;
    return result;
}

- (void)setMin:(int)value
{
    data.min = value;
}


@end

