#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGGeometry.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGGeometry : NSObject


+ (SGVector *)vector:(SGVector *)v1  addVector:(SGVector *)v2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_AddVectors(&v1->data, &v2->data)];
    return result;
}

+ (void)matrix:(SGMatrix2D *)m  applyToPoints:(NSArray *)pts
{
    point2d pts_temp[[pts count]];
    [SGPoint2D getPoint2Ds:pts_temp fromArray:pts maxSize:[pts count]];
    sg_Geometry_ApplyMatrixToPoints(m->data, pts_temp, [pts count]);
    [SGPoint2D updatePoint2DsIn:pts fromDataIn:pts_temp size:[pts count]];
}

+ (void)matrix:(SGMatrix2D *)m  applyToTriangle:(SGTriangle *)tri
{
    sg_Geometry_ApplyMatrix(m->data, tri->data);
}

+ (float)vector:(SGVector *)v1  angleTo:(SGVector *)v2
{
    float result;
    result = sg_Geometry_CalculateAngleBetweenVectors(&v1->data, &v2->data);
    return result;
}

+ (float)sprite:(SGSprite *)s1  angleToSprite:(SGSprite *)s2
{
    float result;
    result = sg_Geometry_CalculateAngleBetweenSprites(s1->pointer, s2->pointer);
    return result;
}

+ (float)calculateAngleFromX1:(float)x1  y1:(float)y1  toX2:(float)x2  y:(float)y2
{
    float result;
    result = sg_Geometry_CalculateAngle(x1, y1, x2, y2);
    return result;
}

+ (float)point:(SGPoint2D *)pt1  angleTo:(SGPoint2D *)pt2
{
    float result;
    result = sg_Geometry_CalculateAngleBetween(&pt1->data, &pt2->data);
    return result;
}

+ (SGPoint2D *)circleCenterPoint:(SGCircle *)c
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_CircleCenterPoint(&c->data)];
    return result;
}

+ (SGCircle *)circleAtX:(float)x  y:(float)y  radius:(int)radius
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Geometry_CircleFromXY(x, y, radius)];
    return result;
}

+ (SGCircle *)circleAt:(SGPoint2D *)pt  radius:(int)radius
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Geometry_CircleAt(&pt->data, radius)];
    return result;
}

+ (int)circleRadius:(SGCircle *)c
{
    int result;
    result = sg_Geometry_CircleRadius(&c->data);
    return result;
}

+ (BOOL)circle:(SGCircle *)c  isWithin:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_CircleWithinRect(&c->data, &rect->data) != 0;
    return result;
}

+ (float)circleX:(SGCircle *)c
{
    float result;
    result = sg_Geometry_CircleX(&c->data);
    return result;
}

+ (float)circleY:(SGCircle *)c
{
    float result;
    result = sg_Geometry_CircleY(&c->data);
    return result;
}

+ (SGPoint2D *)closestPointFrom:(SGPoint2D *)fromPt  onCircle:(SGCircle *)c
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnCircle(&fromPt->data, &c->data)];
    return result;
}

+ (SGPoint2D *)pointFromX:(float)x  y:(float)y  closestToLine:(SGLineSegment *)line
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnLineXY(x, y, &line->data)];
    return result;
}

+ (SGPoint2D *)pointFrom:(SGPoint2D *)fromPt  closestToLine:(SGLineSegment *)line
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnLine(&fromPt->data, &line->data)];
    return result;
}

+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnLine:(SGLineSegment *)line
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnLineFromCircle(&c->data, &line->data)];
    return result;
}

+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    SGPoint2D * result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnLinesFromCircle(&c->data, lines_temp, [lines count])];
    return result;
}

+ (SGPoint2D *)circle:(SGCircle *)c  closestPointOnRect:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_ClosestPointOnRectFromCircle(&c->data, &rect->data)];
    return result;
}

+ (float)cosine:(float)angle
{
    float result;
    result = sg_Geometry_Cosine(angle);
    return result;
}

