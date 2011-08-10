#import "SGSprite.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGSprite : NSObject

+ (void) getSprites:(sprite *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGSprite *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfSprites:(sprite *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGSprite *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGSprite createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(sprite)ptr
{
    if (ptr == nil) return nil;
    id obj = [PointerManager objectForKey: (id)ptr];
    
    if (obj == nil)
    {
        // Create and assign to obj...
        obj = [[[self alloc] initWithId:ptr] autorelease];
    }
    
    return obj;
}

- (id)initWithId:(sprite)ptr
{
    if (ptr == nil)
    {
        [self release];
        return nil;
    }
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        pointer = ptr;
        [PointerManager registerObject:self withKey:(id)ptr];
    }
    return self;
}

- (void)releasePointer
{
    pointer = nil;
}



- (id)initWithBitmap:(SGBitmap *)layer
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateBasicSprite(layer->pointer)];
    return result;
}

- (id)initWithBitmaps:(NSArray *)layers
{
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSprite(layers_temp, [layers count])];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName
{
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateSpriteWithLayer(layer->pointer, layerName_temp)];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateSpriteWithAnimation(layer->pointer, ani->pointer)];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer
{
    char name_temp[[name length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateBasicSpriteNamed(name_temp, layer->pointer)];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteNamed(name_temp, layers_temp, [layers count])];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  position:(SGPoint2D *)pt
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateBasicSpritePt(layer->pointer, pt->data)];
    return result;
}

- (id)initWithBitmaps:(NSArray *)layers  animationScript:(SGAnimationScript *)ani
{
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithAnimationScript(layers_temp, ani->pointer, [layers count])];
    return result;
}

- (id)initWithBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames
{
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithLayerNames(layers_temp, layerNames_temp, [layers count], [layerNames count])];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithLayerNamesNamed(name_temp, layers_temp, layerNames_temp, [layers count], [layerNames count])];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  x:(float)x  y:(float)y
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateBasicSpriteXY(layer->pointer, x, y)];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  position:(SGPoint2D *)pt
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateSpriteWithAnimationPt(layer->pointer, ani->pointer, pt->data)];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateSpriteWithAnimationNamed(name_temp, layer->pointer, ani->pointer)];
    return result;
}

- (id)initNamed: (NSString *)name  withBitmaps:(NSArray *)layers  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithAnimationScriptNamed(name_temp, layers_temp, ani->pointer, [layers count])];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName
{
    char name_temp[[name length] + 1];
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateSpriteWithLayerNamed(name_temp, layer->pointer, layerName_temp)];
    return result;
}

- (id)initWithBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani
{
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithLayerNamesAndAnimationScript(layers_temp, layerNames_temp, ani->pointer, [layers count], [layerNames count])];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani
{
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateSpriteWithLayerAndAnimation(layer->pointer, layerName_temp, ani->pointer)];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmap:(SGBitmap *)layer  layerNamed:(NSString *)layerName  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    char layerName_temp[[layerName length] + 1];
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Sprites_CreateSpriteWithLayerAndAnimationNamed(name_temp, layer->pointer, layerName_temp, ani->pointer)];
    return result;
}

- (id)initNamed:(NSString *)name  withBitmaps:(NSArray *)layers  layerNames:(NSArray *)layerNames  animationScript:(SGAnimationScript *)ani
{
    char name_temp[[name length] + 1];
    bitmap layers_temp[[layers count]];
    char * layerNames_temp[[layerNames count]];
    [SGStringBufferManager stringBufferManagerFor:layerNames_temp size:[layerNames count]];
    
    SGSprite * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [SGBitmap getBitmaps:layers_temp fromArray:layers maxSize:[layers count]];
    [NSString getStrings:layerNames_temp fromArray:layerNames maxSize:[layerNames count]];
    result = [self initWithId: sg_Sprites_CreateLayeredSpriteWithLayerNamesAndAnimationScriptNamed(name_temp, layers_temp, layerNames_temp, ani->pointer, [layers count], [layerNames count])];
    return result;
}

