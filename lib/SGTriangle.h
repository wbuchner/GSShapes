#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGTriangle : NSObject
{
@package
    triangle data;
}

+ (SGTriangle *) triangleForData: (triangle)dat;
+ (void) getTriangles:(triangle *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;

- (id)initWithTriangle:(triangle)dat;

- (SGPoint2D *) valueAtIndex:(int)idx0;
- (void) setValueAtIndex:(int)idx0 toValue:(SGPoint2D *)value;







- (SGPoint2D *)barycenter;
- (NSString *)description;

@end