+ (SGPoint2D *)distantPointFrom:(SGPoint2D *)pt  onCircle:(SGCircle *)c
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_DistantPointOnCircle(&pt->data, &c->data)];
    return result;
}

+ (BOOL)distantPointFrom:(SGPoint2D *)pt  onCircle:(SGCircle *)c  heading:(SGVector *)heading  result:(SGPoint2D **)oppositePt
{
    point2d oppositePt_temp;
    BOOL result;
    result = sg_Geometry_DistantPointOnCircleHeading(&pt->data, &c->data, &heading->data, &oppositePt_temp) != 0;
    *oppositePt = [[[SGPoint2D alloc] initWithPoint2D:oppositePt_temp] autorelease];
    return result;
}

+ (float)vector:(SGVector *)v1  dotProduct:(SGVector *)v2
{
    float result;
    result = sg_Geometry_DotProduct(&v1->data, &v2->data);
    return result;
}

+ (void)fixRectangle:(SGRectangle *)rect
{
    sg_Geometry_FixRectangle(&rect->data);
}

+ (void)fixRectangleX:(float *)x  y:(float *)y  width:(int *)width  height:(int *)height
{
    sg_Geometry_FixRect(x, y, width, height);
}

+ (SGMatrix2D *)identityMatrix
{
    matrix2d result;
    sg_Geometry_IdentityMatrix(result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGRectangle *)insetRectangle:(SGRectangle *)rect  pixels:(int)insetAmount
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_InsetRectangle(&rect->data, insetAmount)];
    return result;
}

+ (SGRectangle *)rectangle:(SGRectangle *)rect1  intersectionWithRectangle:(SGRectangle *)rect2
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_Intersection(&rect1->data, &rect2->data)];
    return result;
}

+ (SGVector *)vectorInvert:(SGVector *)v
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_InvertVector(&v->data)];
    return result;
}

+ (SGVector *)vector:(SGVector *)v  limitMagnitude:(float)limit
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LimitVector(&v->data, limit)];
    return result;
}

+ (SGVector *)lineAsVector:(SGLineSegment *)line
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LineAsVector(&line->data)];
    return result;
}

+ (BOOL)circle:(SGCircle *)c  travelling:(SGVector *)velocity  hitLines:(NSArray *)lines  result:(SGLineSegment **)found
{
    line_segment lines_temp[[lines count]];
    line_segment found_temp;
    BOOL result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = sg_Geometry_LineCircleHit(&c->data, &velocity->data, lines_temp, &found_temp, [lines count]) != 0;
    *found = [[[SGLineSegment alloc] initWithLineSegment:found_temp] autorelease];
    return result;
}

+ (SGLineSegment *)lineFromX1:(float)x1  y1:(float)y1  toX2:(float)x2  y2:(float)y2
{
    SGLineSegment * result;
    result = [SGLineSegment lineSegmentForData:sg_Geometry_LineFrom(x1, y1, x2, y2)];
    return result;
}

+ (SGLineSegment *)lineFrom:(SGPoint2D *)pt1  to:(SGPoint2D *)pt2
{
    SGLineSegment * result;
    result = [SGLineSegment lineSegmentForData:sg_Geometry_LineFromPointToPoint(&pt1->data, &pt2->data)];
    return result;
}

+ (SGLineSegment *)lineFromVector:(SGVector *)mv
{
    SGLineSegment * result;
    result = [SGLineSegment lineSegmentForData:sg_Geometry_LineFromVector(&mv->data)];
    return result;
}

+ (SGLineSegment *)lineFrom:(SGPoint2D *)pt  toOffset:(SGVector *)mv
{
    SGLineSegment * result;
    result = [SGLineSegment lineSegmentForData:sg_Geometry_LineFromVectorWithStartPoint(&pt->data, &mv->data)];
    return result;
}

+ (SGLineSegment *)lineFromX:(float)x  y:(float)y  toOffset:(SGVector *)mv
{
    SGLineSegment * result;
    result = [SGLineSegment lineSegmentForData:sg_Geometry_LineFromVectorWithStartXY(x, y, &mv->data)];
    return result;
}