- (id)initWithBitmap:(SGBitmap *)layer  animationScript:(SGAnimationScript *)ani  x:(float)x  y:(float)y
{
    SGSprite * result;
    result = [self initWithId: sg_Sprites_CreateSpriteWithAnimationXY(layer->pointer, ani->pointer, x, y)];
    return result;
}



@dynamic animationHasEnded;
@dynamic centerPoint;
@dynamic collisionBitmap;
@dynamic collisionKind;
@dynamic collisionRectangle;
@dynamic currentCell;
@dynamic currentCellRectangle;
@dynamic dX;
@dynamic dY;
@dynamic heading;
@dynamic height;
@dynamic layerCount;
@dynamic layerOffsets;
@dynamic layers;
@dynamic mass;
@dynamic name;
@dynamic position;
@dynamic rotation;
@dynamic scale;
@dynamic screenRectangle;
@dynamic speed;
@dynamic valueCount;
@dynamic valueNames;
@dynamic velocity;
@dynamic visibleLayerCount;
@dynamic visibleLayerIds;
@dynamic width;
@dynamic x;
@dynamic y;


- (BOOL)animationHasEnded
{
    BOOL result;
    result = sg_Sprites_SpriteAnimationHasEnded(self->pointer) != 0;
    return result;
}

- (SGPoint2D *)centerPoint
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_CenterPoint(self->pointer)];
    return result;
}

- (SGBitmap *)collisionBitmap
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Sprites_SpriteCollisionBitmap(self->pointer)];
    return result;
}

- (void)setCollisionBitmap:(SGBitmap *)bmp
{
    sg_Sprites_SpriteSetCollisionBitmap(self->pointer, bmp->pointer);
}

- (collision_test_kind)collisionKind
{
    collision_test_kind result;
    result = (collision_test_kind)sg_Sprites_SpriteCollisionKind(self->pointer);
    return result;
}

- (void)setCollisionKind:(collision_test_kind)value
{
    sg_Sprites_SpriteSetCollisionKind(self->pointer, (int)value);
}

- (SGRectangle *)collisionRectangle
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteCollisionRectangle(self->pointer)];
    return result;
}

- (int)currentCell
{
    int result;
    result = sg_Sprites_SpriteCurrentCell(self->pointer);
    return result;
}

- (SGRectangle *)currentCellRectangle
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteCurrentCellRectangle(self->pointer)];
    return result;
}

- (float)dX
{
    float result;
    result = sg_Sprites_SpriteDX(self->pointer);
    return result;
}

- (void)setDX:(float)value
{
    sg_Sprites_SpriteSetDX(self->pointer, value);
}

- (float)dY
{
    float result;
    result = sg_Sprites_SpriteDY(self->pointer);
    return result;
}

- (void)setDY:(float)value
{
    sg_Sprites_SpriteSetDY(self->pointer, value);
}

- (float)heading
{
    float result;
    result = sg_Sprites_SpriteHeading(self->pointer);
    return result;
}

- (void)setHeading:(float)value
{
    sg_Sprites_SpriteSetHeading(self->pointer, value);
}

- (int)height
{
    int result;
    result = sg_Sprites_SpriteHeight(self->pointer);
    return result;
}

- (int)layerCount
{
    int result;
    result = sg_Sprites_SpriteLayerCount(self->pointer);
    return result;
}

- (NSArray *)layerOffsets
{
    int result_len = sg_Sprites_SpriteLayerCount(self->pointer);
    point2d result[result_len];
    sg_Sprites_SpriteLayerOffsets(self->pointer, result, result_len);
    return [SGPoint2D arrayOfPoint2Ds:result size:result_len];
}

- (void)setLayerOffsets:(NSArray *)values
{
    point2d values_temp[[values count]];
    [SGPoint2D getPoint2Ds:values_temp fromArray:values maxSize:[values count]];
    sg_Sprites_SpriteSetLayerOffsets(self->pointer, values_temp, [values count]);
}

