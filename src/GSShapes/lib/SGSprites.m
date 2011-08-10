#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGSprites.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGSprites : NSObject


+ (SGPoint2D *)centerPoint:(SGSprite *)s
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_CenterPoint(s->pointer)];
    return result;
}

+ (SGSprite *)createBasicSprite:(SGBitmap *)layer
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateBasicSprite(layer->pointer)];
    return result;
}

+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers
{
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSprite(layers_temp, [layers count])];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  layerNamed:(NSString *)layerName
{
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithLayer(layer->pointer, layerName_temp)];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  atPoint:(SGPoint2D *)pt
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateBasicSpritePt(layer->pointer, pt->data)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer
{
    char name_temp[[name length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateBasicSpriteNamed(name_temp, layer->pointer)];
    return result;
}

+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  layersNamed:(NSArray *)layerNames
{
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithLayerNames(layers_temp, layerNames_temp, [layers count], [layerNames count])];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithAnimation(layer->pointer, ani->pointer)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteNamed(name_temp, layers_temp, [layers count])];
    return result;
}

+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  animationScript:(SGAnimationScript *)ani
{
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithAnimationScript(layers_temp, ani->pointer, [layers count])];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithAnimationNamed(name_temp, layer->pointer, ani->pointer)];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  position:(SGPoint2D *)pt
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithAnimationPt(layer->pointer, ani->pointer, pt->data)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  layerNamed:(NSString *)layerName
{
    char name_temp[[name length] + 1];
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithLayerNamed(name_temp, layer->pointer, layerName_temp)];
    return result;
}

+ (SGSprite *)createSpriteWithLayers:(NSArray *)layers  layersNamed:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani
{
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithLayerNamesAndAnimationScript(layers_temp, layerNames_temp, ani->pointer, [layers count], [layerNames count])];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani
{
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithLayerAndAnimation(layer->pointer, layerName_temp, ani->pointer)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  layersNamed:(NSArray *)layerNames
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithLayerNamesNamed(name_temp, layers_temp, layerNames_temp, [layers count], [layerNames count])];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithAnimationScriptNamed(name_temp, layers_temp, ani->pointer, [layers count])];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  x:(float)x  y:(float)y
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateBasicSpriteXY(layer->pointer, x, y)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layer:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithLayerAndAnimationNamed(name_temp, layer->pointer, layerName_temp, ani->pointer)];
    return result;
}

+ (SGSprite *)createSpriteWithLayer:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  x:(float)x  y:(float)y
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Sprites_CreateSpriteWithAnimationXY(layer->pointer, ani->pointer, x, y)];
    return result;
}

+ (SGSprite *)createSpriteNamed:(NSString *)name  layers:(NSArray *)layers  layersNamed:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [SGSprite createWithId:sg_Sprites_CreateLayeredSpriteWithLayerNamesAndAnimationScriptNamed(name_temp, layers_temp, layerNames_temp, ani->pointer, [layers count], [layerNames count])];
    return result;
}

+ (void)drawSprite:(SGSprite *)s
{
    sg_Sprites_DrawSpriteOffsetXY(s->pointer, 0, 0);
}

+ (void)sprite:(SGSprite *)s  drawOffset:(SGPoint2D *)position
{
    sg_Sprites_DrawSpriteOffsetPoint(s->pointer, &position->data);
}

+ (void)sprite:(SGSprite *)s  drawOffsetX:(int)xOffset  y:(int)yOffset
{
    sg_Sprites_DrawSpriteOffsetXY(s->pointer, xOffset, yOffset);
}

+ (void)freeSprite:(SGSprite *)s
{
    sg_Sprites_FreeSprite(&s->pointer);
}

+ (BOOL)hasSprite:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_HasSprite(name_temp) != 0;
    return result;
}

+ (void)moveSprite:(SGSprite *)s
{
    sg_Sprites_MoveSpritePct(s->pointer, 1.0f);
}

+ (void)sprite:(SGSprite *)s  move:(SGVector *)distance
{
    sg_Sprites_MoveSpriteVecPct(s->pointer, &distance->data, 1.0f);
}

+ (void)sprite:(SGSprite *)s  movePct:(float)pct
{
    sg_Sprites_MoveSpritePct(s->pointer, pct);
}