+ (BOOL)line:(SGLineSegment *)line1  intersectionWith:(SGLineSegment *)line2  result:(SGPoint2D **)pt
{
    point2d pt_temp;
    BOOL result;
    result = sg_Geometry_LineIntersectionPoint(&line1->data, &line2->data, &pt_temp) != 0;
    *pt = [[[SGPoint2D alloc] initWithPoint2D:pt_temp] autorelease];
    return result;
}

+ (BOOL)lineSegment:(SGLineSegment *)l  intersectsCircle:(SGCircle *)c
{
    BOOL result;
    result = sg_Geometry_LineIntersectsCircle(&l->data, &c->data) != 0;
    return result;
}

+ (BOOL)lineSegment:(SGLineSegment *)line  intersectsLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    BOOL result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = sg_Geometry_LineIntersectsLines(&line->data, lines_temp, [lines count]) != 0;
    return result;
}

+ (BOOL)lineSegment:(SGLineSegment *)line  intersectsRectangle:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_LineIntersectsRect(&line->data, &rect->data) != 0;
    return result;
}

+ (float)lineMagnitudeSq:(SGLineSegment *)line
{
    float result;
    result = sg_Geometry_LineMagnitudeSqFromLine(&line->data);
    return result;
}

+ (float)lineMagnitudeSqX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2
{
    float result;
    result = sg_Geometry_LineMagnitudeSq(x1, y1, x2, y2);
    return result;
}

+ (SGPoint2D *)lineMidPoint:(SGLineSegment *)line
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_LineMidPoint(&line->data)];
    return result;
}

+ (SGVector *)lineNormal:(SGLineSegment *)line
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_LineNormal(&line->data)];
    return result;
}

+ (BOOL)lineSegment:(SGLineSegment *)line1  intersectsLinesSegment:(SGLineSegment *)line2
{
    BOOL result;
    result = sg_Geometry_LineSegmentsIntersect(&line1->data, &line2->data) != 0;
    return result;
}

+ (NSString *)lineToString:(SGLineSegment *)ln
{
    char result[2048];
    sg_Geometry_LineToString(&ln->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSArray *)linesFromRect:(SGRectangle *)rect
{
    line_segment result[4];
    sg_Geometry_LinesFromRect(&rect->data, result, 4);
    return [SGLineSegment arrayOfLineSegments:result size:4];
}

+ (NSArray *)linesFromTriangle:(SGTriangle *)tri
{
    line_segment result[3];
    sg_Geometry_LinesFromTriangle(tri->data, result, 3);
    return [SGLineSegment arrayOfLineSegments:result size:3];
}

+ (BOOL)lines:(NSArray *)lines  intersectsRectangle:(SGRectangle *)r
{
    line_segment lines_temp[[lines count]];
    BOOL result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = sg_Geometry_LinesRectIntersect(lines_temp, &r->data, [lines count]) != 0;
    return result;
}

+ (SGVector *)matrix:(SGMatrix2D *)m  multiplyByVector:(SGVector *)v
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_MatrixMultiplyVector(m->data, &v->data)];
    return result;
}

+ (SGMatrix2D *)matrix:(SGMatrix2D *)m1  multiplyByMatrix:(SGMatrix2D *)m2
{
    matrix2d result;
    sg_Geometry_MatrixMultiply(m1->data, m2->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (NSString *)matrixToString:(SGMatrix2D *)m
{
    char result[2048];
    sg_Geometry_MatrixToString(m->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGPoint2D *)point:(SGPoint2D *)pt1  plusPoint:(SGPoint2D *)pt2
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_PointAdd(&pt1->data, &pt2->data)];
    return result;
}

+ (SGPoint2D *)pointAtX:(float)x  y:(float)y
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_PointAt(x, y)];
    return result;
}

