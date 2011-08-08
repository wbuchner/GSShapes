#import "SGCircle.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGCircle ( Private )
- (id) init;
@end

@implementation SGWrappedCircle : SGCircle

+ (SGWrappedCircle *) circleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedCircle *ret = [[SGWrappedCircle alloc] initCircleWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initCircleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
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
    
    SGCircle *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (int)radius
{
    [self callRead];
    int result;
    result = data.radius;
    return result;
}

- (void)setRadius:(int)value
{
    data.radius = value;
    [self callUpdate];
}

- (SGPoint2D *)center
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.center];
    return result;
}

- (void)setCenter:(SGPoint2D *)value
{
    data.center = value->data;
    [self callUpdate];
}


@end


@implementation SGCircle ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGCircle : NSObject

//
// Update the Circle objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateCirclesIn:(NSArray *)arr fromDataIn:(circle *)firstPtr size:(int)sz
{
    int i;
    SGCircle *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGCircle *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfCircles:(circle *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGCircle *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGCircle alloc] initWithCircle: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGCircle *) circleForData: (circle)dat
{
    SGCircle *ret = [[SGCircle alloc] initWithCircle: dat];
    [ret autorelease];
    return ret;
}

+ (void) getCircles:(circle *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGCircle *)[arr objectAtIndex: i]) data];
    }
}

- (SGCircle *)initWithCircle:(circle)dat
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

- (circle) data
{
    return data;
}

- (void) setData:(circle)dat
{
    data = dat;
}




@dynamic radius;
@dynamic center;




- (SGPoint2D *)closestPointTo:(SGPoint2D *)fromPt
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnCircle(&fromPt->data, &self->data)];
    return result;
}

- (SGPoint2D *)distantPointFrom:(SGPoint2D *)pt
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_DistantPointOnCircle(&pt->data, &self->data)];
    return result;
}

- (BOOL)distantPointFrom:(SGPoint2D *)pt  heading:(SGVector *)heading  result:(SGPoint2D **)oppositePt
{
    point2d oppositePt_temp;
    BOOL result;
    result = sg_Geometry_DistantPointOnCircleHeading(&pt->data, &self->data, &heading->data, &oppositePt_temp) != 0;
    *oppositePt = [[[SGPoint2D alloc] initWithPoint2D:oppositePt_temp] autorelease];
    return result;
}

- (BOOL)tangentPointsFrom:(SGPoint2D *)fromPt  firstPt:(SGPoint2D **)p1  secondPt:(SGPoint2D **)p2
{
    point2d p1_temp;
    point2d p2_temp;
    BOOL result;
    result = sg_Geometry_TangentPoints(&fromPt->data, &self->data, &p1_temp, &p2_temp) != 0;
    *p2 = [[[SGPoint2D alloc] initWithPoint2D:p2_temp] autorelease];
    *p1 = [[[SGPoint2D alloc] initWithPoint2D:p1_temp] autorelease];
    return result;
}

- (SGVector *)vectorOutOfCircle:(SGCircle *)bounds  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfCircleFromCircle(&self->data, &bounds->data, &velocity->data)];
    return result;
}

- (SGVector *)vectorOutOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromCircle(&self->data, &rect->data, &velocity->data)];
    return result;
}

- (SGVector *)vectorOverLines:(NSArray *)lines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx
{
    line_segment lines_temp[[lines count]];
    SGVector * result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = [SGVector vectorForData:sg_Geometry_VectorOverLinesFromCircle(&self->data, lines_temp, &velocity->data, maxIdx, [lines count])];
    return result;
}

- (void)widestPointsAlong:(SGVector *)along  firstPt:(SGPoint2D **)pt1  secondPt:(SGPoint2D **)pt2
{
    point2d pt1_temp;
    point2d pt2_temp;
    sg_Geometry_WidestPoints(&self->data, &along->data, &pt1_temp, &pt2_temp);
    *pt2 = [[[SGPoint2D alloc] initWithPoint2D:pt2_temp] autorelease];
    *pt1 = [[[SGPoint2D alloc] initWithPoint2D:pt1_temp] autorelease];
}

- (int)radius
{
    int result;
    result = data.radius;
    return result;
}

- (void)setRadius:(int)value
{
    data.radius = value;
}

- (SGPoint2D *)center
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.center];
    return result;
}

- (void)setCenter:(SGPoint2D *)value
{
    data.center = value->data;
}


@end