+ (void)sprite:(SGSprite *)s  move:(SGVector *)distance  pct:(float)pct
{
    sg_Sprites_MoveSpriteVecPct(s->pointer, &distance->data, pct);
}

+ (void)sprite:(SGSprite *)s  moveToX:(int)x  y:(int)y
{
    sg_Sprites_MoveSpriteTo(s->pointer, x, y);
}

+ (void)releaseAllSprites
{
    sg_Sprites_ReleaseAllSprites();
}

+ (void)releaseSprite:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_ReleaseSprite(name_temp);
}

+ (int)sprite:(SGSprite *)s  addLayer:(SGBitmap *)newLayer  named:(NSString *)layerName
{
    char layerName_temp[[layerName length] + 1];
    int result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteAddLayer(s->pointer, newLayer->pointer, layerName_temp);
    return result;
}

+ (void)sprite:(SGSprite *)s  addToVelocity:(SGVector *)value
{
    sg_Sprites_SpriteAddToVelocity(s->pointer, &value->data);
}

+ (void)sprite:(SGSprite *)s  addValue:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteAddValue(s->pointer, name_temp);
}

+ (void)sprite:(SGSprite *)s  addValue:(NSString *)name  initally:(float)initVal
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteAddValueWithInitialValue(s->pointer, name_temp, initVal);
}

+ (BOOL)spriteAnimationHasEnded:(SGSprite *)s
{
    BOOL result;
    result = sg_Sprites_SpriteAnimationHasEnded(s->pointer) != 0;
    return result;
}

+ (void)sprite:(SGSprite *)s  sendLayerForward:(int)visibleLayer
{
    sg_Sprites_SpriteBringLayerForward(s->pointer, visibleLayer);
}

+ (void)sprite:(SGSprite *)s  sendLayerToFront:(int)visibleLayer
{
    sg_Sprites_SpriteBringLayerToFront(s->pointer, visibleLayer);
}

+ (SGCircle *)spriteCircle:(SGSprite *)s
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteCircle(s->pointer)];
    return result;
}

+ (SGBitmap *)spriteCollisionBitmap:(SGSprite *)s
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Sprites_SpriteCollisionBitmap(s->pointer)];
    return result;
}

+ (SGCircle *)spriteCollisionCircle:(SGSprite *)s
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteCollisionCircle(s->pointer)];
    return result;
}

+ (collision_test_kind)spriteCollisionKind:(SGSprite *)s
{
    collision_test_kind result;
    result = (collision_test_kind)sg_Sprites_SpriteCollisionKind(s->pointer);
    return result;
}

+ (SGRectangle *)spriteCollisionRectangle:(SGSprite *)s
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteCollisionRectangle(s->pointer)];
    return result;
}

+ (int)spriteCurrentCell:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteCurrentCell(s->pointer);
    return result;
}

+ (SGRectangle *)spriteCurrentCellRectangle:(SGSprite *)s
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteCurrentCellRectangle(s->pointer)];
    return result;
}

+ (float)spriteDX:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteDX(s->pointer);
    return result;
}

+ (float)spriteDY:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteDY(s->pointer);
    return result;
}

+ (float)spriteHeading:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteHeading(s->pointer);
    return result;
}

+ (int)spriteHeight:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteHeight(s->pointer);
    return result;
}

+ (void)sprite:(SGSprite *)s  hideLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteHideLayerNamed(s->pointer, name_temp);
}

+ (void)sprite:(SGSprite *)s  hideLayer:(int)id
{
    sg_Sprites_SpriteHideLayer(s->pointer, id);
}

+ (SGBitmap *)sprite:(SGSprite *)s  layerAtIdx:(int)idx
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Sprites_SpriteLayerAtIdx(s->pointer, idx)];
    return result;
}

+ (SGBitmap *)sprite:(SGSprite *)s  layerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Sprites_SpriteLayerNamed(s->pointer, name_temp)];
    return result;
}

+ (SGCircle *)sprite:(SGSprite *)s  circleForLayer:(int)idx
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteLayerCircle(s->pointer, idx)];
    return result;
}