+ (SGPoint2D *)point:(SGPoint2D *)startPoint  offset:(SGVector *)offset
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_PointAtStartWithOffset(&startPoint->data, &offset->data)];
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt  inCircle:(SGCircle *)c
{
    BOOL result;
    result = sg_Geometry_PointInCircle(&pt->data, &c->data) != 0;
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt  inRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_PointInRect(&pt->data, &rect->data) != 0;
    return result;
}

+ (BOOL)pointX:(float)x  ptY:(float)y  inRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_PointXYInRect(x, y, &rect->data) != 0;
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h
{
    BOOL result;
    result = sg_Geometry_PointInRectXY(&pt->data, x, y, w, h) != 0;
    return result;
}

+ (BOOL)pointX:(float)ptX  ptY:(float)ptY  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h
{
    BOOL result;
    result = sg_Geometry_PointXYInRectXY(ptX, ptY, x, y, w, h) != 0;
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt  inTriangle:(SGTriangle *)tri
{
    BOOL result;
    result = sg_Geometry_PointInTriangle(&pt->data, tri->data) != 0;
    return result;
}

+ (float)pointX:(float)x  y:(float)y  distanceTo:(SGLineSegment *)line
{
    float result;
    result = sg_Geometry_PointXYLineDistance(x, y, &line->data);
    return result;
}

+ (float)point:(SGPoint2D *)pt  distanceTo:(SGLineSegment *)line
{
    float result;
    result = sg_Geometry_PointLineDistance(&pt->data, &line->data);
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt  onLine:(SGLineSegment *)line
{
    BOOL result;
    result = sg_Geometry_PointOnLine(&pt->data, &line->data) != 0;
    return result;
}

+ (BOOL)point:(SGPoint2D *)pt1  atSamePointAs:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Geometry_PointOnPoint(&pt1->data, &pt2->data) != 0;
    return result;
}

+ (float)point:(SGPoint2D *)pt1  distanceToPoint:(SGPoint2D *)pt2
{
    float result;
    result = sg_Geometry_PointPointDistance(&pt1->data, &pt2->data);
    return result;
}

+ (NSString *)pointToString:(SGPoint2D *)pt
{
    char result[2048];
    sg_Geometry_PointToString(&pt->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSArray *)pointsFromRect:(SGRectangle *)rect
{
    point2d result[4];
    sg_Geometry_PointsFromRect(&rect->data, result, 4);
    return [SGPoint2D arrayOfPoint2Ds:result size:4];
}

+ (NSArray *)pointsFromLine:(SGLineSegment *)line
{
    point2d result[2];
    sg_Geometry_PointsFromLine(&line->data, result, 2);
    return [SGPoint2D arrayOfPoint2Ds:result size:2];
}

+ (float)distanceRayAt:(SGPoint2D *)ray_origin  heading:(SGVector *)ray_heading  hitCircle:(SGCircle *)c
{
    float result;
    result = sg_Geometry_RayCircleIntersectDistance(&ray_origin->data, &ray_heading->data, &c->data);
    return result;
}

+ (BOOL)rayFrom:(SGPoint2D *)fromPt  heading:(SGVector *)heading  intersectsLine:(SGLineSegment *)line  result:(SGPoint2D **)pt
{
    point2d pt_temp;
    BOOL result;
    result = sg_Geometry_RayIntersectionPoint(&fromPt->data, &heading->data, &line->data, &pt_temp) != 0;
    *pt = [[[SGPoint2D alloc] initWithPoint2D:pt_temp] autorelease];
    return result;
}

+ (SGRectangle *)rectangle:(SGRectangle *)rect  rectangleAfterMove:(SGVector *)mv
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleAfterMove(&rect->data, &mv->data)];
    return result;
}

+ (float)rectangleBottom:(SGRectangle *)rect
{
    float result;
    result = sg_Geometry_RectangleBottom(&rect->data);
    return result;
}

+ (SGPoint2D *)rectangleBottomLeft:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomLeft(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleBottomRight:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleBottomRight(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleCenter:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenter(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleCenterBottom:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterBottom(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleCenterLeft:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterLeft(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleCenterRight:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterRight(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleCenterTop:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleCenterTop(&rect->data)];
    return result;
}

+ (SGRectangle *)rectangleFromX:(float)x  y:(float)y  width:(int)w  height:(int)h
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleFrom(x, y, w, h)];
    return result;
}

+ (SGRectangle *)rectangleFromLines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    SGRectangle * result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleFromLines(lines_temp, [lines count])];
    return result;
}

