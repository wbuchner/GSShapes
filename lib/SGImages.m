#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGImages.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGImages : NSObject


+ (SGCircle *)circleFromBitmap:(SGBitmap *)bmp  cellAtPt:(SGPoint2D *)pt
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCellCircle(bmp->pointer, &pt->data)];
    return result;
}

+ (SGCircle *)circleBitmap:(SGBitmap *)bmp  cellAtX:(int)x  y:(int)y
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCellCircleXY(bmp->pointer, x, y)];
    return result;
}

+ (int)bitmapCellColumns:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapCellColumns(bmp->pointer);
    return result;
}

+ (int)bitmapCellCount:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapCellCount(bmp->pointer);
    return result;
}

+ (int)bitmapCellHeight:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapCellHeight(bmp->pointer);
    return result;
}

+ (SGBitmapCell *)bitmap:(SGBitmap *)bmp  bitmapCellForCell:(int)cell
{
    SGBitmapCell * result;
    result = [SGBitmapCell bitmapCellForData:sg_Images_BitmapCellOf(bmp->pointer, cell)];
    return result;
}

+ (SGRectangle *)rectangleForBitmapCellAtOrigin:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangleAtOrigin(bmp->pointer)];
    return result;
}

+ (SGRectangle *)rectangleAt:(SGPoint2D *)pt  forBitmapCell:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangle(&pt->data, bmp->pointer)];
    return result;
}

+ (SGRectangle *)rectangleForCellAtX:(float)x  y:(float)y  forBitmapCell:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangleXY(x, y, bmp->pointer)];
    return result;
}

+ (int)bitmapCellRows:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapCellRows(bmp->pointer);
    return result;
}

+ (int)bitmapCellWidth:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapCellWidth(bmp->pointer);
    return result;
}

+ (SGCircle *)circleFrombitmap:(SGBitmap *)bmp  atPt:(SGPoint2D *)pt
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCircle(bmp->pointer, &pt->data)];
    return result;
}

+ (SGCircle *)circleFromBitmap:(SGBitmap *)bmp  atX:(int)x  y:(int)y
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCircleXY(bmp->pointer, x, y)];
    return result;
}

+ (NSString *)bitmapFilename:(SGBitmap *)bmp
{
    char result[2048];
    sg_Images_BitmapFilename(bmp->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (int)bitmapHeightForCell:(SGBitmapCell *)bmp
{
    int result;
    result = sg_Images_BitmapHeightForCell(&bmp->data);
    return result;
}

+ (int)bitmapHeight:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapHeight(bmp->pointer);
    return result;
}

+ (NSString *)bitmapName:(SGBitmap *)bmp
{
    char result[2048];
    sg_Images_BitmapName(bmp->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGBitmap *)bitmapNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_BitmapNamed(name_temp)];
    return result;
}

+ (SGRectangle *)bitmapRectAtOrigin:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectAtOrigin(bmp->pointer)];
    return result;
}

+ (SGRectangle *)rectangleAtX:(float)x  y:(float)y  forBitmap:(SGBitmap *)bmp
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectXY(x, y, bmp->pointer)];
    return result;
}

+ (SGRectangle *)bitmap:(SGBitmap *)src  rectangleOfCell:(int)cell
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectangleOfCell(src->pointer, cell)];
    return result;
}

+ (void)bitmap:(SGBitmap *)bmp  setCellWidth:(int)width  height:(int)height  columns:(int)columns  rows:(int)rows  count:(int)count
{
    sg_Images_BitmapSetCellDetails(bmp->pointer, width, height, columns, rows, count);
}

+ (int)bitmapWidth:(SGBitmap *)bmp
{
    int result;
    result = sg_Images_BitmapWidth(bmp->pointer);
    return result;
}

+ (int)bitmapWidthForCell:(SGBitmapCell *)bmp
{
    int result;
    result = sg_Images_BitmapWidthForCell(&bmp->data);
    return result;
}

+ (BOOL)bitmap: (SGBitmap *)bmp1  interchangableWith:(SGBitmap *)bmp2
{
    BOOL result;
    result = sg_Images_BitmapsInterchangable(bmp1->pointer, bmp2->pointer) != 0;
    return result;
}

+ (void)clearSurfaceToBlack:(SGBitmap *)dest
{
    sg_Images_ClearSurfaceToBlack(dest->pointer);
}