+ (SGCircle *)sprite:(SGSprite *)s  circleForLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGCircle * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGCircle circleForData:sg_Sprites_SpriteLayerNamedCircle(s->pointer, name_temp)];
    return result;
}

+ (int)spriteLayerCount:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteLayerCount(s->pointer);
    return result;
}

+ (int)sprite:(SGSprite *)s  heightOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerNamedHeight(s->pointer, name_temp);
    return result;
}

+ (int)sprite:(SGSprite *)s  heightOfLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteLayerHeight(s->pointer, idx);
    return result;
}

+ (int)sprite:(SGSprite *)s  indexOfLayer:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerIndex(s->pointer, name_temp);
    return result;
}

+ (NSString *)sprite:(SGSprite *)s  layerName:(int)idx
{
    char result[2048];
    sg_Sprites_SpriteLayerName(s->pointer, idx, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGPoint2D *)sprite:(SGSprite *)s  offsetOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGPoint2D * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGPoint2D point2DForData:sg_Sprites_SpriteLayerOffsetNamed(s->pointer, name_temp)];
    return result;
}

+ (SGPoint2D *)sprite:(SGSprite *)s  offsetOfLayer:(int)idx
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_SpriteLayerOffset(s->pointer, idx)];
    return result;
}

+ (NSArray *)spriteLayerOffsets:(SGSprite *)s
{
    int result_len = sg_Sprites_SpriteLayerCount(s->pointer);
    point2d result[result_len];
    sg_Sprites_SpriteLayerOffsets(s->pointer, result, result_len);
    return [SGPoint2D arrayOfPoint2Ds:result size:result_len];
}

+ (SGRectangle *)sprite:(SGSprite *)s  rectangleForLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGRectangle * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteLayerNamedRectangle(s->pointer, name_temp)];
    return result;
}

+ (SGRectangle *)sprite:(SGSprite *)s  rectangleForLayer:(int)idx
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteLayerRectangle(s->pointer, idx)];
    return result;
}

+ (int)sprite:(SGSprite *)s  widthOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerNamedWidth(s->pointer, name_temp);
    return result;
}

+ (int)sprite:(SGSprite *)s  widthOfLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteLayerWidth(s->pointer, idx);
    return result;
}

+ (NSArray *)spriteLayers:(SGSprite *)s
{
    int result_len = sg_Sprites_SpriteLayerCount(s->pointer);
    bitmap result[result_len];
    sg_Sprites_SpriteLayers(s->pointer, result, result_len);
    return [SGBitmap arrayOfBitmaps:result size:result_len];
}

+ (float)spriteMass:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteMass(s->pointer);
    return result;
}

+ (NSString *)spriteName:(SGSprite *)sprt
{
    char result[2048];
    sg_Sprites_SpriteName(sprt->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGSprite *)spriteNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGSprite createWithId:sg_Sprites_SpriteNamed(name_temp)];
    return result;
}

+ (BOOL)spriteOffscreen:(SGSprite *)s
{
    BOOL result;
    result = sg_Sprites_SpriteOffscreen(s->pointer) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  onScreenAt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Sprites_SpriteOnScreenAtPoint(s->pointer, &pt->data) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  onScreenAtX:(int)x  y:(int)y
{
    BOOL result;
    result = sg_Sprites_SpriteOnScreenAt(s->pointer, x, y) != 0;
    return result;
}

+ (SGPoint2D *)spritePosition:(SGSprite *)s
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_SpritePosition(s->pointer)];
    return result;
}

+ (void)spriteReplayAnimation:(SGSprite *)s
{
    sg_Sprites_SpriteReplayAnimation(s->pointer);
}

+ (void)sprite:(SGSprite *)s  replayAnimationWithSound:(BOOL)withSound
{
    sg_Sprites_ReplayAnimationWithSound(s->pointer, (withSound ? 1 : 0));
}

+ (float)spriteRotation:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteRotation(s->pointer);
    return result;
}

+ (float)spriteScale:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteScale(s->pointer);
    return result;
}

+ (SGRectangle *)spriteScreenRectangle:(SGSprite *)s
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteScreenRectangle(s->pointer)];
    return result;
}

+ (void)sprite:(SGSprite *)s  sendLayerToBackward:(int)visibleLayer
{
    sg_Sprites_SpriteSendLayerBackward(s->pointer, visibleLayer);
}