+ (SGRectangle *)rectangleFromLine:(SGLineSegment *)line
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleFromLine(&line->data)];
    return result;
}

+ (SGRectangle *)rectangleFromTriangle:(SGTriangle *)tri
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleFromTriangle(tri->data)];
    return result;
}

+ (SGRectangle *)rectangleFromCircle:(SGCircle *)c
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleFromCircle(&c->data)];
    return result;
}

+ (SGRectangle *)rectangleFrom:(SGPoint2D *)pt1  to:(SGPoint2D *)pt2
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleForPoints(&pt1->data, &pt2->data)];
    return result;
}

+ (SGRectangle *)rectangleFrom:(SGPoint2D *)pt  width:(int)width  height:(int)height
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleAtPoint(&pt->data, width, height)];
    return result;
}

+ (float)rectangleLeft:(SGRectangle *)rect
{
    float result;
    result = sg_Geometry_RectangleLeft(&rect->data);
    return result;
}

+ (SGRectangle *)rectangleOffset:(SGRectangle *)rect  by:(SGVector *)vec
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Geometry_RectangleOffset(&rect->data, &vec->data)];
    return result;
}

+ (float)rectangleRight:(SGRectangle *)rect
{
    float result;
    result = sg_Geometry_RectangleRight(&rect->data);
    return result;
}

+ (NSString *)rectangleToString:(SGRectangle *)rect
{
    char result[2048];
    sg_Geometry_RectangleToString(&rect->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (float)rectangleTop:(SGRectangle *)rect
{
    float result;
    result = sg_Geometry_RectangleTop(&rect->data);
    return result;
}

+ (SGPoint2D *)rectangleTopLeft:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopLeft(&rect->data)];
    return result;
}

+ (SGPoint2D *)rectangleTopRight:(SGRectangle *)rect
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_RectangleTopRight(&rect->data)];
    return result;
}

+ (BOOL)rectangle:(SGRectangle *)rect1  intersectsRectangle:(SGRectangle *)rect2
{
    BOOL result;
    result = sg_Geometry_RectanglesIntersect(&rect1->data, &rect2->data) != 0;
    return result;
}

