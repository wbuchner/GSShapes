#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGBitmap : NSObject <PointerWrapper>
{
@package
    bitmap pointer;
}

+ (NSArray *) arrayOfBitmaps:(bitmap *)firstPtr size:(int)sz;
+ (void) getBitmaps:(bitmap *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(bitmap)ptr;

- (id)initWithId:(bitmap)ptr; 

- (id)initWithPath:(NSString *)filename;
- (id)initWithPath:(NSString *)filename  transparentColor:(color)transparentColor;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename;
- (id)initWithWidth:(int)width  andHeight:(int)height;
- (id)initWithPath:(NSString *)filename  withTransparency:(BOOL)transparent  usingColor:(color)transparentColor;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename  colorKey:(color)transparentColor;
- (id)initNamed:(NSString *)name  withWidth:(int)width  andHeight:(int)height;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int cellColumns;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int cellCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int cellHeight;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int cellRows;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int cellWidth;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGRectangle * currentClip;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * filename;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int height;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * name;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int width;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (int)cellColumns;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)cellCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)cellHeight;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)cellRows;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)cellWidth;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGRectangle *)currentClip;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)filename;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)height;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)name;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)width;
#endif
- (SGBitmapCell *)bitmapCell:(int)cell;
- (BOOL)at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  atPt:(SGPoint2D *)pt2;
- (BOOL)at:(SGPoint2D *)pt1  part:(SGRectangle *)part1  collisionWith:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part2;
- (BOOL)atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2;
- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2;
- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part;
- (BOOL)cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2;
- (BOOL)cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2  part:(SGRectangle *)part;
- (BOOL)cell:(int)cell1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  at:(SGPoint2D *)pt2;
- (BOOL)cell:(int)cell1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  atX:(int)x2  y:(int)y2;
- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt  collisionWithRect:(SGRectangle *)rect;
- (BOOL)cell:(int)cell  atX:(int)x  y:(int)y  collisionWithRect:(SGRectangle *)rect;
- (SGRectangle *)rectangleCell:(int)cell;
- (void)clearSurface;
- (void)clearSurfaceTo:(color)toColor;
- (void)drawAtX:(float)x  y:(float)y;
- (void)drawAt:(SGPoint2D *)position;
- (void)drawCell:(int)cell  onScreenAt:(SGPoint2D *)position;
- (void)drawCell:(int)cell  onScreenAtX:(float)x  y:(float)y;
- (void)drawOnto:(SGBitmap *)dest  cell:(int)cell  at:(SGPoint2D *)position;
- (void)drawOnto:(SGBitmap *)dest  cell:(int)cell  atX:(float)x  y:(float)y;
- (void)drawOnScreenAt:(SGPoint2D *)position;
- (void)drawOnScreenAtX:(int)x  y:(int)y;
- (void)drawOnto:(SGBitmap *)dest  at:(SGPoint2D *)position;
- (void)drawOnto:(SGBitmap *)dest  atX:(int)x  y:(int)y;
- (void)drawSrcRect:(SGRectangle *)source  position:(SGPoint2D *)position;
- (void)drawSrcRect:(SGRectangle *)source  x:(float)x  y:(float)y;
- (void)drawSrcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  x:(float)x  y:(float)y;
- (void)drawSrcRect:(SGRectangle *)source  onScreenAt:(SGPoint2D *)position;
- (void)drawSrcRect:(SGRectangle *)source  onScreenAtX:(int)x  y:(int)y;
- (void)drawSrcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  onScreenAtX:(int)x  y:(int)y;
- (void)drawOnto:(SGBitmap *)src  srcRect:(SGRectangle *)source  at:(SGPoint2D *)position;
- (void)drawOnto:(SGBitmap *)src  srcRect:(SGRectangle *)source  atX:(int)x  y:(int)y;
- (void)drawOnto:(SGBitmap *)dest  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  atX:(int)x  y:(int)y;
- (color)colorAtX:(int)x  y:(int)y;
- (void)makeOpaque;
- (void)makeTransparent;
- (void)optimiseBitmap;
- (BOOL)pixelDrawnAtX:(int)x  y:(int)y;
- (BOOL)atX:(int)x  y:(int)y  collisionWithPt:(SGPoint2D *)pt;
- (BOOL)atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPt:(SGPoint2D *)pt;
- (BOOL)atX:(int)x  y:(int)y  collisionWithPtX:(float)ptX  y:(float)ptY;
- (BOOL)atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPtX:(float)ptX  y:(float)ptY;
- (void)popClip;
- (void)pushClip:(SGRectangle *)r;
- (BOOL)collisionAtX:(int)x  y:(int)y  withRect:(SGRectangle *)rect;
- (BOOL)atPt:(SGPoint2D *)pt  part:(SGRectangle *)part  collisionWithRect:(SGRectangle *)rect;
- (BOOL)collisionAtX:(int)x  y:(int)y  part:(SGRectangle *)part  withRect:(SGRectangle *)rect;
- (BOOL)collisionAtX:(int)x  y:(int)y  withRectX:(int)rectX  y:(int)rectY  width:(int)rectWidth  height:(int)rectHeight;
- (void)resetClip;
- (SGBitmap *)rotate:(float)degRot  scale:(float)scale;
- (void)saveToFile:(NSString *)filepath;
- (void)setCellWidth:(int)width  height:(int)height  columns:(int)columns  rows:(int)rows  count:(int)count;
- (void)setClip:(SGRectangle *)r;
- (void)setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h;
- (void)setOpacity:(float)pct;
- (void)setTransparentColor:(color)clr;
- (void)setupForCollisions;
- (SGCircle *)circleCellAtPT:(SGPoint2D *)pt;
- (SGCircle *)circleCellAtX:(int)x  y:(int)y;
- (SGRectangle *)toRectangleForCellAtOrigin;
- (SGRectangle *)toRectangleForCellAt:(SGPoint2D *)pt;
- (SGRectangle *)toRectangleForCellAtX:(float)x  y:(float)y;
- (SGCircle *)circleAtPt:(SGPoint2D *)pt;
- (SGCircle *)circleAtX:(int)x  y:(int)y;
- (SGRectangle *)toRectangleAtOrigin;
- (SGRectangle *)toRectangleAtX:(float)x  y:(float)y;
- (BOOL)interchangableWith:(SGBitmap *)bmp2;
- (void)saveToPNG:(NSString *)filename;
- (void)free;
@end
