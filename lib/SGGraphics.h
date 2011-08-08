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


@interface SGGraphics : NSObject
{
  
}

+ (int)screenHeight;
+ (int)screenWidth;
+ (unsigned char)blueOf:(color)c;
+ (float)brightnessOf:(color)c;
+ (void)changeScreenSizeToWidth:(int)width  height:(int)height;
+ (void)clearScreen;
+ (void)clearScreen:(color)toColor;
+ (void)colorComponentsOf:(color)c  red:(unsigned char *)r  green:(unsigned char *)g  blue:(unsigned char *)b  alpha:(unsigned char *)a;
+ (color)colorFrom:(SGBitmap *)bmp  apiColor:(color)apiColor;
+ (NSString *)colorToString:(color)c;
+ (SGRectangle *)currentScreenClip;
+ (SGRectangle *)currentClip:(SGBitmap *)bmp;
+ (void)draw:(color)clr  circle:(SGCircle *)c;
+ (void)draw:(color)clr  circle:(SGPoint2D *)position  radius:(int)radius;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGCircle *)c;
+ (void)draw:(color)clr  filled:(BOOL)filled  circle:(SGCircle *)c;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circle:(SGCircle *)c;
+ (void)draw:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)draw:(color)clr  filled:(BOOL)filled  circle:(SGPoint2D *)position  radius:(int)radius;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGPoint2D *)point  radius:(int)radius;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circle:(SGPoint2D *)point  radius:(int)radius;
+ (void)draw:(color)clr  filled:(BOOL)filled  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)draw:(color)clr  circleOnScreen:(SGCircle *)c;
+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreen:(SGCircle *)c;
+ (void)draw:(color)clr  circleOnScreen:(SGPoint2D *)position  radius:(int)radius;
+ (void)draw:(color)clr  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreen:(SGPoint2D *)position  radius:(int)radius;
+ (void)draw:(color)clr  filled:(BOOL)filled  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)draw:(color)clr  ellipse:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  ellipse:(SGRectangle *)source;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  ellipse:(SGRectangle *)source;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  ellipse:(SGRectangle *)source;
+ (void)draw:(color)clr  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  filled:(BOOL)filled  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  ellipseOnScreen:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  ellipseOnScreen:(SGRectangle *)source;
+ (void)draw:(color)clr  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  filled:(BOOL)filled  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  horizontalLineY:(float)y  x1:(float)x1  x2:(float)x2;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  horizontalLineY:(int)y  x1:(int)x1  x2:(int)x2;
+ (void)draw:(color)clr  horizontalLineOnScreenY:(int)y  x1:(int)x1  x2:(int)x2;
+ (void)draw:(color)clr  line:(SGLineSegment *)line;
+ (void)draw:(color)clr  lineFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  line:(SGLineSegment *)line;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  lineFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt;
+ (void)draw:(color)clr  lineX1:(float)xPosStart  y1:(float)yPosStart  x2:(float)xPosEnd  y2:(float)yPosEnd;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  lineX1:(int)xPosStart  y1:(int)yPosStart  x2:(int)xPosEnd  y2:(int)yPosEnd;
+ (void)draw:(color)clr  lineOnScreen:(SGLineSegment *)line;
+ (void)draw:(color)clr  lineOnScreenFromPt:(SGPoint2D *)startPt  toPt:(SGPoint2D *)endPt;
+ (void)draw:(color)clr  onScreenX1:(int)xPosStart  y1:(int)yPosStart  x2:(int)xPosEnd  y2:(int)yPosEnd;
+ (void)draw:(color)clr  lines:(NSArray *)lines;
+ (void)draw:(color)clr  pixelAt:(SGPoint2D *)position;
+ (void)draw:(color)clr  pixelX:(float)x  y:(float)y;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  pixel:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  pixelX:(int)x  y:(int)y;
+ (void)draw:(color)clr  pixelOnScreenAt:(SGPoint2D *)position;
+ (void)draw:(color)clr  pixelOnScreenX:(int)x  y:(int)y;
+ (void)draw:(color)clr  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  rectangle:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  rectangle:(SGRectangle *)source;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  rectangle:(SGRectangle *)source;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  rectangle:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  rectangleOnScreen:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleOnScreen:(SGRectangle *)source;
+ (void)draw:(color)clr  filled:(BOOL)filled  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)draw:(color)clr  triangle:(SGTriangle *)tri;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  triangle:(SGTriangle *)tri;
+ (void)draw:(color)clr  filled:(BOOL)filled  triangle:(SGTriangle *)tri;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  filled:(BOOL)filled  triangle:(SGTriangle *)tri;
+ (void)draw:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (void)draw:(color)clr  triangleOnScreen:(SGTriangle *)tri;
+ (void)draw:(color)clr  filled:(BOOL)filled  triangleOnScreen:(SGTriangle *)tri;
+ (void)draw:(color)clr  triangleOnScreenX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (void)draw:(color)clr  verticalLineX:(float)x  y1:(float)y1  y2:(float)y2;
+ (void)drawOnto:(SGBitmap *)dest  color:(color)clr  verticalLineX:(int)x  y1:(int)y1  y2:(int)y2;
+ (void)draw:(color)clr  verticalLineOnScreenX:(int)x  y1:(int)y1  y2:(int)y2;
+ (void)fill:(color)clr  circle:(SGCircle *)c;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGCircle *)c;
+ (void)fill:(color)clr  circle:(SGPoint2D *)position  radius:(int)radius;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circle:(SGPoint2D *)point  radius:(int)radius;
+ (void)fill:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  circleX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)fill:(color)clr  circleOnScreen:(SGCircle *)c;
+ (void)fill:(color)clr  circleOnScreen:(SGPoint2D *)position  radius:(int)radius;
+ (void)fill:(color)clr  circleOnScreenX:(float)xc  y:(float)yc  radius:(int)radius;
+ (void)fill:(color)clr  ellipse:(SGRectangle *)source;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  ellipse:(SGRectangle *)source;
+ (void)fill:(color)clr  x:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  ellipseX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)fill:(color)clr  ellipseOnScreen:(SGRectangle *)source;
+ (void)fill:(color)clr  ellipseOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)fill:(color)clr  rectangleX:(float)xPos  y:(float)yPos  width:(int)width  height:(int)height;
+ (void)fill:(color)clr  rectangle:(SGRectangle *)source;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  rectangle:(SGRectangle *)source;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  rectangleX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)fill:(color)clr  rectangleOnScreenX:(int)xPos  y:(int)yPos  width:(int)width  height:(int)height;
+ (void)fill:(color)clr  rectangleOnScreen:(SGRectangle *)source;
+ (void)fill:(color)clr  triangle:(SGTriangle *)tri;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  triangle:(SGTriangle *)tri;
+ (void)fill:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (void)fillOnto:(SGBitmap *)dest  color:(color)clr  triangleX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (void)fill:(color)clr  triangleOnScreen:(SGTriangle *)tri;
+ (void)fill:(color)clr  triangleOnScreenX1:(float)x1  y1:(float)y1  x2:(float)x2  y2:(float)y2  x3:(float)x3  y3:(float)y3;
+ (color)bitmap:(SGBitmap *)bmp  colorAtX:(int)x  y:(int)y;
+ (color)colorOnScreenAtX:(int)x  y:(int)y;
+ (unsigned char)greenOf:(color)c;
+ (color)hsbColorHue:(float)hue  sat:(float)saturation  bri:(float)brightness;
+ (void)hsbValueOf:(color)c  hue:(float *)h  sat:(float *)s  bri:(float *)b;
+ (float)hueOf:(color)c;
+ (void)openGraphicsWindow:(NSString *)caption;
+ (void)openGraphicsWindow:(NSString *)caption  width:(int)width  height:(int)height;
+ (void)popClipScreen;
+ (void)PopClipBitmap:(SGBitmap *)bmp;
+ (void)pushClip:(SGRectangle *)r;
+ (void)bitmap:(SGBitmap *)bmp  PushClipRect:(SGRectangle *)r;
+ (void)pushClipX:(int)x  y:(int)y  width:(int)w  height:(int)h;
+ (void)bitmap:(SGBitmap *)bmp  putPixelX:(color)value  y:(int)x  color:(int)y;
+ (color)rgbaColorRed:(unsigned char)red  green:(unsigned char)green  blue:(unsigned char)blue  alpha:(unsigned char)alpha;
+ (color)rgbaFloatColorRed:(float)r  green:(float)g  blue:(float)b  alpha:(float)a;
+ (color)rgbColorRed:(unsigned char)red  green:(unsigned char)green  blue:(unsigned char)blue;
+ (color)rgbFloatColorRed:(float)r  green:(float)g  blue:(float)b;
+ (color)randomColor;
+ (color)randomRGBColor:(unsigned char)alpha;
+ (unsigned char)redOf:(color)c;
+ (void)refreshScreen;
+ (void)refreshScreenRestrictFPS:(uint)TargetFPS;
+ (void)resetClip;
+ (void)resetClipForBitmap:(SGBitmap *)bmp;
+ (float)saturationOf:(color)c;
+ (void)setClip:(SGRectangle *)r;
+ (void)bitmap:(SGBitmap *)bmp  setClip:(SGRectangle *)r;
+ (void)setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h;
+ (void)bitmap:(SGBitmap *)bmp  setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h;
+ (void)setIcon:(NSString *)filename;
+ (void)takeScreenshot:(NSString *)basename;
+ (void)toggleFullScreen;
+ (void)toggleWindowBorder;
+ (unsigned char)transparencyOf:(color)c;








@end

