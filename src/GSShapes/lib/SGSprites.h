#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "SGPoint2D.h"
#import "SGVector.h"
#import "SGRectangle.h"
#import "SGCircle.h"
#import "SGLineSegment.h"
#import "SGTriangle.h"
#import "SGSoundEffect.h"
#import "SGMusic.h"
#import "SGMatrix2D.h"
#import "SGAnimationScript.h"
#import "SGAnimation.h"
#import "SGBitmap.h"
#import "SGBitmapCell.h"
#import "SGSprite.h"
#import "SGTimer.h"
#import "SGFont.h"
#import "SGDirectionAngles.h"
#import "SGCharacter.h"


@interface SGSprites : NSObject
{
  
}

+ (SGPoint2D *)centerPoint:(SGSprite *)s;
+ (SGSprite *)createBasicSprite:(SGBitmap *)layer;
+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  layerNamed:(NSString *)layerName;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  atPoint:(SGPoint2D *)pt;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer;
+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  layersNamed:(NSArray *)layerNames;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers;
+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  position:(SGPoint2D *)pt;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  layerNamed:(NSString *)layerName;
+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  layersNamed:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  layersNamed:(NSArray *)layerNames;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  x:(float)x  y:(float)y;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani;
+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  x:(float)x  y:(float)y;
+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  layersNamed:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani;
+ (void)drawSprite:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  drawOffset:(SGPoint2D *)position;
+ (void)sprite:(SGSprite *)s  drawOffsetX:(int)xOffset  y:(int)yOffset;
+ (void)freeSprite:(SGSprite *)s;
+ (BOOL)hasSprite:(NSString *)name;
+ (void)moveSprite:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  move:(SGVector *)distance;
+ (void)sprite:(SGSprite *)s  movePct:(float)pct;
+ (void)sprite:(SGSprite *)s  move:(SGVector *)distance  pct:(float)pct;
+ (void)sprite:(SGSprite *)s  moveToX:(int)x  y:(int)y;
+ (void)releaseAllSprites;
+ (void)releaseSprite:(NSString *)name;
+ (int)sprite:(SGSprite *)s  addLayer:(SGBitmap *)newLayer  named:(NSString *)layerName;
+ (void)sprite:(SGSprite *)s  addToVelocity:(SGVector *)value;
+ (void)sprite:(SGSprite *)s  addValue:(NSString *)name;
+ (void)sprite:(SGSprite *)s  addValue:(NSString *)name  initally:(float)initVal;
+ (BOOL)spriteAnimationHasEnded:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  sendLayerForward:(int)visibleLayer;
+ (void)sprite:(SGSprite *)s  sendLayerToFront:(int)visibleLayer;
+ (SGCircle *)spriteCircle:(SGSprite *)s;
+ (SGBitmap *)spriteCollisionBitmap:(SGSprite *)s;
+ (SGCircle *)spriteCollisionCircle:(SGSprite *)s;
+ (collision_test_kind)spriteCollisionKind:(SGSprite *)s;
+ (SGRectangle *)spriteCollisionRectangle:(SGSprite *)s;
+ (int)spriteCurrentCell:(SGSprite *)s;
+ (SGRectangle *)spriteCurrentCellRectangle:(SGSprite *)s;
+ (float)spriteDX:(SGSprite *)s;
+ (float)spriteDY:(SGSprite *)s;
+ (float)spriteHeading:(SGSprite *)s;
+ (int)spriteHeight:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  hideLayerNamed:(NSString *)name;
+ (void)sprite:(SGSprite *)s  hideLayer:(int)id;
+ (SGBitmap *)sprite:(SGSprite *)s  layerAtIdx:(int)idx;
+ (SGBitmap *)sprite:(SGSprite *)s  layerNamed:(NSString *)name;
+ (SGCircle *)sprite:(SGSprite *)s  circleForLayer:(int)idx;
+ (SGCircle *)sprite:(SGSprite *)s  circleForLayerNamed:(NSString *)name;
+ (int)spriteLayerCount:(SGSprite *)s;
+ (int)sprite:(SGSprite *)s  heightOfLayerNamed:(NSString *)name;
+ (int)sprite:(SGSprite *)s  heightOfLayer:(int)idx;
+ (int)sprite:(SGSprite *)s  indexOfLayer:(NSString *)name;
+ (NSString *)sprite:(SGSprite *)s  layerName:(int)idx;
+ (SGPoint2D *)sprite:(SGSprite *)s  offsetOfLayerNamed:(NSString *)name;
+ (SGPoint2D *)sprite:(SGSprite *)s  offsetOfLayer:(int)idx;
+ (NSArray *)spriteLayerOffsets:(SGSprite *)s;
+ (SGRectangle *)sprite:(SGSprite *)s  rectangleForLayerNamed:(NSString *)name;
+ (SGRectangle *)sprite:(SGSprite *)s  rectangleForLayer:(int)idx;
+ (int)sprite:(SGSprite *)s  widthOfLayerNamed:(NSString *)name;
+ (int)sprite:(SGSprite *)s  widthOfLayer:(int)idx;
+ (NSArray *)spriteLayers:(SGSprite *)s;
+ (float)spriteMass:(SGSprite *)s;
+ (NSString *)spriteName:(SGSprite *)sprt;
+ (SGSprite *)spriteNamed:(NSString *)name;
+ (BOOL)spriteOffscreen:(SGSprite *)s;
+ (BOOL)sprite:(SGSprite *)s  onScreenAt:(SGPoint2D *)pt;
+ (BOOL)sprite:(SGSprite *)s  onScreenAtX:(int)x  y:(int)y;
+ (SGPoint2D *)spritePosition:(SGSprite *)s;
+ (void)spriteReplayAnimation:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  replayAnimationWithSound:(BOOL)withSound;
+ (float)spriteRotation:(SGSprite *)s;
+ (float)spriteScale:(SGSprite *)s;
+ (SGRectangle *)spriteScreenRectangle:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  sendLayerToBackward:(int)visibleLayer;
+ (void)sprite:(SGSprite *)s  sendLayerToBack:(int)visibleLayer;
+ (void)sprite:(SGSprite *)s  setCollisionBitmap:(SGBitmap *)bmp;
+ (void)sprite:(SGSprite *)s  setCollisionKind:(collision_test_kind)value;
+ (void)sprite:(SGSprite *)s  setDX:(float)value;
+ (void)sprite:(SGSprite *)s  setDY:(float)value;
+ (void)sprite:(SGSprite *)s  setHeading:(float)value;
+ (void)sprite:(SGSprite *)s  setOffsetOfLayerNamed:(NSString *)name  to:(SGPoint2D *)value;
+ (void)sprite:(SGSprite *)s  setOffsetOfLayer:(int)idx  to:(SGPoint2D *)value;
+ (void)sprite:(SGSprite *)s  setLayerOffsets:(NSArray *)values;
+ (void)sprite:(SGSprite *)s  sestMass:(float)value;
+ (void)sprite:(SGSprite *)s  setPosition:(SGPoint2D *)value;
+ (void)sprite:(SGSprite *)s  setRotation:(float)value;
+ (void)sprite:(SGSprite *)s  setScale:(float)value;
+ (void)sprite:(SGSprite *)s  setSpeed:(float)value;
+ (void)sprite:(SGSprite *)s  setValueNamed:(NSString *)name  to:(float)val;
+ (void)sprite:(SGSprite *)s  setValue:(int)idx  to:(float)val;
+ (void)sprite:(SGSprite *)s  setVelocity:(SGVector *)value;
+ (void)sprite:(SGSprite *)s  setX:(float)value;
+ (void)sprite:(SGSprite *)s  setY:(float)value;
+ (int)sprite:(SGSprite *)s  showLayer:(int)id;
+ (int)sprite:(SGSprite *)s  showLayerNamed:(NSString *)name;
+ (float)spriteSpeed:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  startAnimation:(int)idx;
+ (void)sprite:(SGSprite *)s  startAnimationNamed:(NSString *)named;
+ (void)sprite:(SGSprite *)s  startAnimationNamed:(NSString *)named  withSound:(BOOL)withSound;
+ (void)sprite:(SGSprite *)s  startAnimation:(int)idx  withSound:(BOOL)withSound;
+ (void)sprite:(SGSprite *)s  toggleVisibleLayer:(int)id;
+ (void)sprite:(SGSprite *)s  toggleVisibleLayerNamed:(NSString *)name;
+ (float)sprite:(SGSprite *)s  valueAt:(int)index;
+ (float)sprite:(SGSprite *)s  valueOf:(NSString *)name;
+ (int)spriteValueCount:(SGSprite *)s;
+ (NSArray *)spriteValueNames:(SGSprite *)s;
+ (SGVector *)spriteVelocity:(SGSprite *)s;
+ (int)sprite:(SGSprite *)s  visibleIndexOfLayer:(int)id;
+ (int)sprite:(SGSprite *)s  visibleIndexOfLayerNamed:(NSString *)name;
+ (int)sprite:(SGSprite *)s  visibleLayer:(int)idx;
+ (int)spriteVisibleLayerCount:(SGSprite *)s;
+ (NSArray *)spriteVisibleLayerIds:(SGSprite *)s;
+ (int)spriteWidth:(SGSprite *)s;
+ (float)spriteX:(SGSprite *)s;
+ (float)spriteY:(SGSprite *)s;
+ (void)updateSprite:(SGSprite *)s;
+ (void)updateSprite:(SGSprite *)s  withSound:(BOOL)withSound;
+ (void)updateSprite:(SGSprite *)s  percent:(float)pct;
+ (void)updateSprite:(SGSprite *)s  percent:(float)pct  withSound:(BOOL)withSound;
+ (void)updateSpriteAnimation:(SGSprite *)s;
+ (void)sprite:(SGSprite *)s  updateAnimationPct:(float)pct;
+ (void)sprite:(SGSprite *)s  updateAnimationWithSound:(BOOL)withSound;
+ (void)sprite:(SGSprite *)s  updateAnimationPct:(float)pct  withSound:(BOOL)withSound;
+ (SGVector *)vectorFromCenterOfSprite:(SGSprite *)s  toPoint:(SGPoint2D *)pt;
+ (SGVector *)vectorFromSprite:(SGSprite *)s1  toSprite:(SGSprite *)s2;








@end

