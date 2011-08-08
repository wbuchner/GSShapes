#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGGraphics.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGGraphics : NSObject


+ (int)screenHeight
{
    int result;
    result = sg_Graphics_ScreenHeight();
    return result;
}

+ (int)screenWidth
{
    int result;
    result = sg_Graphics_ScreenWidth();
    return result;
}

+ (unsigned char)blueOf:(color)c
{
    unsigned char result;
    result = sg_Graphics_BlueOf(c);
    return result;
}

+ (float)brightnessOf:(color)c
{
    float result;
    result = sg_Graphics_BrightnessOf(c);
    return result;
}

+ (void)changeScreenSizeToWidth:(int)width  height:(int)height
{
    sg_Graphics_ChangeScreenSize(width, height);
}

+ (void)clearScreen
{
    sg_Graphics_ClearScreen();
}

+ (void)clearScreen:(color)toColor
{
    sg_Graphics_ClearScreenTo(toColor);
}

+ (void)colorComponentsOf:(color)c  red:(unsigned char *)r  green:(unsigned char *)g  blue:(unsigned char *)b  alpha:(unsigned char *)a
{
    sg_Graphics_ColorComponents(c, r, g, b, a);
}

+ (color)colorFrom:(SGBitmap *)bmp  apiColor:(color)apiColor
{
    color result;
    result = sg_Graphics_ColorFromBitmap(bmp->pointer, apiColor);
    return result;
}

+ (NSString *)colorToString:(color)c
{
    char result[2048];
    sg_Graphics_ColorToString(c, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGRectangle *)currentScreenClip
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Graphics_CurrentScreenClip()];
    return result;
}

+ (SGRectangle *)currentClip:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Graphics_CurrentBmpClip(bmp->pointer)];
    return result;
}

+ (void)draw:(color)clr  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircle(clr, 0, &c->data);
}

+ (void)draw:(color)clr  circle:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPoint(clr, 0, &position->data, radius);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnto(dest->pointer, clr, 0, &c->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircle(clr, (filled ? 1 : 0), &c->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnto(dest->pointer, clr, (filled ? 1 : 0), &c->data);
}

+ (void)draw:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircle(clr, 0, xc, yc, radius);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circle:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPoint(clr, (filled ? 1 : 0), &position->data, radius);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGPoint2D *)point  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPointOnto(dest->pointer, clr, 0, &point->data, radius);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnto(dest->pointer, clr, 0, xc, yc, radius);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circle:(SGPoint2D *)point  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPointOnto(dest->pointer, clr, (filled ? 1 : 0), &point->data, radius);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircle(clr, (filled ? 1 : 0), xc, yc, radius);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnto(dest->pointer, clr, (filled ? 1 : 0), xc, yc, radius);
}

+ (void)draw:(color)clr  circleOnScreen:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnScreen(clr, 0, &c->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreen:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnScreen(clr, (filled ? 1 : 0), &c->data);
}

+ (void)draw:(color)clr  circleOnScreen:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillCircleAtPointOnScreen(clr, 0, &position->data, radius);
}

+ (void)draw:(color)clr  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnScreen(clr, 0, xc, yc, radius);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreen:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillCircleAtPointOnScreen(clr, (filled ? 1 : 0), &position->data, radius);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnScreen(clr, (filled ? 1 : 0), xc, yc, radius);
}