- (NSArray *)layers
{
    int result_len = sg_Sprites_SpriteLayerCount(self->pointer);
    bitmap result[result_len];
    sg_Sprites_SpriteLayers(self->pointer, result, result_len);
    return [SGBitmap arrayOfBitmaps:result size:result_len];
}

- (float)mass
{
    float result;
    result = sg_Sprites_SpriteMass(self->pointer);
    return result;
}

- (void)setMass:(float)value
{
    sg_Sprites_SpriteSetMass(self->pointer, value);
}

- (NSString *)name
{
    char result[2048];
    sg_Sprites_SpriteName(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (SGPoint2D *)pri_position
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_SpritePosition(self->pointer)];
    return result;
}

- (void)setPosition:(SGPoint2D *)value
{
    sg_Sprites_SpriteSetPosition(self->pointer, &value->data);
}

- (SGPoint2D *)position
{
    SGWrappedPoint2D *result;
    result = [SGWrappedPoint2D point2DWithDelegate:self update:@selector(setPosition:) andRead: @selector(pri_position)];
    return result;
}

- (float)rotation
{
    float result;
    result = sg_Sprites_SpriteRotation(self->pointer);
    return result;
}

- (void)setRotation:(float)value
{
    sg_Sprites_SpriteSetRotation(self->pointer, value);
}

- (float)scale
{
    float result;
    result = sg_Sprites_SpriteScale(self->pointer);
    return result;
}

- (void)setScale:(float)value
{
    sg_Sprites_SpriteSetScale(self->pointer, value);
}

- (SGRectangle *)screenRectangle
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteScreenRectangle(self->pointer)];
    return result;
}

- (float)speed
{
    float result;
    result = sg_Sprites_SpriteSpeed(self->pointer);
    return result;
}

- (void)setSpeed:(float)value
{
    sg_Sprites_SpriteSetSpeed(self->pointer, value);
}

- (int)valueCount
{
    int result;
    result = sg_Sprites_SpriteValueCount(self->pointer);
    return result;
}

- (NSArray *)valueNames
{
    int result_len = sg_Sprites_SpriteValueCount(self->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Sprites_SpriteValueNames(self->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

- (SGVector *)pri_velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_SpriteVelocity(self->pointer)];
    return result;
}

- (void)setVelocity:(SGVector *)value
{
    sg_Sprites_SpriteSetVelocity(self->pointer, &value->data);
}

- (SGVector *)velocity
{
    SGWrappedVector *result;
    result = [SGWrappedVector vectorWithDelegate:self update:@selector(setVelocity:) andRead: @selector(pri_velocity)];
    return result;
}

- (int)visibleLayerCount
{
    int result;
    result = sg_Sprites_SpriteVisibleLayerCount(self->pointer);
    return result;
}

- (NSArray *)visibleLayerIds
{
    int result_len = sg_Sprites_SpriteVisibleLayerCount(self->pointer);
    int result[result_len];
    sg_Sprites_SpriteVisibleLayerIds(self->pointer, result, result_len);
    return [SGObjcUtils arrayOfIntegers:result size:result_len];
}

- (int)width
{
    int result;
    result = sg_Sprites_SpriteWidth(self->pointer);
    return result;
}

- (float)x
{
    float result;
    result = sg_Sprites_SpriteX(self->pointer);
    return result;
}

- (void)setX:(float)value
{
    sg_Sprites_SpriteSetX(self->pointer, value);
}

- (float)y
{
    float result;
    result = sg_Sprites_SpriteY(self->pointer);
    return result;
}

- (void)setY:(float)value
{
    sg_Sprites_SpriteSetY(self->pointer, value);
}

- (int)addLayer:(SGBitmap *)newLayer  named:(NSString *)layerName
{
    char layerName_temp[[layerName length] + 1];
    int result;
    [layerName getCString:layerName_temp maxLength:[layerName length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteAddLayer(self->pointer, newLayer->pointer, layerName_temp);
    return result;
}

- (void)addToVelocity:(SGVector *)value
{
    sg_Sprites_SpriteAddToVelocity(self->pointer, &value->data);
}

- (void)addValue:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteAddValue(self->pointer, name_temp);
}

- (void)addValue:(NSString *)name  initally:(float)initVal
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteAddValueWithInitialValue(self->pointer, name_temp, initVal);
}

- (float)angleTo:(SGSprite *)s2
{
    float result;
    result = sg_Geometry_CalculateAngleBetweenSprites(self->pointer, s2->pointer);
    return result;
}

- (BOOL)collisionWithBitmap:(SGBitmap *)bmp  at:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_SpriteBitmapAtPointCollision(self->pointer, bmp->pointer, &pt->data) != 0;
    return result;
}