+ (SGMatrix2D *)rotationMatrix:(float)deg
{
    matrix2d result;
    sg_Geometry_RotationMatrix(deg, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)scaleMatrix:(float)scale
{
    matrix2d result;
    sg_Geometry_ScaleMatrix(scale, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)scaleMatricByPoint:(SGPoint2D *)scale
{
    matrix2d result;
    sg_Geometry_ScaleMatrixByPoint(&scale->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)matrixToScale:(SGPoint2D *)scale  rotate:(float)deg  translate:(SGPoint2D *)translate
{
    matrix2d result;
    sg_Geometry_ScaleRotateTranslateMatrix(&scale->data, deg, &translate->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (float)sine:(float)angle
{
    float result;
    result = sg_Geometry_Sine(angle);
    return result;
}

+ (SGVector *)vector:(SGVector *)v1  subtractVector:(SGVector *)v2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_SubtractVectors(&v1->data, &v2->data)];
    return result;
}

+ (float)tangent:(float)angle
{
    float result;
    result = sg_Geometry_Tangent(angle);
    return result;
}

+ (BOOL)tangentPointsFrom:(SGPoint2D *)fromPt  on:(SGCircle *)c  firstPt:(SGPoint2D **)p1  secondPt:(SGPoint2D **)p2
{
    point2d p1_temp;
    point2d p2_temp;
    BOOL result;
    result = sg_Geometry_TangentPoints(&fromPt->data, &c->data, &p1_temp, &p2_temp) != 0;
    *p2 = [[[SGPoint2D alloc] initWithPoint2D:p2_temp] autorelease];
    *p1 = [[[SGPoint2D alloc] initWithPoint2D:p1_temp] autorelease];
    return result;
}

+ (SGMatrix2D *)translationMatrixDx:(float)dx  dy:(float)dy
{
    matrix2d result;
    sg_Geometry_TranslationMatrix(dx, dy, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)translationMatrix:(SGPoint2D *)pt
{
    matrix2d result;
    sg_Geometry_TranslationMatrixPt(&pt->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGPoint2D *)triangleBarycenter:(SGTriangle *)tri
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Geometry_TriangleBarycenter(tri->data)];
    return result;
}

+ (SGTriangle *)triangleFromAx:(float)ax  ay:(float)ay  bx:(float)bx  by:(float)by  cx:(float)cx  cy:(float)cy
{
    triangle result;
    sg_Geometry_TriangleFrom(ax, ay, bx, by, cx, cy, result);
    return [SGTriangle triangleForData:result];
}

+ (SGTriangle *)trangleFromPtA:(SGPoint2D *)a  ptB:(SGPoint2D *)b  ptC:(SGPoint2D *)c
{
    triangle result;
    sg_Geometry_TriangleFromPoints(&a->data, &b->data, &c->data, result);
    return [SGTriangle triangleForData:result];
}

+ (BOOL)triangle:(SGTriangle *)tri  intersectsRectangle:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_TriangleRectangleIntersect(tri->data, &rect->data) != 0;
    return result;
}

+ (NSString *)triangleToString:(SGTriangle *)tri
{
    char result[2048];
    sg_Geometry_TriangleToString(tri->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (BOOL)triangles:(NSArray *)tri  intersectsRectangle:(SGRectangle *)rect
{
    triangle tri_temp[[tri count]];
    BOOL result;
    [SGTriangle getTriangles:tri_temp fromArray:tri maxSize:[tri count]];
    result = sg_Geometry_TrianglesRectangleIntersect(tri_temp, &rect->data, [tri count]) != 0;
    return result;
}

+ (SGVector *)vectorUnitVector:(SGVector *)v
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_UnitVector(&v->data)];
    return result;
}

+ (float)vectorAngle:(SGVector *)v
{
    float result;
    result = sg_Geometry_VectorAngle(&v->data);
    return result;
}

+ (SGVector *)vectorFromAngle:(float)angle  magnitude:(float)magnitude
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromAngle(angle, magnitude)];
    return result;
}

+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  to:(SGRectangle *)rect
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromPointPtToRectangle(&pt->data, &rect->data)];
    return result;
}

+ (SGVector *)vectorFromX:(float)x  y:(float)y  toRect:(SGRectangle *)rect
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromPointToRectangle(x, y, &rect->data)];
    return result;
}

+ (SGVector *)vectorFromX:(float)x  y:(float)y  toRectX:(float)rectX  y:(float)rectY  width:(int)rectWidth  height:(int)rectHeight
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromPointToRect(x, y, rectX, rectY, rectWidth, rectHeight)];
    return result;
}

+ (SGVector *)vectorFrom:(SGPoint2D *)p1  to:(SGPoint2D *)p2
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorFromPoints(&p1->data, &p2->data)];
    return result;
}

+ (BOOL)vector:(SGVector *)v  inRectangle:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Geometry_VectorInRect(&v->data, &rect->data) != 0;
    return result;
}

+ (BOOL)vector:(SGVector *)v  inRectX:(float)x  y:(float)y  width:(float)w  height:(float)h
{
    BOOL result;
    result = sg_Geometry_VectorInRectXY(&v->data, x, y, w, h) != 0;
    return result;
}

+ (BOOL)vectorIsZero:(SGVector *)v
{
    BOOL result;
    result = sg_Geometry_VectorIsZero(&v->data) != 0;
    return result;
}

+ (float)vectorMagnitude:(SGVector *)v
{
    float result;
    result = sg_Geometry_VectorMagnitude(&v->data);
    return result;
}