+ (void)draw:(color)clr  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRect(clr, 0, &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRect(clr, (filled ? 1 : 0), &source->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnto(dest->pointer, clr, 0, &source->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnto(dest->pointer, clr, (filled ? 1 : 0), &source->data);
}

+ (void)draw:(color)clr  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipse(clr, 0, xPos, yPos, width, height);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnto(dest->pointer, clr, 0, xPos, yPos, width, height);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipse(clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnto(dest->pointer, clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)draw:(color)clr  ellipseOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnScreen(clr, 0, &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  ellipseOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnScreen(clr, (filled ? 1 : 0), &source->data);
}

+ (void)draw:(color)clr  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnScreen(clr, 0, xPos, yPos, width, height);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnScreen(clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)draw:(color)clr  horizontalLineY:(float)y  x1:(float)x1  x2:(float)x2
{
    sg_Graphics_DrawHorizontalLine(clr, y, x1, x2);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  horizontalLineY:(int)y  x1:(int)x1  x2:(int)x2
{
    sg_Graphics_DrawHorizontalLineOnto(dest->pointer, clr, y, x1, x2);
}

+ (void)draw:(color)clr  horizontalLineOnScreenY:(int)y  x1:(int)x1  x2:(int)x2
{
    sg_Graphics_DrawHorizontalLineOnScreen(clr, y, x1, x2);
}

+ (void)draw:(color)clr  line:(SGLineSegment *)line
{
    sg_Graphics_DrawLineSegment(clr, &line->data);
}

+ (void)draw:(color)clr  lineFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt
{
    sg_Graphics_DrawLinePts(clr, &startPt->data, &endPt->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  line:(SGLineSegment *)line
{
    sg_Graphics_DrawLineSegmentOnto(dest->pointer, clr, &line->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  lineFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt
{
    sg_Graphics_DrawLinePtsOnto(dest->pointer, clr, &startPt->data, &endPt->data);
}

+ (void)draw:(color)clr  lineX1:(float)xPosStart  y1:(float)yPosStart  x2:(float)xPosEnd  y2:(float)yPosEnd
{
    sg_Graphics_DrawLine(clr, xPosStart, yPosStart, xPosEnd, yPosEnd);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  lineX1:(int)xPosStart  y1:(int)yPosStart  x2:(int)xPosEnd  y2:(int)yPosEnd
{
    sg_Graphics_DrawLineOnto(dest->pointer, clr, xPosStart, yPosStart, xPosEnd, yPosEnd);
}

+ (void)draw:(color)clr  lineOnScreen:(SGLineSegment *)line
{
    sg_Graphics_DrawLineSegmentOnScreen(clr, &line->data);
}

+ (void)draw:(color)clr  lineOnScreenFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt
{
    sg_Graphics_DrawLinePtsOnScreen(clr, &startPt->data, &endPt->data);
}

+ (void)draw:(color)clr  onScreenX1:(int)xPosStart  y1:(int)yPosStart  x2:(int)xPosEnd  y2:(int)yPosEnd
{
    sg_Graphics_DrawLineOnScreen(clr, xPosStart, yPosStart, xPosEnd, yPosEnd);
}

+ (void)draw:(color)clr  lines:(NSArray *)lines
{
    line_segment lines_temp[[lines count]];
    [SGLineSegment getLineSegments:lines_temp fromArray:lines maxSize:[lines count]];
    sg_Graphics_DrawLineSegments(clr, lines_temp, [lines count]);
}

+ (void)draw:(color)clr  pixelAt:(SGPoint2D *)position
{
    sg_Graphics_DrawPixelAtPoint(clr, &position->data);
}

+ (void)draw:(color)clr  pixelX:(float)x  y:(float)y
{
    sg_Graphics_DrawPixel(clr, x, y);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  pixel:(SGPoint2D *)position
{
    sg_Graphics_DrawPixelAtPointOnto(dest->pointer, clr, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  pixelX:(int)x  y:(int)y
{
    sg_Graphics_DrawPixelOnto(dest->pointer, clr, x, y);
}

+ (void)draw:(color)clr  pixelOnScreenAt:(SGPoint2D *)position
{
    sg_Graphics_DrawPixelAtPointOnScreen(clr, &position->data);
}

+ (void)draw:(color)clr  pixelOnScreenX:(int)x  y:(int)y
{
    sg_Graphics_DrawPixelOnScreen(clr, x, y);
}

+ (void)draw:(color)clr  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangle(clr, 0, xPos, yPos, width, height);
}

+ (void)draw:(color)clr  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRect(clr, 0, &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRect(clr, (filled ? 1 : 0), &source->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnto(dest->pointer, clr, 0, &source->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnto(dest->pointer, clr, (filled ? 1 : 0), &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangle(clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnto(dest->pointer, clr, 0, xPos, yPos, width, height);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnto(dest->pointer, clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)draw:(color)clr  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnScreen(clr, 0, xPos, yPos, width, height);
}

+ (void)draw:(color)clr  rectangleOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnScreen(clr, 0, &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnScreen(clr, (filled ? 1 : 0), &source->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnScreen(clr, (filled ? 1 : 0), xPos, yPos, width, height);
}

+ (void)draw:(color)clr  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangle(clr, 0, tri->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnto(dest->pointer, clr, 0, tri->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangle(clr, (filled ? 1 : 0), tri->data);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnto(dest->pointer, clr, (filled ? 1 : 0), tri->data);
}

+ (void)draw:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_DrawTriangleFromPoints(clr, x1, y1, x2, y2, x3, y3);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_DrawTriangleFromPointsOnto(dest->pointer, clr, x1, y1, x2, y2, x3, y3);
}

+ (void)draw:(color)clr  triangleOnScreen:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnScreen(clr, 0, tri->data);
}

+ (void)draw:(color)clr  filled:(BOOL)filled  triangleOnScreen:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnScreen(clr, (filled ? 1 : 0), tri->data);
}

+ (void)draw:(color)clr  triangleOnScreenX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_DrawTriangleFromPointsOnScreen(clr, x1, y1, x2, y2, x3, y3);
}

+ (void)draw:(color)clr  verticalLineX:(float)x  y1:(float)y1  y2:(float)y2
{
    sg_Graphics_DrawVerticalLine(clr, x, y1, y2);
}

+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  verticalLineX:(int)x  y1:(int)y1  y2:(int)y2
{
    sg_Graphics_DrawVerticalLineOnto(dest->pointer, clr, x, y1, y2);
}

+ (void)draw:(color)clr  verticalLineOnScreenX:(int)x  y1:(int)y1  y2:(int)y2
{
    sg_Graphics_DrawVerticalLineOnScreen(clr, x, y1, y2);
}

+ (void)fill:(color)clr  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircle(clr, 1, &c->data);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnto(dest->pointer, clr, 1, &c->data);
}

+ (void)fill:(color)clr  circle:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPoint(clr, 1, &position->data, radius);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGPoint2D *)point  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleAtPointOnto(dest->pointer, clr, 1, &point->data, radius);
}

+ (void)fill:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircle(clr, 1, xc, yc, radius);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnto(dest->pointer, clr, 1, xc, yc, radius);
}

+ (void)fill:(color)clr  circleOnScreen:(SGCircle *)c
{
    sg_Graphics_DrawOrFillCircleOnScreen(clr, 1, &c->data);
}

+ (void)fill:(color)clr  circleOnScreen:(SGPoint2D *)position  radius:(int)radius
{
    sg_Graphics_DrawOrFillCircleAtPointOnScreen(clr, 1, &position->data, radius);
}

+ (void)fill:(color)clr  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius
{
    sg_Graphics_DrawOrFillPtCircleOnScreen(clr, 1, xc, yc, radius);
}

+ (void)fill:(color)clr  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRect(clr, 1, &source->data);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  ellipse:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnto(dest->pointer, clr, 1, &source->data);
}

+ (void)fill:(color)clr  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipse(clr, 1, xPos, yPos, width, height);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnto(dest->pointer, clr, 1, xPos, yPos, width, height);
}

+ (void)fill:(color)clr  ellipseOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillEllipseInRectOnScreen(clr, 1, &source->data);
}

+ (void)fill:(color)clr  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillEllipseOnScreen(clr, 1, xPos, yPos, width, height);
}

+ (void)fill:(color)clr  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangle(clr, 1, xPos, yPos, width, height);
}

+ (void)fill:(color)clr  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRect(clr, 1, &source->data);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  rectangle:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnto(dest->pointer, clr, 1, &source->data);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnto(dest->pointer, clr, 1, xPos, yPos, width, height);
}

+ (void)fill:(color)clr  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height
{
    sg_Graphics_DrawOrFillRectangleOnScreen(clr, 1, xPos, yPos, width, height);
}

+ (void)fill:(color)clr  rectangleOnScreen:(SGRectangle *)source
{
    sg_Graphics_DrawOrFillRectangleRectOnScreen(clr, 1, &source->data);
}

+ (void)fill:(color)clr  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangle(clr, 1, tri->data);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  triangle:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnto(dest->pointer, clr, 1, tri->data);
}

+ (void)fill:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_FillTriangleFromPoints(clr, x1, y1, x2, y2, x3, y3);
}

+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_FillTriangleFromPointsOnto(dest->pointer, clr, x1, y1, x2, y2, x3, y3);
}