- (BOOL)collisionWithBitmap:(SGBitmap *)bmp  x:(float)x  y:(float)y
{
    BOOL result;
    result = sg_Physics_SpriteBitmapCollision(self->pointer, bmp->pointer, x, y) != 0;
    return result;
}

- (void)centerCameraOffset:(SGVector *)offset
{
    sg_Camera_CenterCameraOn(self->pointer, &offset->data);
}

- (void)centerCameraOffsetX:(int)offsetX  offsetY:(int)offsetY
{
    sg_Camera_CenterCameraOnWithXYOffset(self->pointer, offsetX, offsetY);
}

- (SGCircle *)circle
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteCircle(self->pointer)];
    return result;
}

- (void)circleCollideWithCircle:(SGCircle *)c
{
    sg_Physics_CollideCircleCircle(self->pointer, &c->data);
}

- (void)circleCollideWithLine:(SGLineSegment *)line
{
    sg_Physics_CollideCircleLine(self->pointer, &line->data);
}

- (void)circleCollideWithRectangle:(SGRectangle *)rect
{
    sg_Physics_CollideCircleRectangle(self->pointer, &rect->data);
}

- (void)circleCollideWithLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    sg_Physics_CollideCircleLines(self->pointer, lines_temp, [lines count]);
}

- (SGCircle *)circleForLayer:(int)idx
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteLayerCircle(self->pointer, idx)];
    return result;
}

- (SGCircle *)circleForLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGCircle * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGCircle circleForData:sg_Sprites_SpriteLayerNamedCircle(self->pointer, name_temp)];
    return result;
}

- (void)circlesCollide:(SGSprite *)s2
{
    sg_Physics_CollideCircles(self->pointer, s2->pointer);
}

- (SGCircle *)collisionCircle
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Sprites_SpriteCollisionCircle(self->pointer)];
    return result;
}

- (BOOL)collisionWithSprite:(SGSprite *)s2
{
    BOOL result;
    result = sg_Physics_SpriteCollision(self->pointer, s2->pointer) != 0;
    return result;
}

- (void)draw
{
    sg_Sprites_DrawSpriteOffsetXY(self->pointer, 0, 0);
}

- (void)drawOffset:(SGPoint2D *)position
{
    sg_Sprites_DrawSpriteOffsetPoint(self->pointer, &position->data);
}

- (void)drawOffsetX:(int)xOffset  y:(int)yOffset
{
    sg_Sprites_DrawSpriteOffsetXY(self->pointer, xOffset, yOffset);
}

- (void)hideLayer:(int)id
{
    sg_Sprites_SpriteHideLayer(self->pointer, id);
}

- (void)hideLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteHideLayerNamed(self->pointer, name_temp);
}

- (int)indexOfLayer:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerIndex(self->pointer, name_temp);
    return result;
}

- (SGBitmap *)layerAtIdx:(int)idx
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Sprites_SpriteLayerAtIdx(self->pointer, idx)];
    return result;
}

- (int)heightOfLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteLayerHeight(self->pointer, idx);
    return result;
}

- (int)heightOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerNamedHeight(self->pointer, name_temp);
    return result;
}

