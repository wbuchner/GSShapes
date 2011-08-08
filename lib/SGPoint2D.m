#import "SGPoint2D.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGPoint2D ( Private )
- (id) init;
@end

@implementation SGWrappedPoint2D : SGPoint2D

+ (SGWrappedPoint2D *) point2DWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedPoint2D *ret = [[SGWrappedPoint2D alloc] initPoint2DWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initPoint2DWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
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
    
    SGPoint2D *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
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


@implementation SGPoint2D ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGPoint2D : NSObject

//
// Update the Point2D objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updatePoint2DsIn:(NSArray *)arr fromDataIn:(point2d *)firstPtr size:(int)sz
{
    int i;
    SGPoint2D *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGPoint2D *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfPoint2Ds:(point2d *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGPoint2D *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGPoint2D alloc] initWithPoint2D: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGPoint2D *) point2DForData: (point2d)dat
{
    SGPoint2D *ret = [[SGPoint2D alloc] initWithPoint2D: dat];
    [ret autorelease];
    return ret;
}

+ (void) getPoint2Ds:(point2d *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGPoint2D *)[arr objectAtIndex: i]) data];
    }
}

- (SGPoint2D *)initWithPoint2D:(point2d)dat
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

- (point2d) data
{
    return data;
}

- (void) setData:(point2d)dat
{
    data = dat;
}




@dynamic y;
@dynamic x;




- (SGPoint2D *)add:(SGPoint2D *)pt2
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_PointAdd(&self->data, &pt2->data)];
    return result;
}

- (float)angleTo:(SGPoint2D *)pt2
{
    float result;
    result = sg_Geometry_CalculateAngleBetween(&self->data, &pt2->data);
    return result;
}

- (float)distanceTo:(SGPoint2D *)pt2
{
    float result;
    result = sg_Geometry_PointPointDistance(&self->data, &pt2->data);
    return result;
}

- (BOOL)inCircle:(SGCircle *)c
{
    BOOL result;
    result = sg_Geometry_PointInCircle(&self->data, &c->data) != 0;
    return result;
}

- (BOOL)inRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_PointInRect(&self->data, &rect->data) != 0;
    return result;
}

- (BOOL)inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h
{
    BOOL result;
    result = sg_Geometry_PointInRectXY(&self->data, x, y, w, h) != 0;
    return result;
}

- (BOOL)inTriangle:(SGTriangle *)tri
{
    BOOL result;
    result = sg_Geometry_PointInTriangle(&self->data, tri->data) != 0;
    return result;
}

- (BOOL)onLine:(SGLineSegment *)line
{
    BOOL result;
    result = sg_Geometry_PointOnLine(&self->data, &line->data) != 0;
    return result;
}

- (BOOL)onPoint:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Geometry_PointOnPoint(&self->data, &pt2->data) != 0;
    return result;
}

- (float)distanceRayHeading:(SGVector *)ray_heading  toCircle:(SGCircle *)c
{
    float result;
    result = sg_Geometry_RayCircleIntersectDistance(&self->data, &ray_heading->data, &c->data);
    return result;
}

- (SGVector *)toPoint:(SGPoint2D *)p2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromPoints(&self->data, &p2->data)];
    return result;
}

- (NSString *)description
{
    char result[2048];
    sg_Geometry_PointToString(&self->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (SGVector *)vectorOutOfCircle:(SGCircle *)c  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfCircleFromPoint(&self->data, &c->data, &velocity->data)];
    return result;
}

- (SGVector *)vectorOutOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromPoint(&self->data, &rect->data, &velocity->data)];
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

