#import "SGVector.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGVector ( Private )
- (id) init;
@end

@implementation SGWrappedVector : SGVector

+ (SGWrappedVector *) vectorWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedVector *ret = [[SGWrappedVector alloc] initVectorWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initVectorWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
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
    
    SGVector *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (float)angle
{
    [self callRead];
    float result;
    result = sg_Geometry_VectorAngle(&self->data);
    return result;
}

- (SGVector *)inverted
{
    [self callRead];
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_InvertVector(&self->data)];
    return result;
}

- (BOOL)isZero
{
    [self callRead];
    BOOL result;
    result = sg_Geometry_VectorIsZero(&self->data) != 0;
    return result;
}

- (float)magnitude
{
    [self callRead];
    float result;
    result = sg_Geometry_VectorMagnitude(&self->data);
    return result;
}

- (float)magnitudeSq
{
    [self callRead];
    float result;
    result = sg_Geometry_VectorMagnitudeSq(&self->data);
    return result;
}

- (SGVector *)normal
{
    [self callRead];
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorNormal(&self->data)];
    return result;
}

- (SGVector *)unitVector
{
    [self callRead];
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_UnitVector(&self->data)];
    return result;
}

- (float)y
{
    [self callRead];
    float result;
    result = data.y;
    return result;
}

- (void)setY:(float)value
{
    data.y = value;
    [self callUpdate];
}

- (float)x
{
    [self callRead];
    float result;
    result = data.x;
    return result;
}

- (void)setX:(float)value
{
    data.x = value;
    [self callUpdate];
}


@end


@implementation SGVector ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGVector : NSObject

//
// Update the Vector objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateVectorsIn:(NSArray *)arr fromDataIn:(vector *)firstPtr size:(int)sz
{
    int i;
    SGVector *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGVector *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfVectors:(vector *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGVector *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGVector alloc] initWithVector: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGVector *) vectorForData: (vector)dat
{
    SGVector *ret = [[SGVector alloc] initWithVector: dat];
    [ret autorelease];
    return ret;
}

+ (void) getVectors:(vector *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGVector *)[arr objectAtIndex: i]) data];
    }
}

- (SGVector *)initWithVector:(vector)dat
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

- (vector) data
{
    return data;
}

- (void) setData:(vector)dat
{
    data = dat;
}




@dynamic angle;
@dynamic inverted;
@dynamic isZero;
@dynamic magnitude;
@dynamic magnitudeSq;
@dynamic normal;
@dynamic unitVector;
@dynamic y;
@dynamic x;




- (float)angle
{
    float result;
    result = sg_Geometry_VectorAngle(&self->data);
    return result;
}

- (SGVector *)inverted
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_InvertVector(&self->data)];
    return result;
}

- (BOOL)isZero
{
    BOOL result;
    result = sg_Geometry_VectorIsZero(&self->data) != 0;
    return result;
}

- (float)magnitude
{
    float result;
    result = sg_Geometry_VectorMagnitude(&self->data);
    return result;
}

- (float)magnitudeSq
{
    float result;
    result = sg_Geometry_VectorMagnitudeSq(&self->data);
    return result;
}

- (SGVector *)normal
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorNormal(&self->data)];
    return result;
}

- (SGVector *)unitVector
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_UnitVector(&self->data)];
    return result;
}

- (SGVector *)vectorByAdding:(SGVector *)v2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_AddVectors(&self->data, &v2->data)];
    return result;
}

- (float)angleTo:(SGVector *)v2
{
    float result;
    result = sg_Geometry_CalculateAngleBetweenVectors(&self->data, &v2->data);
    return result;
}

- (BOOL)doesNotEqualVector:(SGVector *)v2
{
    BOOL result;
    result = sg_Geometry_VectorsNotEqual(&self->data, &v2->data) != 0;
    return result;
}

- (float)dotProduct:(SGVector *)v2
{
    float result;
    result = sg_Geometry_DotProduct(&self->data, &v2->data);
    return result;
}

- (BOOL)equalsVector:(SGVector *)v2
{
    BOOL result;
    result = sg_Geometry_VectorsEqual(&self->data, &v2->data) != 0;
    return result;
}

- (BOOL)inRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_VectorInRect(&self->data, &rect->data) != 0;
    return result;
}

- (BOOL)inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h
{
    BOOL result;
    result = sg_Geometry_VectorInRectXY(&self->data, x, y, w, h) != 0;
    return result;
}

- (SGVector *)limitToMagnitude:(float)limit
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LimitVector(&self->data, limit)];
    return result;
}

- (SGVector *)multiply:(float)s
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorMultiply(&self->data, s)];
    return result;
}

- (SGVector *)subtractVector:(SGVector *)v2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_SubtractVectors(&self->data, &v2->data)];
    return result;
}

- (float)y
{
    float result;
    result = data.y;
    return result;
}

- (void)setY:(float)value
{
    data.y = value;
}

- (float)x
{
    float result;
    result = data.x;
    return result;
}

- (void)setX:(float)value
{
    data.x = value;
}


@end