+ (void)fill:(color)clr  triangleOnScreen:(SGTriangle *)tri
{
    sg_Graphics_DrawOrFillTriangleOnScreen(clr, 1, tri->data);
}

+ (void)fill:(color)clr  triangleOnScreenX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3
{
    sg_Graphics_FillTriangleFromPointsOnScreen(clr, x1, y1, x2, y2, x3, y3);
}

+ (color)bitmap:(SGBitmap *)bmp  colorAtX:(int)x  y:(int)y
{
    color result;
    result = sg_Graphics_GetPixel(bmp->pointer, x, y);
    return result;
}

+ (color)colorOnScreenAtX:(int)x  y:(int)y
{
    color result;
    result = sg_Graphics_GetPixelFromScreen(x, y);
    return result;
}

+ (unsigned char)greenOf:(color)c
{
    unsigned char result;
    result = sg_Graphics_GreenOf(c);
    return result;
}

+ (color)hsbColorHue:(float)hue  sat:(float)saturation  bri:(float)brightness
{
    color result;
    result = sg_Graphics_HSBColor(hue, saturation, brightness);
    return result;
}

+ (void)hsbValueOf:(color)c  hue:(float *)h  sat:(float *)s  bri:(float *)b
{
    sg_Graphics_HSBValuesOf(c, h, s, b);
}

+ (float)hueOf:(color)c
{
    float result;
    result = sg_Graphics_HueOf(c);
    return result;
}

