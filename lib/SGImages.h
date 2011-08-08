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


@interface SGImages : NSObject
{
  
}

+ (SGCircle *)circleFromBitmap:(SGBitmap *)bmp  cellAtPt:(SGPoint2D *)pt;
+ (SGCircle *)circleBitmap:(SGBitmap *)bmp  cellAtX:(int)x  y:(int)y;
+ (int)bitmapCellColumns:(SGBitmap *)bmp;
+ (int)bitmapCellCount:(SGBitmap *)bmp;
+ (int)bitmapCellHeight:(SGBitmap *)bmp;
+ (SGBitmapCell *)bitmap:(SGBitmap *)bmp  bitmapCellForCell:(int)cell;
+ (SGRectangle *)rectangleForBitmapCellAtOrigin:(SGBitmap *)bmp;
+ (SGRectangle *)rectangleAt:(SGPoint2D *)pt  forBitmapCell:(SGBitmap *)bmp;
+ (SGRectangle *)rectangleForCellAtX:(float)x  y:(float)y  forBitmapCell:(SGBitmap *)bmp;
+ (int)bitmapCellRows:(SGBitmap *)bmp;
+ (int)bitmapCellWidth:(SGBitmap *)bmp;
+ (SGCircle *)circleFrombitmap:(SGBitmap *)bmp  atPt:(SGPoint2D *)pt;
+ (SGCircle *)circleFromBitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y;
+ (NSString *)bitmapFilename:(SGBitmap *)bmp;
+ (int)bitmapHeightForCell:(SGBitmapCell *)bmp;
+ (int)bitmapHeight:(SGBitmap *)bmp;
+ (NSString *)bitmapName:(SGBitmap *)bmp;
+ (SGBitmap *)bitmapNamed:(NSString *)name;
+ (SGRectangle *)bitmapRectAtOrigin:(SGBitmap *)bmp;
+ (SGRectangle *)rectangleAtX:(float)x  y:(float)y  forBitmap:(SGBitmap *)bmp;
+ (SGRectangle *)bitmap:(SGBitmap *)src  rectangleOfCell:(int)cell;
+ (void)bitmap:(SGBitmap *)bmp  setCellWidth:(int)width  height:(int)height  columns:(int)columns  rows:(int)rows  count:(int)count;
+ (int)bitmapWidth:(SGBitmap *)bmp;
+ (int)bitmapWidthForCell:(SGBitmapCell *)bmp;
+ (BOOL)bitmap: (SGBitmap *)bmp1  interchangableWith:(SGBitmap *)bmp2;
+ (void)clearSurfaceToBlack:(SGBitmap *)dest;
+ (void)clearSurface:(SGBitmap *)dest  color:(color)toColor;
+ (SGBitmap *)combineIntoBitmap:(NSArray *)bitmaps  columns:(int)cols;
+ (SGBitmap *)createBitmapWidth:(int)width  height:(int)height;
+ (SGBitmap *)createBitmapNamed:(NSString *)name  width:(int)width  height:(int)height;
+ (void)draw:(SGBitmap *)src  x:(float)x  y:(float)y;
+ (void)drawBitmapNamed:(NSString *)name  x:(float)x  y:(float)y;
+ (void)drawBitmapNamed:(NSString *)name  position:(SGPoint2D *)position;
+ (void)draw:(SGBitmap *)src  position:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  at:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  atX:(int)x  y:(int)y;
+ (void)bitmapCell:(SGBitmapCell *)src  drawAtPosition:(SGPoint2D *)position;
+ (void)bitmapCell:(SGBitmapCell *)src  drawAtX:(float)x  y:(float)y;
+ (void)drawOnto:(SGBitmap *)dest  bitmapCell:(SGBitmapCell *)src  at:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  bitmapCell:(SGBitmapCell *)src  atX:(int)x  y:(int)y;
+ (void)bitmapCell:(SGBitmapCell *)src  drawOnScreenAt:(SGPoint2D *)position;
+ (void)bitmapCell:(SGBitmapCell *)src  drawOnScreenAtX:(int)x  y:(int)y;
+ (void)draw:(SGBitmap *)src  onScreenAt:(SGPoint2D *)position;
+ (void)draw:(SGBitmap *)src  onScreenAtX:(int)x  y:(int)y;
+ (void)bitmap:(SGBitmap *)src  drawPart:(SGRectangle *)source  position:(SGPoint2D *)position;
+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  x:(float)x  y:(float)y;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcRect:(SGRectangle *)source  at:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcRect:(SGRectangle *)source  atX:(int)x  y:(int)y;
+ (void)draw:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  x:(float)x  y:(float)y;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  atX:(int)x  y:(int)y;
+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  onScreenAt:(SGPoint2D *)position;
+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  onScreenAtX:(int)x  y:(int)y;
+ (void)draw:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  onScreenAtX:(int)x  y:(int)y;
+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  at:(SGPoint2D *)position;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  cell:(int)cell  at:(SGPoint2D *)position;
+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  atX:(float)x  y:(float)y;
+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  cell:(int)cell  atX:(float)x  y:(float)y;
+ (void)bitmap:(SGBitmap *)src  drawCellOnScreen:(int)cell  at:(SGPoint2D *)position;
+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  onScreenAtX:(float)x  y:(float)y;
+ (void)freeBitmap:(SGBitmap *)bitmapToFree;
+ (BOOL)hasBitmap:(NSString *)name;
+ (SGBitmap *)loadBitmapFile:(NSString *)filename;
+ (SGBitmap *)loadBitmapFile:(NSString *)filename  colorKeyed:(BOOL)transparent  withColor:(color)transparentColor;
+ (SGBitmap *)loadBitmapNamed:(NSString *)name  fromFile:(NSString *)filename;
+ (SGBitmap *)loadBitmapFile:(NSString *)filename  withColorKey:(color)transparentColor;
+ (SGBitmap *)loadBitmapNamed:(NSString *)name  toFile:(NSString *)filename  colorKey:(color)transparentColor;
+ (void)makeOpaque:(SGBitmap *)bmp;
+ (void)makeTransparent:(SGBitmap *)bmp;
+ (void)optimiseBitmap:(SGBitmap *)surface;
+ (BOOL)pixelOf:(SGBitmap *)bmp  drawnAtX:(int)x  y:(int)y;
+ (void)releaseAllBitmaps;
+ (void)releaseBitmap:(NSString *)name;
+ (SGBitmap *)transformBitmap:(SGBitmap *)src  rotate:(float)degRot  scale:(float)scale;
+ (BOOL)bitmapCell:(SGBitmapCell *)bmp1  isSameAs:(SGBitmapCell *)bmp2;
+ (void)bitmap:(SGBitmap *)src  saveToFile:(NSString *)filepath;
+ (void)bitmap:(SGBitmap *)bmp  saveToPNG:(NSString *)filename;
+ (void)setOpacityOf:(SGBitmap *)bmp  pct:(float)pct;
+ (void)bitmap:(SGBitmap *)src  setTransparentColor:(color)clr;
+ (void)setupBitmapForCollisions:(SGBitmap *)src;








@end