+ (void)sprite:(SGSprite *)s  sendLayerToBack:(int)visibleLayer
{
    sg_Sprites_SpriteSendLayerToBack(s->pointer, visibleLayer);
}

+ (void)sprite:(SGSprite *)s  setCollisionBitmap:(SGBitmap *)bmp
{
    sg_Sprites_SpriteSetCollisionBitmap(s->pointer, bmp->pointer);
}

+ (void)sprite:(SGSprite *)s  setCollisionKind:(collision_test_kind)value
{
    sg_Sprites_SpriteSetCollisionKind(s->pointer, (int)value);
}

+ (void)sprite:(SGSprite *)s  setDX:(float)value
{
    sg_Sprites_SpriteSetDX(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setDY:(float)value
{
    sg_Sprites_SpriteSetDY(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setHeading:(float)value
{
    sg_Sprites_SpriteSetHeading(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setOffsetOfLayerNamed:(NSString *)name  to:(SGPoint2D *)value
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteSetLayerOffsetNamed(s->pointer, name_temp, &value->data);
}

+ (void)sprite:(SGSprite *)s  setOffsetOfLayer:(int)idx  to:(SGPoint2D *)value
{
    sg_Sprites_SpriteSetLayerOffset(s->pointer, idx, &value->data);
}

+ (void)sprite:(SGSprite *)s  setLayerOffsets:(NSArray *)values
{
    point2d values_temp[[values count]];
    [SGPoint2D getPoint2Ds:values_temp fromArray:values maxSize:[values count]];
    sg_Sprites_SpriteSetLayerOffsets(s->pointer, values_temp, [values count]);
}

+ (void)sprite:(SGSprite *)s  sestMass:(float)value
{
    sg_Sprites_SpriteSetMass(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setPosition:(SGPoint2D *)value
{
    sg_Sprites_SpriteSetPosition(s->pointer, &value->data);
}

+ (void)sprite:(SGSprite *)s  setRotation:(float)value
{
    sg_Sprites_SpriteSetRotation(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setScale:(float)value
{
    sg_Sprites_SpriteSetScale(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setSpeed:(float)value
{
    sg_Sprites_SpriteSetSpeed(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setValueNamed:(NSString *)name  to:(float)val
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteSetValueNamed(s->pointer, name_temp, val);
}

+ (void)sprite:(SGSprite *)s  setValue:(int)idx  to:(float)val
{
    sg_Sprites_SpriteSetValue(s->pointer, idx, val);
}

+ (void)sprite:(SGSprite *)s  setVelocity:(SGVector *)value
{
    sg_Sprites_SpriteSetVelocity(s->pointer, &value->data);
}

+ (void)sprite:(SGSprite *)s  setX:(float)value
{
    sg_Sprites_SpriteSetX(s->pointer, value);
}

+ (void)sprite:(SGSprite *)s  setY:(float)value
{
    sg_Sprites_SpriteSetY(s->pointer, value);
}

+ (int)sprite:(SGSprite *)s  showLayer:(int)id
{
    int result;
    result = sg_Sprites_SpriteShowLayer(s->pointer, id);
    return result;
}

+ (int)sprite:(SGSprite *)s  showLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteShowLayerNamed(s->pointer, name_temp);
    return result;
}

+ (float)spriteSpeed:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteSpeed(s->pointer);
    return result;
}

+ (void)sprite:(SGSprite *)s  startAnimation:(int)idx
{
    sg_Sprites_SpriteStartAnimation(s->pointer, idx);
}

+ (void)sprite:(SGSprite *)s  startAnimationNamed:(NSString *)named
{
    char named_temp[[named length] + 1];
    [named getCString:named_temp maxLength:[named length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteStartAnimationNamed(s->pointer, named_temp);
}

+ (void)sprite:(SGSprite *)s  startAnimationNamed:(NSString *)named  withSound:(BOOL)withSound
{
    char named_temp[[named length] + 1];
    [named getCString:named_temp maxLength:[named length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteStartAnimationNamedWithSound(s->pointer, named_temp, (withSound ? 1 : 0));
}

+ (void)sprite:(SGSprite *)s  startAnimation:(int)idx  withSound:(BOOL)withSound
{
    sg_Sprites_SpriteStartAnimationWithSound(s->pointer, idx, (withSound ? 1 : 0));
}

+ (void)sprite:(SGSprite *)s  toggleVisibleLayer:(int)id
{
    sg_Sprites_SpriteToggleLayerVisible(s->pointer, id);
}

+ (void)sprite:(SGSprite *)s  toggleVisibleLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteToggleLayerNamedVisible(s->pointer, name_temp);
}

+ (float)sprite:(SGSprite *)s  valueAt:(int)index
{
    float result;
    result = sg_Sprites_SpriteValue(s->pointer, index);
    return result;
}

+ (float)sprite:(SGSprite *)s  valueOf:(NSString *)name
{
    char name_temp[[name length] + 1];
    float result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteValueNamed(s->pointer, name_temp);
    return result;
}

+ (int)spriteValueCount:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteValueCount(s->pointer);
    return result;
}

+ (NSArray *)spriteValueNames:(SGSprite *)s
{
    int result_len = sg_Sprites_SpriteValueCount(s->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Sprites_SpriteValueNames(s->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

+ (SGVector *)spriteVelocity:(SGSprite *)s
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_SpriteVelocity(s->pointer)];
    return result;
}

+ (int)sprite:(SGSprite *)s  visibleIndexOfLayer:(int)id
{
    int result;
    result = sg_Sprites_SpriteVisibleIndexOfLayer(s->pointer, id);
    return result;
}

+ (int)sprite:(SGSprite *)s  visibleIndexOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteVisibleIndexOfLayerNamed(s->pointer, name_temp);
    return result;
}

+ (int)sprite:(SGSprite *)s  visibleLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteVisibleLayer(s->pointer, idx);
    return result;
}

+ (int)spriteVisibleLayerCount:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteVisibleLayerCount(s->pointer);
    return result;
}

+ (NSArray *)spriteVisibleLayerIds:(SGSprite *)s
{
    int result_len = sg_Sprites_SpriteVisibleLayerCount(s->pointer);
    int result[result_len];
    sg_Sprites_SpriteVisibleLayerIds(s->pointer, result, result_len);
    return [SGObjcUtils arrayOfIntegers:result size:result_len];
}

+ (int)spriteWidth:(SGSprite *)s
{
    int result;
    result = sg_Sprites_SpriteWidth(s->pointer);
    return result;
}

+ (float)spriteX:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteX(s->pointer);
    return result;
}

+ (float)spriteY:(SGSprite *)s
{
    float result;
    result = sg_Sprites_SpriteY(s->pointer);
    return result;
}

+ (void)updateSprite:(SGSprite *)s
{
    sg_Sprites_UpdateSpritePctWithSound(s->pointer, 1.0f, 1);
}

+ (void)updateSprite:(SGSprite *)s  withSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpritePctWithSound(s->pointer, 1.0f, (withSound ? 1 : 0));
}

+ (void)updateSprite:(SGSprite *)s  percent:(float)pct
{
    sg_Sprites_UpdateSpritePctWithSound(s->pointer, pct, 1);
}

+ (void)updateSprite:(SGSprite *)s  percent:(float)pct  withSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpritePctWithSound(s->pointer, pct, (withSound ? 1 : 0));
}

+ (void)updateSpriteAnimation:(SGSprite *)s
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(s->pointer, 1.0f, 1);
}

+ (void)sprite:(SGSprite *)s  updateAnimationPct:(float)pct
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(s->pointer, pct, 1);
}

+ (void)sprite:(SGSprite *)s  updateAnimationWithSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(s->pointer, 1.0f, (withSound ? 1 : 0));
}

+ (void)sprite:(SGSprite *)s  updateAnimationPct:(float)pct  withSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(s->pointer, pct, (withSound ? 1 : 0));
}

+ (SGVector *)vectorFromCenterOfSprite:(SGSprite *)s  toPoint:(SGPoint2D *)pt
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_VectorFromCenterSpriteToPoint(s->pointer, &pt->data)];
    return result;
}

+ (SGVector *)vectorFromSprite:(SGSprite *)s1  toSprite:(SGSprite *)s2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_VectorFromTo(s1->pointer, s2->pointer)];
    return result;
}









@end
