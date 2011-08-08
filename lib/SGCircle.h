#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGCircle : NSObject
{
@package
    circle data;
}

+ (void) updateCirclesIn:(NSArray *)arr fromDataIn:(circle *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfCircles:(circle *)firstPtr size:(int)sz;
+ (void) getCircles:(circle *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGCircle *) circleForData: (circle)dat;

- (SGCircle *)initWithCircle:(circle)dat;

- (circle) data;
- (void) setData:(circle)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int radius;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGPoint2D * center;
#endif;


- (SGPoint2D *)closestPointTo:(SGPoint2D *)fromPt;
- (SGPoint2D *)distantPointFrom:(SGPoint2D *)pt;
- (BOOL)distantPointFrom:(SGPoint2D *)pt  heading:(SGVector *)heading  result:(SGPoint2D **)oppositePt;
- (BOOL)tangentPointsFrom:(SGPoint2D *)fromPt  firstPt:(SGPoint2D **)p1  secondPt:(SGPoint2D **)p2;
- (SGVector *)vectorOutOfCircle:(SGCircle *)bounds  givenHeading:(SGVector *)velocity;
- (SGVector *)vectorOutOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity;
- (SGVector *)vectorOverLines:(NSArray *)lines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx;
- (void)widestPointsAlong:(SGVector *)along  firstPt:(SGPoint2D **)pt1  secondPt:(SGPoint2D **)pt2;
#if OBJC_NEW_PROPERTIES != 1
- (int)radius;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setRadius:(int)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)center;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCenter:(SGPoint2D *)value;
#endif

@end

@interface SGWrappedCircle : SGCircle
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedCircle *) circleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initCircleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

