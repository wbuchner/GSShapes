#import <string.h>
#import "SGTriangle.h"

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGTriangle : NSObject

+ (SGTriangle *) triangleForData: (triangle)dat
{
    SGTriangle *ret = [[SGTriangle alloc] initWithTriangle: dat];
    [ret autorelease];
    return ret;
}

- (void) copyTo:(triangle *)dest
{
    memcpy((void *)dest, (void *)data, sizeof(data));
}

+ (void) getTriangles:(triangle *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        // get the i'th object from the NSArray
        SGTriangle *obj = ((SGTriangle *)[arr objectAtIndex: i]);
        [obj copyTo:(firstPtr + i)];
    }
}

- (id)initWithTriangle:(triangle)dat
{
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        memcpy((void *) data, (void *) dat, sizeof(data));
    }
    return self;
}

- (SGPoint2D *) valueAtIndex:(int)idx0
{
    return [SGPoint2D point2DForData:data[idx0]];
}

- (void) setValueAtIndex:(int)idx0 toValue:(SGPoint2D *)value
{
    data[idx0] = value->data;
}






- (SGPoint2D *)barycenter
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_TriangleBarycenter(self->data)];
    return result;
}

- (NSString *)description
{
    char result[2048];
    sg_Geometry_TriangleToString(self->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}


@end

