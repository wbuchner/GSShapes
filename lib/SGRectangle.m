#import "SGRectangle.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGRectangle ( Private )
- (id) init;
@end

@implementation SGWrappedRectangle : SGRectangle

+ (SGWrappedRectangle *) rectangleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedRectangle *ret = [[SGWrappedRectangle alloc] initRectangleWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initRectangleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
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
    
    SGRectangle *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (float)bottom
{
    [self callRead];
    float result;
    result = sg_Geometry_RectangleBottom(&self->data);
    return result;
}

- (SGPoint2D *)bottomLeft
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomLeft(&self->data)];
    return result;
}

- (SGPoint2D *)bottomRight
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomRight(&self->data)];
    return result;
}

- (SGPoint2D *)centerBottom
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterBottom(&self->data)];
    return result;
}

- (SGPoint2D *)centerLeft
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterLeft(&self->data)];
    return result;
}

- (SGPoint2D *)centerRight
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterRight(&self->data)];
    return result;
}

- (SGPoint2D *)centerTop
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterTop(&self->data)];
    return result;
}

- (float)left
{
    [self callRead];
    float result;
    result = sg_Geometry_RectangleLeft(&self->data);
    return result;
}

- (NSArray *)points
{
    [self callRead];
    point2d result[4];
    sg_Geometry_PointsFromRect(&self->data, result, 4);
    return [SGPoint2D arrayOfPoint2Ds:result size:4];
}

- (float)right
{
    [self callRead];
    float result;
    result = sg_Geometry_RectangleRight(&self->data);
    return result;
}

- (float)top
{
    [self callRead];
    float result;
    result = sg_Geometry_RectangleTop(&self->data);
    return result;
}

- (SGPoint2D *)topLeft
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopLeft(&self->data)];
    return result;
}

- (SGPoint2D *)topRight
{
    [self callRead];
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopRight(&self->data)];
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

- (int)height
{
    [self callRead];
    int result;
    result = data.height;
    return result;
}

- (void)setHeight:(int)value
{
    data.height = value;
    [self callUpdate];
}

- (int)width
{
    [self callRead];
    int result;
    result = data.width;
    return result;
}

- (void)setWidth:(int)value
{
    data.width = value;
    [self callUpdate];
}


@end


@implementation SGRectangle ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGRectangle : NSObject

//
// Update the Rectangle objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateRectanglesIn:(NSArray *)arr fromDataIn:(rectangle *)firstPtr size:(int)sz
{
    int i;
    SGRectangle *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGRectangle *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfRectangles:(rectangle *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGRectangle *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGRectangle alloc] initWithRectangle: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGRectangle *) rectangleForData: (rectangle)dat
{
    SGRectangle *ret = [[SGRectangle alloc] initWithRectangle: dat];
    [ret autorelease];
    return ret;
}

+ (void) getRectangles:(rectangle *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGRectangle *)[arr objectAtIndex: i]) data];
    }
}

- (SGRectangle *)initWithRectangle:(rectangle)dat
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

- (rectangle) data
{
    return data;
}

- (void) setData:(rectangle)dat
{
    data = dat;
}




@dynamic bottom;
@dynamic bottomLeft;
@dynamic bottomRight;
@dynamic centerBottom;
@dynamic centerLeft;
@dynamic centerRight;
@dynamic centerTop;
@dynamic left;
@dynamic points;
@dynamic right;
@dynamic top;
@dynamic topLeft;
@dynamic topRight;
@dynamic y;
@dynamic x;
@dynamic height;
@dynamic width;




- (float)bottom
{
    float result;
    result = sg_Geometry_RectangleBottom(&self->data);
    return result;
}

- (SGPoint2D *)bottomLeft
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomLeft(&self->data)];
    return result;
}

- (SGPoint2D *)bottomRight
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomRight(&self->data)];
    return result;
}

- (SGPoint2D *)centerBottom
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterBottom(&self->data)];
    return result;
}

- (SGPoint2D *)centerLeft
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterLeft(&self->data)];
    return result;
}

- (SGPoint2D *)centerRight
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterRight(&self->data)];
    return result;
}

- (SGPoint2D *)centerTop
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterTop(&self->data)];
    return result;
}

- (float)left
{
    float result;
    result = sg_Geometry_RectangleLeft(&self->data);
    return result;
}

- (NSArray *)points
{
    point2d result[4];
    sg_Geometry_PointsFromRect(&self->data, result, 4);
    return [SGPoint2D arrayOfPoint2Ds:result size:4];
}

- (float)right
{
    float result;
    result = sg_Geometry_RectangleRight(&self->data);
    return result;
}

- (float)top
{
    float result;
    result = sg_Geometry_RectangleTop(&self->data);
    return result;
}

- (SGPoint2D *)topLeft
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopLeft(&self->data)];
    return result;
}

- (SGPoint2D *)topRight
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopRight(&self->data)];
    return result;
}

- (SGRectangle *)intersection:(SGRectangle *)rect2
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_Intersection(&self->data, &rect2->data)];
    return result;
}

- (BOOL)intersects:(SGRectangle *)rect2
{
    BOOL result;
    result = sg_Geometry_RectanglesIntersect(&self->data, &rect2->data) != 0;
    return result;
}

- (SGRectangle *)rectangleAfterMove:(SGVector *)mv
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleAfterMove(&self->data, &mv->data)];
    return result;
}

- (NSString *)description
{
    char result[2048];
    sg_Geometry_RectangleToString(&self->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (SGVector *)vectorOutOfRect:(SGRectangle *)bounds  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromRect(&self->data, &bounds->data, &velocity->data)];
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

- (int)height
{
    int result;
    result = data.height;
    return result;
}

- (void)setHeight:(int)value
{
    data.height = value;
}

- (int)width
{
    int result;
    result = data.width;
    return result;
}

- (void)setWidth:(int)value
{
    data.width = value;
}


@end