- (NSString *)layerName:(int)idx
{
    char result[2048];
    sg_Sprites_SpriteLayerName(self->pointer, idx, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (SGBitmap *)layerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Sprites_SpriteLayerNamed(self->pointer, name_temp)];
    return result;
}

- (SGPoint2D *)offsetOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGPoint2D * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGPoint2D point2DForData:sg_Sprites_SpriteLayerOffsetNamed(self->pointer, name_temp)];
    return result;
}

- (SGPoint2D *)offsetOfLayer:(int)idx
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Sprites_SpriteLayerOffset(self->pointer, idx)];
    return result;
}

- (int)widthOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteLayerNamedWidth(self->pointer, name_temp);
    return result;
}

- (int)widthOfLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteLayerWidth(self->pointer, idx);
    return result;
}

- (void)move
{
    sg_Sprites_MoveSpritePct(self->pointer, 1.0f);
}

- (void)move:(SGVector *)distance
{
    sg_Sprites_MoveSpriteVecPct(self->pointer, &distance->data, 1.0f);
}

- (void)movePct:(float)pct
{
    sg_Sprites_MoveSpritePct(self->pointer, pct);
}

- (void)move:(SGVector *)distance  pct:(float)pct
{
    sg_Sprites_MoveSpriteVecPct(self->pointer, &distance->data, pct);
}

- (void)moveToX:(int)x  y:(int)y
{
    sg_Sprites_MoveSpriteTo(self->pointer, x, y);
}

- (BOOL)offscreen
{
    BOOL result;
    result = sg_Sprites_SpriteOffscreen(self->pointer) != 0;
    return result;
}

- (BOOL)onScreenAt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Sprites_SpriteOnScreenAtPoint(self->pointer, &pt->data) != 0;
    return result;
}

- (BOOL)onScreenAtX:(int)x  y:(int)y
{
    BOOL result;
    result = sg_Sprites_SpriteOnScreenAt(self->pointer, x, y) != 0;
    return result;
}

- (BOOL)collisionWithRect:(SGRectangle *)r
{
    BOOL result;
    result = sg_Physics_SpriteRectangleCollision(self->pointer, &r->data) != 0;
    return result;
}

- (BOOL)collisionWithRectX:(float)x  y:(float)y  width:(int)width  height:(int)height
{
    BOOL result;
    result = sg_Physics_SpriteRectCollision(self->pointer, x, y, width, height) != 0;
    return result;
}

- (SGRectangle *)rectangleForLayer:(int)idx
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteLayerRectangle(self->pointer, idx)];
    return result;
}

- (SGRectangle *)rectangleForLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGRectangle * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGRectangle rectangleForData:sg_Sprites_SpriteLayerNamedRectangle(self->pointer, name_temp)];
    return result;
}

- (void)replayAnimation
{
    sg_Sprites_SpriteReplayAnimation(self->pointer);
}

- (void)replayAnimationWithSound:(BOOL)withSound
{
    sg_Sprites_ReplayAnimationWithSound(self->pointer, (withSound ? 1 : 0));
}

- (void)sendLayerForward:(int)visibleLayer
{
    sg_Sprites_SpriteBringLayerForward(self->pointer, visibleLayer);
}

- (void)sendLayerToBack:(int)visibleLayer
{
    sg_Sprites_SpriteSendLayerToBack(self->pointer, visibleLayer);
}

- (void)sendLayerToBackward:(int)visibleLayer
{
    sg_Sprites_SpriteSendLayerBackward(self->pointer, visibleLayer);
}

- (void)sendLayerToFront:(int)visibleLayer
{
    sg_Sprites_SpriteBringLayerToFront(self->pointer, visibleLayer);
}

- (void)layer:(int)idx  setOffset:(SGPoint2D *)value
{
    sg_Sprites_SpriteSetLayerOffset(self->pointer, idx, &value->data);
}