+ (void)clearSurface:(SGBitmap *)dest  color:(color)toColor
{
    sg_Images_ClearSurface(dest->pointer, toColor);
}

+ (SGBitmap *)combineIntoBitmap:(NSArray *)bitmaps  columns:(int)cols
{
    bitmap bitmaps_temp[[bitmaps count]];
    SGBitmap * result;
    [SGBitmap getBitmaps:bitmaps_temp fromArray:bitmaps maxSize:[bitmaps count]];
    result = [SGBitmap createWithId:sg_Images_CombineIntoGrid(bitmaps_temp, cols, [bitmaps count])];
    return result;
}

+ (SGBitmap *)createBitmapWidth:(int)width  height:(int)height
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Images_CreateBitmap(width, height)];
    return result;
}

+ (SGBitmap *)createBitmapNamed:(NSString *)name  width:(int)width  height:(int)height
{
    char name_temp[[name length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_CreateBitmapNamed(name_temp, width, height)];
    return result;
}

+ (void)draw:(SGBitmap *)src  x:(float)x  y:(float)y
{
    sg_Images_DrawBitmap(src->pointer, x, y);
}

+ (void)drawBitmapNamed:(NSString *)name  x:(float)x  y:(float)y
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_DrawBitmapNamed(name_temp, x, y);
}

+ (void)drawBitmapNamed:(NSString *)name  position:(SGPoint2D *)position
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_DrawBitmapNamedAtPoint(name_temp, &position->data);
}

+ (void)draw:(SGBitmap *)src  position:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPoint(src->pointer, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPointOnto(dest->pointer, src->pointer, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapOnto(dest->pointer, src->pointer, x, y);
}

+ (void)bitmapCell:(SGBitmapCell *)src  drawAtPosition:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPoint(&src->data, &position->data);
}

+ (void)bitmapCell:(SGBitmapCell *)src  drawAtX:(float)x  y:(float)y
{
    sg_Images_DrawBitmapCell(&src->data, x, y);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmapCell:(SGBitmapCell *)src  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPointOnto(dest->pointer, &src->data, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmapCell:(SGBitmapCell *)src  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapCellOnto(dest->pointer, &src->data, x, y);
}

+ (void)bitmapCell:(SGBitmapCell *)src  drawOnScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPointOnScreen(&src->data, &position->data);
}

+ (void)bitmapCell:(SGBitmapCell *)src  drawOnScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapCellOnScreen(&src->data, x, y);
}

+ (void)draw:(SGBitmap *)src  onScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPointOnScreen(src->pointer, &position->data);
}

+ (void)draw:(SGBitmap *)src  onScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapOnScreen(src->pointer, x, y);
}

+ (void)bitmap:(SGBitmap *)src  drawPart:(SGRectangle *)source  position:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPoint(src->pointer, &source->data, &position->data);
}

+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  x:(float)x  y:(float)y
{
    sg_Images_DrawBitmapPartFromRect(src->pointer, &source->data, x, y);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcRect:(SGRectangle *)source  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPointOnto(dest->pointer, src->pointer, &source->data, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcRect:(SGRectangle *)source  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartFromRectOnto(dest->pointer, src->pointer, &source->data, x, y);
}

+ (void)draw:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  x:(float)x  y:(float)y
{
    sg_Images_DrawBitmapPart(src->pointer, srcX, srcY, srcW, srcH, x, y);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartOnto(dest->pointer, src->pointer, srcX, srcY, srcW, srcH, x, y);
}

+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  onScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPointOnScreen(src->pointer, &source->data, &position->data);
}

+ (void)draw:(SGBitmap *)src  srcRect:(SGRectangle *)source  onScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartFromRectOnScreen(src->pointer, &source->data, x, y);
}

+ (void)draw:(SGBitmap *)src  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  onScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartOnScreen(src->pointer, srcX, srcY, srcW, srcH, x, y);
}

