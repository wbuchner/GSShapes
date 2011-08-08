#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGText.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGText : NSObject


+ (void)drawFramerateAtX:(int)x  y:(int)y
{
    sg_Text_DrawFramerateWithSimpleFont(x, y);
}

+ (void)drawFramerateAtX:(int)x  y:(int)y  font:(SGFont *)font
{
    sg_Text_DrawFramerate(x, y, font->pointer);
}

+ (void)drawFramerateAtX:(int)x  y:(int)y  fontNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawFramerateFontNamed(x, y, name_temp);
}

+ (void)drawFramerateAtX:(int)x  y:(int)y  fontNamed:(NSString *)name  size:(int)size
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawFramerateFontNamedSize(x, y, name_temp, size);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  pt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawSimpleTextPt(theText_temp, textColor, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  pt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextAtPoint(theText_temp, textColor, theFont->pointer, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  x:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawSimpleText(theText_temp, textColor, x, y);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  pt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextAtPointWithFontNamed(theText_temp, textColor, name_temp, &pt->data);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  atPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmapAtPointWithFontNamed(dest->pointer, theText_temp, textColor, name_temp, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  x:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawText(theText_temp, textColor, theFont->pointer, x, y);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  x:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextWithFontNamed(theText_temp, textColor, name_temp, x, y);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  onScreenAtX:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawSimpleTextOnBitmap(dest->pointer, theText_temp, textColor, x, y);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  atPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmapAtPoint(dest->pointer, theText_temp, textColor, theFont->pointer, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  pt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextAtPointWithFontNamedAndSize(theText_temp, textColor, name_temp, size, &pt->data);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  atPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmapAtPointWithFontNamedAndSize(dest->pointer, theText_temp, textColor, name_temp, size, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  x:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextWithFontNamedSize(theText_temp, textColor, name_temp, size, x, y);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  atX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmap(dest->pointer, theText_temp, textColor, theFont->pointer, x, y);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  atX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmapWithFontNamed(dest->pointer, theText_temp, textColor, name_temp, x, y);
}

+ (void)bitmap:(SGBitmap *)dest  drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  atX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnBitmapWithFontNamedAndSize(dest->pointer, theText_temp, textColor, name_temp, size, x, y);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesWithFontNamedAndSize(theText_temp, textColor, backColor, name_temp, size, (int)align, x, y, w, h);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnBitmapWithFontNamed(dest->pointer, theText_temp, textColor, backColor, name_temp, (int)align, x, y, w, h);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnBitmap(dest->pointer, theText_temp, textColor, backColor, theFont->pointer, (int)align, x, y, w, h);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnBitmapWithFontNamedAndSize(dest->pointer, theText_temp, textColor, backColor, name_temp, size, (int)align, x, y, w, h);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  inRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectWithFontNamed(theText_temp, textColor, backColor, name_temp, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  inRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRect(theText_temp, textColor, backColor, theFont->pointer, (int)align, &withinRect->data);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  in:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnBitmap(dest->pointer, theText_temp, textColor, backColor, theFont->pointer, (int)align, &withinRect->data);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  in:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnBitmapWithFontNamed(dest->pointer, theText_temp, textColor, backColor, name_temp, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  inRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectWithFontNamedAndSize(theText_temp, textColor, backColor, name_temp, size, (int)align, &withinRect->data);
}

+ (void)bitmap:(SGBitmap *)dest  drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  in:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnBitmapWithFontNamedAndSize(dest->pointer, theText_temp, textColor, backColor, name_temp, size, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLines(theText_temp, textColor, backColor, theFont->pointer, (int)align, x, y, w, h);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  atX:(float)x  y:(float)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesWithFontNamed(theText_temp, textColor, backColor, name_temp, (int)align, x, y, w, h);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnScreenWithFontNamedWithSize(theText_temp, textColor, backColor, name_temp, size, (int)align, x, y, w, h);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnScreen(theText_temp, textColor, backColor, theFont->pointer, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnScreenWithFontNamed(theText_temp, textColor, backColor, name_temp, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  size:(int)size  align:(font_alignment)align  onScreenInRect:(SGRectangle *)withinRect
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesInRectOnScreenWithFontNamedAndSize(theText_temp, textColor, backColor, name_temp, size, (int)align, &withinRect->data);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  font:(SGFont *)theFont  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnScreen(theText_temp, textColor, backColor, theFont->pointer, (int)align, x, y, w, h);
}

+ (void)drawTextLines:(NSString *)theText  textColor:(color)textColor  backColor:(color)backColor  fontNamed:(NSString *)name  align:(font_alignment)align  onScreenAtX:(int)x  y:(int)y  w:(int)w  h:(int)h
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextLinesOnScreenWithFontNamed(theText_temp, textColor, backColor, name_temp, (int)align, x, y, w, h);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  onScreenX:(float)x  y:(float)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawSimpleTextOnScreen(theText_temp, textColor, x, y);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  onScreenAtPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreenAtPointWithFontNamed(theText_temp, textColor, name_temp, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  onScreenAtPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreenAtPoint(theText_temp, textColor, theFont->pointer, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  font:(SGFont *)theFont  onScreenAtX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreen(theText_temp, textColor, theFont->pointer, x, y);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  onScreenAtX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreenWithFontNamed(theText_temp, textColor, name_temp, x, y);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  onScreenAtPt:(SGPoint2D *)pt
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreenAtPointWithFontNamedAndSize(theText_temp, textColor, name_temp, size, &pt->data);
}

+ (void)drawText:(NSString *)theText  color:(color)textColor  fontNamed:(NSString *)name  size:(int)size  onScreenAtX:(int)x  y:(int)y
{
    char theText_temp[[theText length] + 1];
    char name_temp[[name length] + 1];
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_DrawTextOnScreenWithFontNamedAndSize(theText_temp, textColor, name_temp, size, x, y);
}

+ (font_style)fontFontStyle:(SGFont *)font
{
    font_style result;
    result = (font_style)sg_Text_FontFontStyle(font->pointer);
    return result;
}

+ (NSString *)fontName:(NSString *)fontName  size:(int)size
{
    char fontName_temp[[fontName length] + 1];
    char result[2048];
    [fontName getCString:fontName_temp maxLength:[fontName length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_FontNameFor(fontName_temp, size, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGFont *)fontNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGFont * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGFont createWithId:sg_Text_FontNamed(name_temp)];
    return result;
}

+ (SGFont *)fontNamed:(NSString *)name  withSize:(int)size
{
    char name_temp[[name length] + 1];
    SGFont * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGFont createWithId:sg_Text_FontNamedWithSize(name_temp, size)];
    return result;
}

+ (void)font:(SGFont *)font  setStyle:(font_style)value
{
    sg_Text_FontSetStyle(font->pointer, (int)value);
}

+ (void)freeFont:(SGFont *)fontToFree
{
    sg_Text_FreeFont(&fontToFree->pointer);
}

+ (BOOL)hasFont:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Text_HasFont(name_temp) != 0;
    return result;
}

+ (SGFont *)loadFontFile:(NSString *)fontName  size:(int)size
{
    char fontName_temp[[fontName length] + 1];
    SGFont * result;
    [fontName getCString:fontName_temp maxLength:[fontName length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGFont createWithId:sg_Text_LoadFont(fontName_temp, size)];
    return result;
}

+ (SGFont *)loadFontNamed:(NSString *)name  fromFile:(NSString *)filename  size:(int)size
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGFont * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGFont createWithId:sg_Text_LoadFontNamed(name_temp, filename_temp, size)];
    return result;
}

+ (void)releaseAllFonts
{
    sg_Text_ReleaseAllFonts();
}

+ (void)releaseFont:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Text_ReleaseFont(name_temp);
}

+ (font_alignment)textAlignmentFrom:(NSString *)str
{
    char str_temp[[str length] + 1];
    font_alignment result;
    [str getCString:str_temp maxLength:[str length] + 1 encoding:NSASCIIStringEncoding];
    result = (font_alignment)sg_Text_TextAlignmentFrom(str_temp);
    return result;
}

+ (int)font:(SGFont *)theFont  heightOf:(NSString *)theText
{
    char theText_temp[[theText length] + 1];
    int result;
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Text_TextHeight(theFont->pointer, theText_temp);
    return result;
}

+ (int)font:(SGFont *)theFont  widthOf:(NSString *)theText
{
    char theText_temp[[theText length] + 1];
    int result;
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Text_TextWidth(theFont->pointer, theText_temp);
    return result;
}









@end