- (void)layerNamed:(NSString *)name  setOffset:(SGPoint2D *)value
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteSetLayerOffsetNamed(self->pointer, name_temp, &value->data);
}

- (void)setValue:(int)idx  to:(float)val
{
    sg_Sprites_SpriteSetValue(self->pointer, idx, val);
}

- (void)setValueNamed:(NSString *)name  to:(float)val
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteSetValueNamed(self->pointer, name_temp, val);
}

- (int)showLayer:(int)id
{
    int result;
    result = sg_Sprites_SpriteShowLayer(self->pointer, id);
    return result;
}

- (int)showLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteShowLayerNamed(self->pointer, name_temp);
    return result;
}

- (void)startAnimationNamed:(NSString *)named
{
    char named_temp[[named length] + 1];
    [named getCString:named_temp maxLength:[named length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteStartAnimationNamed(self->pointer, named_temp);
}

- (void)startAnimation:(int)idx
{
    sg_Sprites_SpriteStartAnimation(self->pointer, idx);
}

- (void)startAnimationNamed:(NSString *)named  withSound:(BOOL)withSound
{
    char named_temp[[named length] + 1];
    [named getCString:named_temp maxLength:[named length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteStartAnimationNamedWithSound(self->pointer, named_temp, (withSound ? 1 : 0));
}

- (void)startAnimation:(int)idx  withSound:(BOOL)withSound
{
    sg_Sprites_SpriteStartAnimationWithSound(self->pointer, idx, (withSound ? 1 : 0));
}

- (void)toggleLayerVisible:(int)id
{
    sg_Sprites_SpriteToggleLayerVisible(self->pointer, id);
}

- (void)toggleLayerNamedVisible:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Sprites_SpriteToggleLayerNamedVisible(self->pointer, name_temp);
}

- (void)update
{
    sg_Sprites_UpdateSpritePctWithSound(self->pointer, 1.0f, 1);
}

- (void)updatePercent:(float)pct
{
    sg_Sprites_UpdateSpritePctWithSound(self->pointer, pct, 1);
}

- (void)updateWithSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpritePctWithSound(self->pointer, 1.0f, (withSound ? 1 : 0));
}

- (void)updatePercent:(float)pct  withSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpritePctWithSound(self->pointer, pct, (withSound ? 1 : 0));
}

- (void)updateAnimation
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(self->pointer, 1.0f, 1);
}

- (void)updateAnimationWithSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(self->pointer, 1.0f, (withSound ? 1 : 0));
}

- (void)updateAnimationPct:(float)pct
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(self->pointer, pct, 1);
}

- (void)updateAnimationPct:(float)pct  withSound:(BOOL)withSound
{
    sg_Sprites_UpdateSpriteAnimationPctWithSound(self->pointer, pct, (withSound ? 1 : 0));
}

- (float)value:(NSString *)name
{
    char name_temp[[name length] + 1];
    float result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteValueNamed(self->pointer, name_temp);
    return result;
}

- (float)valueAt:(int)index
{
    float result;
    result = sg_Sprites_SpriteValue(self->pointer, index);
    return result;
}

- (SGVector *)vectorToSprite:(SGSprite *)s2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_VectorFromTo(self->pointer, s2->pointer)];
    return result;
}

- (SGVector *)vectorToPoint:(SGPoint2D *)pt
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Sprites_VectorFromCenterSpriteToPoint(self->pointer, &pt->data)];
    return result;
}

- (int)visibleIndexOfLayerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    int result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Sprites_SpriteVisibleIndexOfLayerNamed(self->pointer, name_temp);
    return result;
}

- (int)visibleIndexOfLayer:(int)id
{
    int result;
    result = sg_Sprites_SpriteVisibleIndexOfLayer(self->pointer, id);
    return result;
}

- (int)visibleLayer:(int)idx
{
    int result;
    result = sg_Sprites_SpriteVisibleLayer(self->pointer, idx);
    return result;
}

- (void)free
{
    sg_Sprites_FreeSprite(&self->pointer);
}


@end
