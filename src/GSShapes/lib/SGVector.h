#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGVector : NSObject
{
@package
    vector data;
}

+ (void) updateVectorsIn:(NSArray *)arr fromDataIn:(vector *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfVectors:(vector *)firstPtr size:(int)sz;
+ (void) getVectors:(vector *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGVector *) vectorForData: (vector)dat;

- (SGVector *)initWithVector:(vector)dat;

- (vector) data;
- (void) setData:(vector)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float angle;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGVector * inverted;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) BOOL isZero;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float magnitude;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float magnitudeSq;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGVector * normal;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGVector * unitVector;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float y;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float x;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (float)angle;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGVector *)inverted;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (BOOL)isZero;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)magnitude;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)magnitudeSq;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGVector *)normal;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGVector *)unitVector;
#endif
- (SGVector *)vectorByAdding:(SGVector *)v2;
- (float)angleTo:(SGVector *)v2;
- (BOOL)doesNotEqualVector:(SGVector *)v2;
- (float)dotProduct:(SGVector *)v2;
- (BOOL)equalsVector:(SGVector *)v2;
- (BOOL)inRect:(SGRectangle *)rect;
- (BOOL)inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h;
- (SGVector *)limitToMagnitude:(float)limit;
- (SGVector *)multiply:(float)s;
- (SGVector *)subtractVector:(SGVector *)v2;
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

@interface SGWrappedVector : SGVector
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedVector *) vectorWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initVectorWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

