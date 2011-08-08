#import "SGLineSegment.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGLineSegment ( Private )
- (id) init;
@end

@implementation SGWrappedLineSegment : SGLineSegment

+ (SGWrappedLineSegment *) lineSegmentWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedLineSegment *ret = [[SGWrappedLineSegment alloc] initLineSegmentWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initLineSegmentWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
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
    
    SGLineSegment *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (float)magnitudeSq
{
    [self callRead];
    float result;
    result = sg_Geometry_LineMagnitudeSqFromLine(&self->data);
    return result;
}

- (SGVector *)normal
{
    [self callRead];
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LineNormal(&self->data)];
    return result;
}

- (NSArray *)points
{
    [self callRead];
    point2d result[2];
    sg_Geometry_PointsFromLine(&self->data, result, 2);
    return [SGPoint2D arrayOfPoint2Ds:result size:2];
}

- (SGPoint2D *)endPoint
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.end_point];
    return result;
}

- (void)setEndPoint:(SGPoint2D *)value
{
    data.end_point = value->data;
    [self callUpdate];
}

- (SGPoint2D *)startPoint
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.start_point];
    return result;
}

- (void)setStartPoint:(SGPoint2D *)value
{
    data.start_point = value->data;
    [self callUpdate];
}


@end


@implementation SGLineSegment ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGLineSegment : NSObject

//
// Update the LineSegment objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateLineSegmentsIn:(NSArray *)arr fromDataIn:(line_segment *)firstPtr size:(int)sz
{
    int i;
    SGLineSegment *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGLineSegment *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfLineSegments:(line_segment *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGLineSegment *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGLineSegment alloc] initWithLineSegment: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGLineSegment *) lineSegmentForData: (line_segment)dat
{
    SGLineSegment *ret = [[SGLineSegment alloc] initWithLineSegment: dat];
    [ret autorelease];
    return ret;
}

+ (void) getLineSegments:(line_segment *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGLineSegment *)[arr objectAtIndex: i]) data];
    }
}

- (SGLineSegment *)initWithLineSegment:(line_segment)dat
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

- (line_segment) data
{
    return data;
}

- (void) setData:(line_segment)dat
{
    data = dat;
}




@dynamic magnitudeSq;
@dynamic normal;
@dynamic points;
@dynamic endPoint;
@dynamic startPoint;




- (float)magnitudeSq
{
    float result;
    result = sg_Geometry_LineMagnitudeSqFromLine(&self->data);
    return result;
}

- (SGVector *)normal
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LineNormal(&self->data)];
    return result;
}

- (NSArray *)points
{
    point2d result[2];
    sg_Geometry_PointsFromLine(&self->data, result, 2);
    return [SGPoint2D arrayOfPoint2Ds:result size:2];
}

- (SGVector *)asVector
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LineAsVector(&self->data)];
    return result;
}

- (BOOL)intersectionWith:(SGLineSegment *)line2  result:(SGPoint2D **)pt
{
    point2d pt_temp;
    BOOL result;
    result = sg_Geometry_LineIntersectionPoint(&self->data, &line2->data, &pt_temp) != 0;
    *pt = [[[SGPoint2D alloc] initWithPoint2D:pt_temp] autorelease];
    return result;
}

- (BOOL)intersectsLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    BOOL result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = sg_Geometry_LineIntersectsLines(&self->data, lines_temp, [lines count]) != 0;
    return result;
}

- (BOOL)intersectsRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_LineIntersectsRect(&self->data, &rect->data) != 0;
    return result;
}

- (BOOL)rayFrom:(SGPoint2D *)fromPt  heading:(SGVector *)heading  intersectsAt:(SGPoint2D **)pt
{
    point2d pt_temp;
    BOOL result;
    result = sg_Geometry_RayIntersectionPoint(&fromPt->data, &heading->data, &self->data, &pt_temp) != 0;
    *pt = [[[SGPoint2D alloc] initWithPoint2D:pt_temp] autorelease];
    return result;
}

- (NSString *)description
{
    char result[2048];
    sg_Geometry_LineToString(&self->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (SGPoint2D *)endPoint
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.end_point];
    return result;
}

- (void)setEndPoint:(SGPoint2D *)value
{
    data.end_point = value->data;
}

- (SGPoint2D *)startPoint
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:data.start_point];
    return result;
}

- (void)setStartPoint:(SGPoint2D *)value
{
    data.start_point = value->data;
}


@end

