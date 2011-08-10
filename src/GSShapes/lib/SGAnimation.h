#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGAnimation : NSObject <PointerWrapper>
{
@package
    animation pointer;
}

+ (NSArray *) arrayOfAnimations:(animation *)firstPtr size:(int)sz;
+ (void) getAnimations:(animation *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(animation)ptr;

- (id)initWithId:(animation)ptr; 

- (id)initAsName:(NSString *)identifier  from:(SGAnimationScript *)frames;
- (id)initAtIndex:(int)identifier  from:(SGAnimationScript *)frames;
- (id)initAtIndex:(int)identifier  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound;
- (id)initAsName:(NSString *)identifier  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int currentCell;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) BOOL ended;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) BOOL enteredFrame;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) float frameTime;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (int)currentCell;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (BOOL)ended;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (BOOL)enteredFrame;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)frameTime;
#endif
- (void)assignAnimationNamed:(NSString *)name  from:(SGAnimationScript *)frames;
- (void)assignAnimation:(int)idx  from:(SGAnimationScript *)frames;
- (void)assignAnimationNamed:(NSString *)name  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound;
- (void)assignAnimation:(int)idx  from:(SGAnimationScript *)frames  withSound:(BOOL)withSound;
- (void)drawBitmap:(SGBitmap *)bmp  pt:(SGPoint2D *)pt;
- (void)drawOnto:(SGAnimation *)ani  using:(SGBitmap *)bmp  pt:(SGPoint2D *)pt;
- (void)drawBitmap:(SGBitmap *)bmp  x:(int)x  y:(int)y;
- (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)bmp  x:(int)x  y:(int)y;
- (void)drawBitmap:(SGBitmap *)bmp  onScreenAtPt:(SGPoint2D *)pt;
- (void)drawBitmap:(SGBitmap *)bmp  onScreenAtX:(int)x  y:(int)y;
- (void)resetWithSound:(BOOL)withSound;
- (void)restart;
- (void)update;
- (void)updatePct:(float)pct;
- (void)updatePct:(float)pct  withSound:(BOOL)withSound;
- (void)free;
@end
