#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGPoint2D : NSObject
{
@package
    point2d data;
}

+ (void) updatePoint2DsIn:(NSArray *)arr fromDataIn:(point2d *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfPoint2Ds:(point2d *)firstPtr size:(int)sz;
+ (void) getPoint2Ds:(point2d *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGPoint2D *) point2DForData: (point2d)dat;

- (SGPoint2D *)initWithPoint2D:(point2d)dat;

- (point2d) data;
- (void) setData:(point2d)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float y;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float x;
#endif;


- (SGPoint2D *)add:(SGPoint2D *)pt2;
- (float)angleTo:(SGPoint2D *)pt2;
- (float)distanceTo:(SGPoint2D *)pt2;
- (BOOL)inCircle:(SGCircle *)c;
- (BOOL)inRect:(SGRectangle *)rect;
- (BOOL)inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h;
- (BOOL)inTriangle:(SGTriangle *)tri;
- (BOOL)onLine:(SGLineSegment *)line;
- (BOOL)onPoint:(SGPoint2D *)pt2;
- (float)distanceRayHeading:(SGVector *)ray_heading  toCircle:(SGCircle *)c;
- (SGVector *)toPoint:(SGPoint2D *)p2;
- (NSString *)description;
- (SGVector *)vectorOutOfCircle:(SGCircle *)c  givenHeading:(SGVector *)velocity;
- (SGVector *)vectorOutOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity;
#if OBJC_NEW_PROPERTIES != 1
- (float)y;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setY:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)x;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setX:(float)value;
#endif

@end

@interface SGWrappedPoint2D : SGPoint2D
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedPoint2D *) point2DWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initPoint2DWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

