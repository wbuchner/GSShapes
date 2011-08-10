#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGLineSegment : NSObject
{
@package
    line_segment data;
}

+ (void) updateLineSegmentsIn:(NSArray *)arr fromDataIn:(line_segment *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfLineSegments:(line_segment *)firstPtr size:(int)sz;
+ (void) getLineSegments:(line_segment *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGLineSegment *) lineSegmentForData: (line_segment)dat;

- (SGLineSegment *)initWithLineSegment:(line_segment)dat;

- (line_segment) data;
- (void) setData:(line_segment)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float magnitudeSq;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGVector * normal;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * points;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGPoint2D * endPoint;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGPoint2D * startPoint;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (float)magnitudeSq;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGVector *)normal;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)points;
#endif
- (SGVector *)asVector;
- (BOOL)intersectionWith:(SGLineSegment *)line2  result:(SGPoint2D **)pt;
- (BOOL)intersectsLines:(NSArray *)lines;
- (BOOL)intersectsRect:(SGRectangle *)rect;
- (BOOL)rayFrom:(SGPoint2D *)fromPt  heading:(SGVector *)heading  intersectsAt:(SGPoint2D **)pt;
- (NSString *)description;
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)endPoint;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setEndPoint:(SGPoint2D *)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)startPoint;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setStartPoint:(SGPoint2D *)value;
#endif

@end

@interface SGWrappedLineSegment : SGLineSegment
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedLineSegment *) lineSegmentWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initLineSegmentWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

