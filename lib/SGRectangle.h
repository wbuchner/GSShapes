#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGRectangle : NSObject
{
@package
    rectangle data;
}

+ (void) updateRectanglesIn:(NSArray *)arr fromDataIn:(rectangle *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfRectangles:(rectangle *)firstPtr size:(int)sz;
+ (void) getRectangles:(rectangle *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGRectangle *) rectangleForData: (rectangle)dat;

- (SGRectangle *)initWithRectangle:(rectangle)dat;

- (rectangle) data;
- (void) setData:(rectangle)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float bottom;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * bottomLeft;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * bottomRight;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * centerBottom;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * centerLeft;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * centerRight;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * centerTop;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float left;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * points;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float right;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float top;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * topLeft;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * topRight;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float y;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float x;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int height;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int width;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (float)bottom;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)bottomLeft;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)bottomRight;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)centerBottom;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)centerLeft;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)centerRight;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)centerTop;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)left;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)points;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)right;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)top;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)topLeft;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)topRight;
#endif
- (SGRectangle *)intersection:(SGRectangle *)rect2;
- (BOOL)intersects:(SGRectangle *)rect2;
- (SGRectangle *)rectangleAfterMove:(SGVector *)mv;
- (NSString *)description;
- (SGVector *)vectorOutOfRect:(SGRectangle *)bounds  givenHeading:(SGVector *)velocity;
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
#if OBJC_NEW_PROPERTIES != 1
- (int)height;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setHeight:(int)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)width;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setWidth:(int)value;
#endif

@end

@interface SGWrappedRectangle : SGRectangle
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedRectangle *) rectangleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initRectangleWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