+ (float)vectorMagnitudeSq:(SGVector *)v
{
    float result;
    result = sg_Geometry_VectorMagnitudeSq(&v->data);
    return result;
}

+ (SGVector *)vector:(SGVector *)v  multipliedBy:(float)s
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorMultiply(&v->data, s)];
    return result;
}

+ (SGVector *)vectorNormal:(SGVector *)v
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorNormal(&v->data)];
    return result;
}

+ (SGVector *)vectorFromCircle:(SGCircle *)src  outOfCircle:(SGCircle *)bounds  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfCircleFromCircle(&src->data, &bounds->data, &velocity->data)];
    return result;
}

+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  outOfCircle:(SGCircle *)c  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfCircleFromPoint(&pt->data, &c->data, &velocity->data)];
    return result;
}

+ (SGVector *)vectorFromCircle:(SGCircle *)c  outOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromCircle(&c->data, &rect->data, &velocity->data)];
    return result;
}

+ (SGVector *)vectorFromPt:(SGPoint2D *)pt  outOfRect:(SGRectangle *)rect  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromPoint(&pt->data, &rect->data, &velocity->data)];
    return result;
}

+ (SGVector *)vectorFromRect:(SGRectangle *)src  outOfRect:(SGRectangle *)bounds  givenHeading:(SGVector *)velocity
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorOutOfRectFromRect(&src->data, &bounds->data, &velocity->data)];
    return result;
}

+ (SGVector *)vectorFromCircle:(SGCircle *)c  overLines:(NSArray *)lines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx
{
    line_segment lines_temp[[lines count]];
    SGVector * result;
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    result = [SGVector vectorForData:sg_Geometry_VectorOverLinesFromCircle(&c->data, lines_temp, &velocity->data, maxIdx, [lines count])];
    return result;
}

+ (SGVector *)vectorFromLines:(NSArray *)srcLines  overLones:(NSArray *)boundLines  givenHeading:(SGVector *)velocity  resultingMaxIdx:(int *)maxIdx
{
    line_segment srcLines_temp[[srcLines count]];
    line_segment boundLines_temp[[boundLines count]];
    SGVector * result;
    [SGLineSegment getLineSegments:srcLines_temp fromArray:srcLines maxSize:[srcLines count]];
    [SGLineSegment getLineSegments:boundLines_temp fromArray:boundLines maxSize:[boundLines count]];
    result = [SGVector vectorForData:sg_Geometry_VectorOverLinesFromLines(srcLines_temp, boundLines_temp, &velocity->data, maxIdx, [srcLines count], [boundLines count])];
    return result;
}

+ (SGVector *)vectorToX:(float)x  y:(float)y
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorTo(x, y, 0)];
    return result;
}

+ (SGVector *)vectorToX:(float)x  y:(float)y  invertY:(BOOL)invertY
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorTo(x, y, (invertY ? 1 : 0))];
    return result;
}

+ (SGVector *)vectorToPoint:(SGPoint2D *)p1
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_VectorToPoint(&p1->data)];
    return result;
}

+ (BOOL)vector:(SGVector *)v1  equals:(SGVector *)v2
{
    BOOL result;
    result = sg_Geometry_VectorsEqual(&v1->data, &v2->data) != 0;
    return result;
}

+ (BOOL)vector:(SGVector *)v1  doesNotEqual:(SGVector *)v2
{
    BOOL result;
    result = sg_Geometry_VectorsNotEqual(&v1->data, &v2->data) != 0;
    return result;
}

+ (void)widestPointsOn:(SGCircle *)c  along:(SGVector *)along  firstPt:(SGPoint2D **)pt1  secondPt:(SGPoint2D **)pt2
{
    point2d pt1_temp;
    point2d pt2_temp;
    sg_Geometry_WidestPoints(&c->data, &along->data, &pt1_temp, &pt2_temp);
    *pt2 = [[[SGPoint2D alloc] initWithPoint2D:pt2_temp] autorelease];
    *pt1 = [[[SGPoint2D alloc] initWithPoint2D:pt1_temp] autorelease];
}









@end
