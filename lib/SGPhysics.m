#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGPhysics.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGPhysics : NSObject


+ (BOOL)bitmap:(SGBitmap *)bmp1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  atPt:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_BitmapAtPointsCollision(bmp1->pointer, &pt1->data, bmp2->pointer, &pt2->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_BitmapCollision(bmp1->pointer, x1, y1, bmp2->pointer, x2, y2) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  at:(SGPoint2D *)pt1  part:(SGRectangle *)part1  collisionWith:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part2
{
    BOOL result;
    result = sg_Physics_BitmapsPartsCollision(bmp1->pointer, &pt1->data, &part1->data, bmp2->pointer, &pt2->data, &part2->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_BitmapPartPointXYCollision(bmp->pointer, x, y, &part->data, &pt->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPtX:(float)ptX  y:(float)ptY
{
    BOOL result;
    result = sg_Physics_BitmapPartPointCollision(bmp->pointer, x, y, &part->data, ptX, ptY) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  collisionWithPt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_BitmapPointPtCollision(bmp->pointer, x, y, &pt->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  collisionWithPtX:(float)ptX  y:(float)ptY
{
    BOOL result;
    result = sg_Physics_BitmapPointCollision(bmp->pointer, x, y, ptX, ptY) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  atPt:(SGPoint2D *)pt  part:(SGRectangle *)part  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapPartAtPtRectCollision(bmp->pointer, &pt->data, &part->data, &rect->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  withRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapRectangleCollision(bmp->pointer, x, y, &rect->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  part:(SGRectangle *)part  withRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapPartRectCollision(bmp->pointer, x, y, &part->data, &rect->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  withRectX:(int)rectX  y:(int)rectY  width:(int)rectWidth  height:(int)rectHeight
{
    BOOL result;
    result = sg_Physics_BitmapRectCollision(bmp->pointer, x, y, rectX, rectY, rectWidth, rectHeight) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_CellBitmapCollisionAtPt(bmp1->pointer, cell, &pt1->data, bmp2->pointer, &pt2->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part
{
    BOOL result;
    result = sg_Physics_CellBitmapPartCollisionAtPt(bmp1->pointer, cell, &pt1->data, bmp2->pointer, &pt2->data, &part->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_CellBitmapCollision(bmp1->pointer, cell, x1, y1, bmp2->pointer, x2, y2) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2  part:(SGRectangle *)part
{
    BOOL result;
    result = sg_Physics_CellBitmapPartCollision(bmp1->pointer, cell, x1, y1, bmp2->pointer, x2, y2, &part->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  at:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_CellCollisionAtPt(bmp1->pointer, cell1, &pt1->data, bmp2->pointer, cell2, &pt2->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_CellCollision(bmp1->pointer, cell1, x1, y1, bmp2->pointer, cell2, x2, y2) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  cell:(int)cell  at:(SGPoint2D *)pt  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_CellRectCollisionAtPt(bmp->pointer, cell, &pt->data, &rect->data) != 0;
    return result;
}

+ (BOOL)bitmap:(SGBitmap *)bmp  cell:(int)cell  atX:(int)x  y:(int)y  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_CellRectCollision(bmp->pointer, cell, x, y, &rect->data) != 0;
    return result;
}

+ (BOOL)circle:(SGCircle *)c1  collisionWithCircle:(SGCircle *)c2
{
    BOOL result;
    result = sg_Physics_CircleCircleCollision(&c1->data, &c2->data) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  circleCollisionWithLine:(SGLineSegment *)line
{
    BOOL result;
    result = sg_Physics_SpriteCircleLineCollision(s->pointer, &line->data) != 0;
    return result;
}

+ (BOOL)circle:(SGCircle *)c  collisionWithLine:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    BOOL result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = sg_Physics_CircleLinesCollision(&c->data, lines_temp, [lines count]) != 0;
    return result;
}

+ (BOOL)circle:(SGCircle *)c  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_CircleRectCollision(&c->data, &rect->data) != 0;
    return result;
}

+ (BOOL)circle:(SGCircle *)c  collisionWithTriangle:(SGTriangle *)tri
{
    BOOL result;
    result = sg_Physics_CircleTriangleCollision(&c->data, tri->data) != 0;
    return result;
}

+ (void)sprite:(SGSprite *)s  circleCollideWithCircle:(SGCircle *)c
{
    sg_Physics_CollideCircleCircle(s->pointer, &c->data);
}

+ (void)sprite:(SGSprite *)s  circleCollideWithLine:(SGLineSegment *)line
{
    sg_Physics_CollideCircleLine(s->pointer, &line->data);
}

+ (void)sprite:(SGSprite *)s  circleCollideWithLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    sg_Physics_CollideCircleLines(s->pointer, lines_temp, [lines count]);
}

+ (void)sprite:(SGSprite *)s  circleCollideWithRect:(SGRectangle *)rect
{
    sg_Physics_CollideCircleRectangle(s->pointer, &rect->data);
}

+ (void)sprite:(SGSprite *)s1  circleCollide:(SGSprite *)s2
{
    sg_Physics_CollideCircles(s1->pointer, s2->pointer);
}

+ (BOOL)sprite:(SGSprite *)s  rectCollisionWithLine:(SGLineSegment *)line
{
    BOOL result;
    result = sg_Physics_SpriteRectLineCollision(s->pointer, &line->data) != 0;
    return result;
}

+ (BOOL)rectangle:(SGRectangle *)rect  collisionWithLine:(SGLineSegment *)line
{
    BOOL result;
    result = sg_Physics_RectLineCollision(&rect->data, &line->data) != 0;
    return result;
}

+ (collision_side)sideForCollisionTest:(SGVector *)velocity
{
    collision_side result;
    result = (collision_side)sg_Physics_SideForCollisionTest(&velocity->data);
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  collisionWithBitmap:(SGBitmap *)bmp  at:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_SpriteBitmapAtPointCollision(s->pointer, bmp->pointer, &pt->data) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  collisionWithBitmap:(SGBitmap *)bmp  x:(float)x  y:(float)y
{
    BOOL result;
    result = sg_Physics_SpriteBitmapCollision(s->pointer, bmp->pointer, x, y) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s1  collisionWithSprite:(SGSprite *)s2
{
    BOOL result;
    result = sg_Physics_SpriteCollision(s1->pointer, s2->pointer) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  collisionWithRect:(SGRectangle *)r
{
    BOOL result;
    result = sg_Physics_SpriteRectangleCollision(s->pointer, &r->data) != 0;
    return result;
}

+ (BOOL)sprite:(SGSprite *)s  collisionWithRectX:(float)x  y:(float)y  width:(int)width  height:(int)height
{
    BOOL result;
    result = sg_Physics_SpriteRectCollision(s->pointer, x, y, width, height) != 0;
    return result;
}

+ (BOOL)triangle:(SGTriangle *)tri  collisionWithLine:(SGLineSegment *)ln
{
    BOOL result;
    result = sg_Physics_TriangleLineCollision(tri->data, &ln->data) != 0;
    return result;
}









@end
