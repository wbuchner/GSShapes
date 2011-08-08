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


@interface SGGeometry : NSObject
{
  
}

+ (SGVector *)vector:(SGVector *)v1  addVector:(SGVector *)v2;
+ (void)matrix:(SGMatrix2D *)m  applyToPoints:(NSArray *)pts;
+ (void)matrix:(SGMatrix2D *)m  applyToTriangle:(SGTriangle *)tri;
+ (float)vector:(SGVector *)v1  angleTo:(SGVector *)v2;
+ (float)sprite:(SGSprite *)s1  angleToSprite:(SGSprite *)s2;
+ (float)calculateAngleFromX1:(float)x1  y1:(float)y1  toX2:(float)x2  y:(float)y2;
+ (float)point:(SGPoint2D *)pt1  angleTo:(SGPoint2D *)pt2;
+ (SGPoint2D *)circleCenterPoint:(SGCircle *)c;
+ (SGCircle *)circleAtX:(float)x  y:(float)y  radius:(int)radius;
+ (SGCircle *)circleAt:(SGPoint2D *)pt  radius:(int)radius;
+ (int)circleRadius:(SGCircle *)c;
+ (BOOL)circle:(SGCircle *)c  isWithin:(SGRectangle *)rect;
+ (float)circleX:(SGCircle *)c;
+ (float)circleY:(SGCircle *)c;
+ (SGPoint2D *)closestPointFrom:(SGPoint2D *)fromPt  onCircle:(SGCircle *)c;
+ (SGPoint2D *)pointFromX:(float)x  y:(float)y  closestToLine:(SGLineSegment *)line;
+ (SGPoint2D *)pointFrom:(SGPoint2D *)fromPt  closestToLine:(SGLineSegment *)line;
+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnLine:(SGLineSegment *)line;
+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnLines:(NSArray *)lines;
+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnRect:(SGRectangle *)rect;
+ (float)cosine:(float)angle;
+ (SGPoint2D *)distantPointFrom:(SGPoint2D *)pt  onCircle:(SGCircle *)c;
+ (BOOL)distantPointFrom:(SGPoint2D *)pt  onCircle:(SGCircle *)c  heading:(SGVector *)heading  result:(SGPoint2D **)oppositePt;
+ (float)vector:(SGVector *)v1  dotProduct:(SGVector *)v2;
+ (void)fixRectangle:(SGRectangle *)rect;
+ (void)fixRectangleX:(float *)x  y:(float *)y  width:(int *)width  height:(int *)height;
+ (SGMatrix2D *)identityMatrix;
+ (SGRectangle *)insetRectangle:(SGRectangle *)rect  pixels:(int)insetAmount;
+ (SGRectangle *)rectangle:(SGRectangle *)rect1  intersectionWithRectangle:(SGRectangle *)rect2;
+ (SGVector *)vectorInvert:(SGVector *)v;
+ (SGVector *)vector:(SGVector *)v  limitMagnitude:(float)limit;
+ (SGVector *)lineAsVector:(SGLineSegment *)line;
+ (BOOL)circle:(SGCircle *)c  travelling:(SGVector *)velocity  hitLines:(NSArray *)lines  result:(SGLineSegment **)found;
+ (SGLineSegment *)lineFromX1:(float)x1  y1:(float)y1  toX2:(float)x2  y2:(float)y2;
+ (SGLineSegment *)lineFrom:(SGPoint2D *)pt1  to:(SGPoint2D *)pt2;
+ (SGLineSegment *)lineFromVector:(SGVector *)mv;
+ (SGLineSegment *)lineFrom:(SGPoint2D *)pt  toOffset:(SGVector *)mv;
+ (SGLineSegment *)lineFromX:(float)x  y:(float)y  toOffset:(SGVector *)mv;
+ (BOOL)line:(SGLineSegment *)line1  intersectionWith:(SGLineSegment *)line2  result:(SGPoint2D **)pt;
+ (BOOL)lineSegment:(SGLineSegment *)l  intersectsCircle:(SGCircle *)c;
+ (BOOL)lineSegment:(SGLineSegment *)line  intersectsLines:(NSArray *)lines;
+ (BOOL)lineSegment:(SGLineSegment *)line  intersectsRectangle:(SGRectangle *)rect;
+ (float)lineMagnitudeSq:(SGLineSegment *)line;
+ (float)lineMagnitudeSqX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2;
+ (SGPoint2D *)lineMidPoint:(SGLineSegment *)line;
+ (SGVector *)lineNormal:(SGLineSegment *)line;
+ (BOOL)lineSegment:(SGLineSegment *)line1  intersectsLinesSegment:(SGLineSegment *)line2;
+ (NSString *)lineToString:(SGLineSegment *)ln;
+ (NSArray *)linesFromRect:(SGRectangle *)rect;
+ (NSArray *)linesFromTriangle:(SGTriangle *)tri;
+ (BOOL)lines:(NSArray *)lines  intersectsRectangle:(SGRectangle *)r;
+ (SGVector *)matrix:(SGMatrix2D *)m  multiplyByVector:(SGVector *)v;
+ (SGMatrix2D *)matrix:(SGMatrix2D *)m1  multiplyByMatrix:(SGMatrix2D *)m2;
+ (NSString *)matrixToString:(SGMatrix2D *)m;
+ (SGPoint2D *)point:(SGPoint2D *)pt1  plusPoint:(SGPoint2D *)pt2;
+ (SGPoint2D *)pointAtX:(float)x  y:(float)y;
+ (SGPoint2D *)point:(SGPoint2D *)startPoint  offset:(SGVector *)offset;
+ (BOOL)point:(SGPoint2D *)pt  inCircle:(SGCircle *)c;
+ (BOOL)point:(SGPoint2D *)pt  inRect:(SGRectangle *)rect;
+ (BOOL)pointX:(float)x  ptY:(float)y  inRect:(SGRectangle *)rect;
+ (BOOL)point:(SGPoint2D *)pt  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h;
+ (BOOL)pointX:(float)ptX  ptY:(float)ptY  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h;
+ (BOOL)point:(SGPoint2D *)pt  inTriangle:(SGTriangle *)tri;
+ (float)pointX:(float)x  y:(float)y  distanceTo:(SGLineSegment *)line;
+ (float)point:(SGPoint2D *)pt  distanceTo:(SGLineSegment *)line;
+ (BOOL)point:(SGPoint2D *)pt  onLine:(SGLineSegment *)line;
+ (BOOL)point:(SGPoint2D *)pt1  atSamePointAs:(SGPoint2D *)pt2;
+ (float)point:(SGPoint2D *)pt1  distanceToPoint:(SGPoint2D *)pt2;
+ (NSString *)pointToString:(SGPoint2D *)pt;
+ (NSArray *)pointsFromRect:(SGRectangle *)rect;
+ (NSArray *)pointsFromLine:(SGLineSegment *)line;
+ (float)distanceRayAt:(SGPoint2D *)ray_origin  heading:(SGVector *)ray_heading  hitCircle:(SGCircle *)c;
+ (BOOL)rayFrom:(SGPoint2D *)fromPt  heading:(SGVector *)heading  intersectsLine:(SGLineSegment *)line  result:(SGPoint2D **)pt;
+ (SGRectangle *)rectangle:(SGRectangle *)rect  rectangleAfterMove:(SGVector *)mv;
+ (float)rectangleBottom:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleBottomLeft:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleBottomRight:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleCenter:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleCenterBottom:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleCenterLeft:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleCenterRight:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleCenterTop:(SGRectangle *)rect;
+ (SGRectangle *)rectangleFromX:(float)x  y:(float)y  width:(int)w  height:(int)h;
+ (SGRectangle *)rectangleFromLines:(NSArray *)lines;
+ (SGRectangle *)rectangleFromLine:(SGLineSegment *)line;
+ (SGRectangle *)rectangleFromTriangle:(SGTriangle *)tri;
+ (SGRectangle *)rectangleFromCircle:(SGCircle *)c;
+ (SGRectangle *)rectangleFrom:(SGPoint2D *)pt1  to:(SGPoint2D *)pt2;
+ (SGRectangle *)rectangleFrom:(SGPoint2D *)pt  width:(int)width  height:(int)height;
+ (float)rectangleLeft:(SGRectangle *)rect;
+ (SGRectangle *)rectangleOffset:(SGRectangle *)rect  by:(SGVector *)vec;
+ (float)rectangleRight:(SGRectangle *)rect;
+ (NSString *)rectangleToString:(SGRectangle *)rect;
+ (float)rectangleTop:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleTopLeft:(SGRectangle *)rect;
+ (SGPoint2D *)rectangleTopRight:(SGRectangle *)rect;
+ (BOOL)rectangle:(SGRectangle *)rect1  intersectsRectangle:(SGRectangle *)rect2;
+ (SGMatrix2D *)rotationMatrix:(float)deg;
+ (SGMatrix2D *)scaleMatrix:(float)scale;
+ (SGMatrix2D *)scaleMatricByPoint:(SGPoint2D *)scale;
+ (SGMatrix2D *)matrixToScale:(SGPoint2D *)scale  rotate:(float)deg  translate:(SGPoint2D *)translate;
+ (float)sine:(float)angle;
+ (SGVector *)vector:(SGVector *)v1  subtractVector:(SGVector *)v2;
+ (float)tangent:(float)angle;
+ (BOOL)tangentPointsFrom:(SGPoint2D *)fromPt  on:(SGCircle *)c  firstPt:(SGPoint2D **)p1  secondPt:(SGPoint2D **)p2;
+ (SGMatrix2D *)translationMatrixDx:(float)dx  dy:(float)dy;
+ (SGMatrix2D *)translationMatrix:(SGPoint2D *)pt;
+ (SGPoint2D *)triangleBarycenter:(SGTriangle *)tri;
+ (SGTriangle *)triangleFromAx:(float)ax  ay:(float)ay  bx:(float)bx  by:(float)by  cx:(float)cx  cy:(float)cy;
+ (SGTriangle *)trangleFromPtA:(SGPoint2D *)a  ptB:(SGPoint2D *)b  ptC:(SGPoint2D *)c;
+ (BOOL)triangle:(SGTriangle *)tri  intersectsRectangle:(SGRectangle *)rect;
+ (NSString *)triangleToString:(SGTriangle *)tri;
+ (BOOL)triangles:(NSArray *)tri  intersectsRectangle:(SGRectangle *)rect;
+ (SGVector *)vectorUnitVector:(SGVector *)v;
+ (float)vectorAngle:(SGVector *)v;
+ (SGVector *)vectorFromAngle:(float)angle  magnitude:(float)magnitude;
+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  to:(SGRectangle *)rect;
+ (SGVector *)vectorFromX:(float)x  y:(float)y  toRect:(SGRectangle *)rect;
+ (SGVector *)vectorFromX:(float)x  y:(float)y  toRectX:(float)rectX  y:(float)rectY  width:(int)rectWidth  height:(int)rectHeight;
+ (SGVector *)vectorFrom:(SGPoint2D *)p1  to:(SGPoint2D *)p2;
+ (BOOL)vector:(SGVector *)v  inRectangle:(SGRectangle *)rect;
+ (BOOL)vector:(SGVector *)v  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h;
+ (BOOL)vectorIsZero:(SGVector *)v;
+ (float)vectorMagnitude:(SGVector *)v;
+ (float)vectorMagnitudeSq:(SGVector *)v;
+ (SGVector *)vector:(SGVector *)v  multipliedBy:(float)s;
+ (SGVector *)vectorNormal:(SGVector *)v;
+ (SGVector *)vectorFromCircle:(SGCircle *)src  outOfCircle:(SGCircle *)bounds  givenHeading:(SGVector *)velocity;
+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  outOfCircle:(SGCircle *)c  givenHeading:(SGVector *)velocity;
+ (SGVector *)vectorFromCircle:(SGCircle *)c  outOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity;
+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  outOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity;
+ (SGVector *)vectorFromRect:(SGRectangle *)src  outOfRect:(SGRectangle *)bounds  givenHeading:(SGVector *)velocity;
+ (SGVector *)vectorFromCircle:(SGCircle *)c  overLines:(NSArray *)lines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx;
+ (SGVector *)vectorFromLines:(NSArray *)srcLines  overLones:(NSArray *)boundLines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx;
+ (SGVector *)vectorToX:(float)x  y:(float)y;
+ (SGVector *)vectorToX:(float)x  y:(float)y  invertY:(BOOL)invertY;
+ (SGVector *)vectorToPoint:(SGPoint2D *)p1;
+ (BOOL)vector:(SGVector *)v1  equals:(SGVector *)v2;
+ (BOOL)vector:(SGVector *)v1  doesNotEqual:(SGVector *)v2;
+ (void)widestPointsOn:(SGCircle *)c  along:(SGVector *)along  firstPt:(SGPoint2D **)pt1  secondPt:(SGPoint2D **)pt2;








@end