+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  at:(SGPoint2D *)position
{
    sg_Images_DrawCell(src->pointer, cell, &position->data);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  cell:(int)cell  at:(SGPoint2D *)position
{
    sg_Images_DrawCellOnto(dest->pointer, src->pointer, cell, &position->data);
}

+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  atX:(float)x  y:(float)y
{
    sg_Images_DrawCellXY(src->pointer, cell, x, y);
}

+ (void)drawOnto:(SGBitmap *)dest  bitmap:(SGBitmap *)src  cell:(int)cell  atX:(float)x  y:(float)y
{
    sg_Images_DrawCellOntoXY(dest->pointer, src->pointer, cell, x, y);
}

+ (void)bitmap:(SGBitmap *)src  drawCellOnScreen:(int)cell  at:(SGPoint2D *)position
{
    sg_Images_DrawCellOnScreen(src->pointer, cell, &position->data);
}

+ (void)bitmap:(SGBitmap *)src  drawCell:(int)cell  onScreenAtX:(float)x  y:(float)y
{
    sg_Images_DrawCellOnScreenXY(src->pointer, cell, x, y);
}

+ (void)freeBitmap:(SGBitmap *)bitmapToFree
{
    sg_Images_FreeBitmap(&bitmapToFree->pointer);
}

+ (BOOL)hasBitmap:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Images_HasBitmap(name_temp) != 0;
    return result;
}

+ (SGBitmap *)loadBitmapFile:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_LoadBitmap(filename_temp)];
    return result;
}

+ (SGBitmap *)loadBitmapFile:(NSString *)filename  colorKeyed:(BOOL)transparent  withColor:(color)transparentColor
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_LoadBitmapWithTransparentColor(filename_temp, (transparent ? 1 : 0), transparentColor)];
    return result;
}

+ (SGBitmap *)loadBitmapNamed:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_LoadBitmapNamed(name_temp, filename_temp)];
    return result;
}

+ (SGBitmap *)loadBitmapFile:(NSString *)filename  withColorKey:(color)transparentColor
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_LoadBitmapWithTransparentColor(filename_temp, 1, transparentColor)];
    return result;
}

+ (SGBitmap *)loadBitmapNamed:(NSString *)name  toFile:(NSString *)filename  colorKey:(color)transparentColor
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGBitmap createWithId:sg_Images_LoadTransparentBitmapNamed(name_temp, filename_temp, transparentColor)];
    return result;
}

+ (void)makeOpaque:(SGBitmap *)bmp
{
    sg_Images_MakeOpaque(bmp->pointer);
}

+ (void)makeTransparent:(SGBitmap *)bmp
{
    sg_Images_MakeTransparent(bmp->pointer);
}

+ (void)optimiseBitmap:(SGBitmap *)surface
{
    sg_Images_OptimiseBitmap(surface->pointer);
}

+ (BOOL)pixelOf:(SGBitmap *)bmp  drawnAtX:(int)x  y:(int)y
{
    BOOL result;
    result = sg_Images_PixelDrawnAtPoint(bmp->pointer, x, y) != 0;
    return result;
}

+ (void)releaseAllBitmaps
{
    sg_Images_ReleaseAllBitmaps();
}

+ (void)releaseBitmap:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_ReleaseBitmap(name_temp);
}

+ (SGBitmap *)transformBitmap:(SGBitmap *)src  rotate:(float)degRot  scale:(float)scale
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Images_RotateScaleBitmap(src->pointer, degRot, scale)];
    return result;
}

+ (BOOL)bitmapCell:(SGBitmapCell *)bmp1  isSameAs:(SGBitmapCell *)bmp2
{
    BOOL result;
    result = sg_Images_SameBitmapCell(&bmp1->data, &bmp2->data) != 0;
    return result;
}

+ (void)bitmap:(SGBitmap *)src  saveToFile:(NSString *)filepath
{
    char filepath_temp[[filepath length] + 1];
    [filepath getCString:filepath_temp maxLength:[filepath length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_SaveBitmap(src->pointer, filepath_temp);
}

+ (void)bitmap:(SGBitmap *)bmp  saveToPNG:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_SaveToPNG(bmp->pointer, filename_temp);
}

+ (void)setOpacityOf:(SGBitmap *)bmp  pct:(float)pct
{
    sg_Images_SetOpacity(bmp->pointer, pct);
}

+ (void)bitmap:(SGBitmap *)src  setTransparentColor:(color)clr
{
    sg_Images_SetTransparentColor(src->pointer, clr);
}

+ (void)setupBitmapForCollisions:(SGBitmap *)src
{
    sg_Images_SetupBitmapForCollisions(src->pointer);
}









@end