+ (void)openGraphicsWindow:(NSString *)caption
{
    char caption_temp[[caption length] + 1];
    [caption getCString:caption_temp maxLength:[caption length] + 1 encoding:NSASCIIStringEncoding];
    sg_Graphics_OpenGraphicsWindow(caption_temp, 800, 600);
}

+ (void)openGraphicsWindow:(NSString *)caption  width:(int)width  height:(int)height
{
    char caption_temp[[caption length] + 1];
    [caption getCString:caption_temp maxLength:[caption length] + 1 encoding:NSASCIIStringEncoding];
    sg_Graphics_OpenGraphicsWindow(caption_temp, width, height);
}

+ (void)popClipScreen
{
    sg_Graphics_PopClipScreen();
}

+ (void)PopClipBitmap:(SGBitmap *)bmp
{
    sg_Graphics_PopClipBmp(bmp->pointer);
}

+ (void)pushClip:(SGRectangle *)r
{
    sg_Graphics_PushClipRect(&r->data);
}

+ (void)bitmap:(SGBitmap *)bmp  PushClipRect:(SGRectangle *)r
{
    sg_Graphics_PushClipRectForBitmap(bmp->pointer, &r->data);
}

+ (void)pushClipX:(int)x  y:(int)y  width:(int)w  height:(int)h
{
    sg_Graphics_PushClipXY(x, y, w, h);
}

+ (void)bitmap:(SGBitmap *)bmp  putPixelX:(color)value  y:(int)x  color:(int)y
{
    sg_Graphics_PutPixel(bmp->pointer, value, x, y);
}

+ (color)rgbaColorRed:(unsigned char)red  green:(unsigned char)green  blue:(unsigned char)blue  alpha:(unsigned char)alpha
{
    color result;
    result = sg_Graphics_RGBAColor(red, green, blue, alpha);
    return result;
}

+ (color)rgbaFloatColorRed:(float)r  green:(float)g  blue:(float)b  alpha:(float)a
{
    color result;
    result = sg_Graphics_RGBAFloatColor(r, g, b, a);
    return result;
}

+ (color)rgbColorRed:(unsigned char)red  green:(unsigned char)green  blue:(unsigned char)blue
{
    color result;
    result = sg_Graphics_RGBAColor(red, green, blue, 255);
    return result;
}

+ (color)rgbFloatColorRed:(float)r  green:(float)g  blue:(float)b
{
    color result;
    result = sg_Graphics_RGBFloatColor(r, g, b);
    return result;
}

+ (color)randomColor
{
    color result;
    result = sg_Graphics_RandomColor();
    return result;
}

+ (color)randomRGBColor:(unsigned char)alpha
{
    color result;
    result = sg_Graphics_RandomRGBColor(alpha);
    return result;
}

+ (unsigned char)redOf:(color)c
{
    unsigned char result;
    result = sg_Graphics_RedOf(c);
    return result;
}

+ (void)refreshScreen
{
    sg_Graphics_RefreshScreen();
}

+ (void)refreshScreenRestrictFPS:(uint)TargetFPS
{
    sg_Graphics_RefreshScreenRestrictFPS(TargetFPS);
}

+ (void)resetClip
{
    sg_Graphics_ResetClip();
}

+ (void)resetClipForBitmap:(SGBitmap *)bmp
{
    sg_Graphics_ResetClipForBitmap(bmp->pointer);
}

+ (float)saturationOf:(color)c
{
    float result;
    result = sg_Graphics_SaturationOf(c);
    return result;
}

+ (void)setClip:(SGRectangle *)r
{
    sg_Graphics_SetClip(&r->data);
}

+ (void)bitmap:(SGBitmap *)bmp  setClip:(SGRectangle *)r
{
    sg_Graphics_SetBmpClip(bmp->pointer, &r->data);
}

+ (void)setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h
{
    sg_Graphics_SetClipXY(x, y, w, h);
}

+ (void)bitmap:(SGBitmap *)bmp  setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h
{
    sg_Graphics_SetBmpClipXY(bmp->pointer, x, y, w, h);
}

+ (void)setIcon:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Graphics_SetIcon(filename_temp);
}

+ (void)takeScreenshot:(NSString *)basename
{
    char basename_temp[[basename length] + 1];
    [basename getCString:basename_temp maxLength:[basename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Graphics_TakeScreenshot(basename_temp);
}

+ (void)toggleFullScreen
{
    sg_Graphics_ToggleFullScreen();
}

+ (void)toggleWindowBorder
{
    sg_Graphics_ToggleWindowBorder();
}

+ (unsigned char)transparencyOf:(color)c
{
    unsigned char result;
    result = sg_Graphics_TransparencyOf(c);
    return result;
}









@end
