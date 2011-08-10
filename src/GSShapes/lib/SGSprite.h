#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGSprite : NSObject <PointerWrapper>
{
@package
    sprite pointer;
}

+ (NSArray *) arrayOfSprites:(sprite *)firstPtr size:(int)sz;
+ (void) getSprites:(sprite *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(sprite)ptr;

- (id)initWithId:(sprite)ptr; 

- (id)initWithBitmap:(SGBitmap *)layer;
- (id)initWithBitmaps:(NSArray *)layers;
- (id)initWithBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName;
- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani;
- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer;
- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers;
- (id)initWithBitmap:(SGBitmap *)layer  position:(SGPoint2D *)pt;
- (id)initWithBitmaps:(NSArray *)layers  animationScript:(SGAnimationScript *)ani;
- (id)initWithBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames;
- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames;
- (id)initWithBitmap:(SGBitmap *)layer  x:(float)x  y:(float)y;
- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  position:(SGPoint2D *)pt;
- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani;
- (id)initNamed: (NSString *)name  withBitmaps:(NSArray *)layers  animationScript:(SGAnimationScript *)ani;
- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName;
- (id)initWithBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani;
- (id)initWithBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani;
- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani;
- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani;
- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  x:(float)x  y:(float)y;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) BOOL animationHasEnded;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGPoint2D * centerPoint;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGBitmap * collisionBitmap;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) collision_test_kind collisionKind;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGRectangle * collisionRectangle;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int currentCell;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGRectangle * currentCellRectangle;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float dX;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float dY;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float heading;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int height;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int layerCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) NSArray * layerOffsets;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * layers;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float mass;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * name;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGPoint2D * position;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float rotation;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float scale;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGRectangle * screenRectangle;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float speed;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int valueCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * valueNames;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGVector * velocity;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int visibleLayerCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * visibleLayerIds;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int width;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float x;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) float y;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (BOOL)animationHasEnded;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)centerPoint;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGBitmap *)collisionBitmap;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCollisionBitmap:(SGBitmap *)bmp;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (collision_test_kind)collisionKind;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCollisionKind:(collision_test_kind)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGRectangle *)collisionRectangle;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)currentCell;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGRectangle *)currentCellRectangle;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)dX;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setDX:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)dY;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setDY:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)heading;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setHeading:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)height;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)layerCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)layerOffsets;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setLayerOffsets:(NSArray *)values;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)layers;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)mass;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setMass:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)name;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGPoint2D *)pri_position;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setPosition:(SGPoint2D *)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)rotation;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setRotation:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)scale;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setScale:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGRectangle *)screenRectangle;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)speed;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setSpeed:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)valueCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)valueNames;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGVector *)pri_velocity;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setVelocity:(SGVector *)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)visibleLayerCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)visibleLayerIds;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)width;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)x;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setX:(float)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (float)y;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setY:(float)value;
#endif
- (int)addLayer:(SGBitmap *)newLayer  named:(NSString *)layerName;
- (void)addToVelocity:(SGVector *)value;
- (void)addValue:(NSString *)name;
- (void)addValue:(NSString *)name  initally:(float)initVal;
- (float)angleTo:(SGSprite *)s2;
- (BOOL)collisionWithBitmap:(SGBitmap *)bmp  at:(SGPoint2D *)pt;
- (BOOL)collisionWithBitmap:(SGBitmap *)bmp  x:(float)x  y:(float)y;
- (void)centerCameraOffset:(SGVector *)offset;
- (void)centerCameraOffsetX:(int)offsetX  offsetY:(int)offsetY;
- (SGCircle *)circle;
- (void)circleCollideWithCircle:(SGCircle *)c;
- (void)circleCollideWithLine:(SGLineSegment *)line;
- (void)circleCollideWithRectangle:(SGRectangle *)rect;
- (void)circleCollideWithLines:(NSArray *)lines;
- (SGCircle *)circleForLayer:(int)idx;
- (SGCircle *)circleForLayerNamed:(NSString *)name;
- (void)circlesCollide:(SGSprite *)s2;
- (SGCircle *)collisionCircle;
- (BOOL)collisionWithSprite:(SGSprite *)s2;
- (void)draw;
- (void)drawOffset:(SGPoint2D *)position;
- (void)drawOffsetX:(int)xOffset  y:(int)yOffset;
- (void)hideLayer:(int)id;
- (void)hideLayerNamed:(NSString *)name;
- (int)indexOfLayer:(NSString *)name;
- (SGBitmap *)layerAtIdx:(int)idx;
- (int)heightOfLayer:(int)idx;
- (int)heightOfLayerNamed:(NSString *)name;
- (NSString *)layerName:(int)idx;
- (SGBitmap *)layerNamed:(NSString *)name;
- (SGPoint2D *)offsetOfLayerNamed:(NSString *)name;
- (SGPoint2D *)offsetOfLayer:(int)idx;
- (int)widthOfLayerNamed:(NSString *)name;
- (int)widthOfLayer:(int)idx;
- (void)move;
- (void)move:(SGVector *)distance;
- (void)movePct:(float)pct;
- (void)move:(SGVector *)distance  pct:(float)pct;
- (void)moveToX:(int)x  y:(int)y;
- (BOOL)offscreen;
- (BOOL)onScreenAt:(SGPoint2D *)pt;
- (BOOL)onScreenAtX:(int)x  y:(int)y;
- (BOOL)collisionWithRect:(SGRectangle *)r;
- (BOOL)collisionWithRectX:(float)x  y:(float)y  width:(int)width  height:(int)height;
- (SGRectangle *)rectangleForLayer:(int)idx;
- (SGRectangle *)rectangleForLayerNamed:(NSString *)name;
- (void)replayAnimation;
- (void)replayAnimationWithSound:(BOOL)withSound;
- (void)sendLayerForward:(int)visibleLayer;
- (void)sendLayerToBack:(int)visibleLayer;
- (void)sendLayerToBackward:(int)visibleLayer;
- (void)sendLayerToFront:(int)visibleLayer;
- (void)layer:(int)idx  setOffset:(SGPoint2D *)value;
- (void)layerNamed:(NSString *)name  setOffset:(SGPoint2D *)value;
- (void)setValue:(int)idx  to:(float)val;
- (void)setValueNamed:(NSString *)name  to:(float)val;
- (int)showLayer:(int)id;
- (int)showLayerNamed:(NSString *)name;
- (void)startAnimationNamed:(NSString *)named;
- (void)startAnimation:(int)idx;
- (void)startAnimationNamed:(NSString *)named  withSound:(BOOL)withSound;
- (void)startAnimation:(int)idx  withSound:(BOOL)withSound;
- (void)toggleLayerVisible:(int)id;
- (void)toggleLayerNamedVisible:(NSString *)name;
- (void)update;
- (void)updatePercent:(float)pct;
- (void)updateWithSound:(BOOL)withSound;
- (void)updatePercent:(float)pct  withSound:(BOOL)withSound;
- (void)updateAnimation;
- (void)updateAnimationWithSound:(BOOL)withSound;
- (void)updateAnimationPct:(float)pct;
- (void)updateAnimationPct:(float)pct  withSound:(BOOL)withSound;
- (float)value:(NSString *)name;
- (float)valueAt:(int)index;
- (SGVector *)vectorToSprite:(SGSprite *)s2;
- (SGVector *)vectorToPoint:(SGPoint2D *)pt;
- (int)visibleIndexOfLayerNamed:(NSString *)name;
- (int)visibleIndexOfLayer:(int)id;
- (int)visibleLayer:(int)idx;
- (void)free;
@end
