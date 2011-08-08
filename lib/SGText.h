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


@interface SGText : NSObject
{
  
}

+ (void)drawFramerateAtX:(int)x  y:(int)y;
+ (void)drawFramerateAtX:(int)x  y:(int)y  font:(SGFont *)font;
+ (void)drawFramerateAtX:(int)x  y:(int)y  fontNamed:(NSString *)name;
+ (void)drawFramerateAtX:(int)x  y:(int)y  fontNamed:(NSString *)name  size:(int)size;
+ (void)drawText:(NSString *)theText  color:(color)textColor  pt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  pt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  x:(float)x  y:(float)y;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  pt:(SGPoint2D *)pt;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  atPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  x:(float)x  y:(float)y;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  x:(float)x  y:(float)y;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  onScreenAtX:(float)x  y:(float)y;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  atPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  pt:(SGPoint2D *)pt;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  atPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  x:(float)x  y:(float)y;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  atX:(int)x  y:(int)y;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  atX:(int)x  y:(int)y;
+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  atX:(int)x  y:(int)y;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  inRect:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  inRect:(SGRectangle *)withinRect;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  in:(SGRectangle *)withinRect;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  in:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  inRect:(SGRectangle *)withinRect;
+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  in:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h;
+ (void)drawText:(NSString *)theText  color:(color)textColor  onScreenX:(float)x  y:(float)y;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  onScreenAtPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  onScreenAtPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  onScreenAtX:(int)x  y:(int)y;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  onScreenAtX:(int)x  y:(int)y;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  onScreenAtPt:(SGPoint2D *)pt;
+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  onScreenAtX:(int)x  y:(int)y;
+ (font_style)fontFontStyle:(SGFont *)font;
+ (NSString *)fontName:(NSString *)fontName  size:(int)size;
+ (SGFont *)fontNamed:(NSString *)name;
+ (SGFont *)fontNamed:(NSString *)name  withSize:(int)size;
+ (void)font:(SGFont *)font  setStyle:(font_style)value;
+ (void)freeFont:(SGFont *)fontToFree;
+ (BOOL)hasFont:(NSString *)name;
+ (SGFont *)loadFontFile:(NSString *)fontName  size:(int)size;
+ (SGFont *)loadFontNamed:(NSString *)name  fromFile:(NSString *)filename  size:(int)size;
+ (void)releaseAllFonts;
+ (void)releaseFont:(NSString *)name;
+ (font_alignment)textAlignmentFrom:(NSString *)str;
+ (int)font:(SGFont *)theFont  heightOf:(NSString *)theText;
+ (int)font:(SGFont *)theFont  widthOf:(NSString *)theText;








@end

