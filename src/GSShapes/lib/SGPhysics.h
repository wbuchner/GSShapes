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


@interface SGPhysics : NSObject
{
  
}

+ (BOOL)bitmap:(SGBitmap *)bmp1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  atPt:(SGPoint2D *)pt2;
+ (BOOL)bitmap:(SGBitmap *)bmp1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2;
+ (BOOL)bitmap:(SGBitmap *)bmp1  at:(SGPoint2D *)pt1  part:(SGRectangle *)part1  collisionWith:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part2;
+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPt:(SGPoint2D *)pt;
+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPtX:(float)ptX  y:(float)ptY;
+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  collisionWithPt:(SGPoint2D *)pt;
+ (BOOL)bitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y  collisionWithPtX:(float)ptX  y:(float)ptY;
+ (BOOL)bitmap:(SGBitmap *)bmp  atPt:(SGPoint2D *)pt  part:(SGRectangle *)part  collisionWithRect:(SGRectangle *)rect;
+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  withRect:(SGRectangle *)rect;
+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  part:(SGRectangle *)part  withRect:(SGRectangle *)rect;
+ (BOOL)bitmap:(SGBitmap *)bmp  collisionAtX:(int)x  y:(int)y  withRectX:(int)rectX  y:(int)rectY  width:(int)rectWidth  height:(int)rectHeight;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2  part:(SGRectangle *)part;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  at:(SGPoint2D *)pt2;
+ (BOOL)bitmap:(SGBitmap *)bmp1  cell:(int)cell1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  atX:(int)x2  y:(int)y2;
+ (BOOL)bitmap:(SGBitmap *)bmp  cell:(int)cell  at:(SGPoint2D *)pt  collisionWithRect:(SGRectangle *)rect;
+ (BOOL)bitmap:(SGBitmap *)bmp  cell:(int)cell  atX:(int)x  y:(int)y  collisionWithRect:(SGRectangle *)rect;
+ (BOOL)circle:(SGCircle *)c1  collisionWithCircle:(SGCircle *)c2;
+ (BOOL)sprite:(SGSprite *)s  circleCollisionWithLine:(SGLineSegment *)line;
+ (BOOL)circle:(SGCircle *)c  collisionWithLine:(NSArray *)lines;
+ (BOOL)circle:(SGCircle *)c  collisionWithRect:(SGRectangle *)rect;
+ (BOOL)circle:(SGCircle *)c  collisionWithTriangle:(SGTriangle *)tri;
+ (void)sprite:(SGSprite *)s  circleCollideWithCircle:(SGCircle *)c;
+ (void)sprite:(SGSprite *)s  circleCollideWithLine:(SGLineSegment *)line;
+ (void)sprite:(SGSprite *)s  circleCollideWithLines:(NSArray *)lines;
+ (void)sprite:(SGSprite *)s  circleCollideWithRect:(SGRectangle *)rect;
+ (void)sprite:(SGSprite *)s1  circleCollide:(SGSprite *)s2;
+ (BOOL)sprite:(SGSprite *)s  rectCollisionWithLine:(SGLineSegment *)line;
+ (BOOL)rectangle:(SGRectangle *)rect  collisionWithLine:(SGLineSegment *)line;
+ (collision_side)sideForCollisionTest:(SGVector *)velocity;
+ (BOOL)sprite:(SGSprite *)s  collisionWithBitmap:(SGBitmap *)bmp  at:(SGPoint2D *)pt;
+ (BOOL)sprite:(SGSprite *)s  collisionWithBitmap:(SGBitmap *)bmp  x:(float)x  y:(float)y;
+ (BOOL)sprite:(SGSprite *)s1  collisionWithSprite:(SGSprite *)s2;
+ (BOOL)sprite:(SGSprite *)s  collisionWithRect:(SGRectangle *)r;
+ (BOOL)sprite:(SGSprite *)s  collisionWithRectX:(float)x  y:(float)y  width:(int)width  height:(int)height;
+ (BOOL)triangle:(SGTriangle *)tri  collisionWithLine:(SGLineSegment *)ln;








@end

