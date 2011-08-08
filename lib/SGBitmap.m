#import "SGBitmap.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGBitmap : NSObject

+ (void) getBitmaps:(bitmap *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGBitmap *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfBitmaps:(bitmap *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGBitmap *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGBitmap createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(bitmap)ptr
{
    if (ptr == nil) return nil;
    id obj = [PointerManager objectForKey: (id)ptr];
    
    if (obj == nil)
    {
        // Create and assign to obj...
        obj = [[[self alloc] initWithId:ptr] autorelease];
    }
    
    return obj;
}

- (id)initWithId:(bitmap)ptr
{
    if (ptr == nil)
    {
        [self release];
        return nil;
    }
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        pointer = ptr;
        [PointerManager registerObject:self withKey:(id)ptr];
    }
    return self;
}

- (void)releasePointer
{
    pointer = nil;
}



- (id)initWithPath:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_LoadBitmap(filename_temp)];
    return result;
}

- (id)initWithPath:(NSString *)filename  transparentColor:(color)transparentColor
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_LoadBitmapWithTransparentColor(filename_temp, 1, transparentColor)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_LoadBitmapNamed(name_temp, filename_temp)];
    return result;
}

- (id)initWithWidth:(int)width  andHeight:(int)height
{
    SGBitmap * result;
    result = [self initWithId: sg_Images_CreateBitmap(width, height)];
    return result;
}

- (id)initWithPath:(NSString *)filename  withTransparency:(BOOL)transparent  usingColor:(color)transparentColor
{
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_LoadBitmapWithTransparentColor(filename_temp, (transparent ? 1 : 0), transparentColor)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename  colorKey:(color)transparentColor
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_LoadTransparentBitmapNamed(name_temp, filename_temp, transparentColor)];
    return result;
}

- (id)initNamed:(NSString *)name  withWidth:(int)width  andHeight:(int)height
{
    char name_temp[[name length] + 1];
    SGBitmap * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Images_CreateBitmapNamed(name_temp, width, height)];
    return result;
}



@dynamic cellColumns;
@dynamic cellCount;
@dynamic cellHeight;
@dynamic cellRows;
@dynamic cellWidth;
@dynamic currentClip;
@dynamic filename;
@dynamic height;
@dynamic name;
@dynamic width;


- (int)cellColumns
{
    int result;
    result = sg_Images_BitmapCellColumns(self->pointer);
    return result;
}

- (int)cellCount
{
    int result;
    result = sg_Images_BitmapCellCount(self->pointer);
    return result;
}

- (int)cellHeight
{
    int result;
    result = sg_Images_BitmapCellHeight(self->pointer);
    return result;
}

- (int)cellRows
{
    int result;
    result = sg_Images_BitmapCellRows(self->pointer);
    return result;
}

- (int)cellWidth
{
    int result;
    result = sg_Images_BitmapCellWidth(self->pointer);
    return result;
}

- (SGRectangle *)currentClip
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Graphics_CurrentBmpClip(self->pointer)];
    return result;
}

- (NSString *)filename
{
    char result[2048];
    sg_Images_BitmapFilename(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (int)height
{
    int result;
    result = sg_Images_BitmapHeight(self->pointer);
    return result;
}

- (NSString *)name
{
    char result[2048];
    sg_Images_BitmapName(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (int)width
{
    int result;
    result = sg_Images_BitmapWidth(self->pointer);
    return result;
}

- (SGBitmapCell *)bitmapCell:(int)cell
{
    SGBitmapCell * result;
    result = [SGBitmapCell bitmapCellForData:sg_Images_BitmapCellOf(self->pointer, cell)];
    return result;
}

- (BOOL)at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  atPt:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_BitmapAtPointsCollision(self->pointer, &pt1->data, bmp2->pointer, &pt2->data) != 0;
    return result;
}

- (BOOL)at:(SGPoint2D *)pt1  part:(SGRectangle *)part1  collisionWith:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part2
{
    BOOL result;
    result = sg_Physics_BitmapsPartsCollision(self->pointer, &pt1->data, &part1->data, bmp2->pointer, &pt2->data, &part2->data) != 0;
    return result;
}

- (BOOL)atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_BitmapCollision(self->pointer, x1, y1, bmp2->pointer, x2, y2) != 0;
    return result;
}

- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_CellBitmapCollisionAtPt(self->pointer, cell, &pt1->data, bmp2->pointer, &pt2->data) != 0;
    return result;
}

- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  at:(SGPoint2D *)pt2  part:(SGRectangle *)part
{
    BOOL result;
    result = sg_Physics_CellBitmapPartCollisionAtPt(self->pointer, cell, &pt1->data, bmp2->pointer, &pt2->data, &part->data) != 0;
    return result;
}

- (BOOL)cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_CellBitmapCollision(self->pointer, cell, x1, y1, bmp2->pointer, x2, y2) != 0;
    return result;
}

- (BOOL)cell:(int)cell  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  atX:(int)x2  y:(int)y2  part:(SGRectangle *)part
{
    BOOL result;
    result = sg_Physics_CellBitmapPartCollision(self->pointer, cell, x1, y1, bmp2->pointer, x2, y2, &part->data) != 0;
    return result;
}

- (BOOL)cell:(int)cell1  at:(SGPoint2D *)pt1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  at:(SGPoint2D *)pt2
{
    BOOL result;
    result = sg_Physics_CellCollisionAtPt(self->pointer, cell1, &pt1->data, bmp2->pointer, cell2, &pt2->data) != 0;
    return result;
}

- (BOOL)cell:(int)cell1  atX:(int)x1  y:(int)y1  collisionWithBitmap:(SGBitmap *)bmp2  cell:(int)cell2  atX:(int)x2  y:(int)y2
{
    BOOL result;
    result = sg_Physics_CellCollision(self->pointer, cell1, x1, y1, bmp2->pointer, cell2, x2, y2) != 0;
    return result;
}

- (BOOL)cell:(int)cell  at:(SGPoint2D *)pt  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_CellRectCollisionAtPt(self->pointer, cell, &pt->data, &rect->data) != 0;
    return result;
}

- (BOOL)cell:(int)cell  atX:(int)x  y:(int)y  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_CellRectCollision(self->pointer, cell, x, y, &rect->data) != 0;
    return result;
}

- (SGRectangle *)rectangleCell:(int)cell
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectangleOfCell(self->pointer, cell)];
    return result;
}

- (void)clearSurface
{
    sg_Images_ClearSurfaceToBlack(self->pointer);
}

- (void)clearSurfaceTo:(color)toColor
{
    sg_Images_ClearSurface(self->pointer, toColor);
}

- (void)drawAtX:(float)x  y:(float)y
{
    sg_Images_DrawBitmap(self->pointer, x, y);
}

- (void)drawAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPoint(self->pointer, &position->data);
}

- (void)drawCell:(int)cell  onScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawCellOnScreen(self->pointer, cell, &position->data);
}

- (void)drawCell:(int)cell  onScreenAtX:(float)x  y:(float)y
{
    sg_Images_DrawCellOnScreenXY(self->pointer, cell, x, y);
}

- (void)drawOnto:(SGBitmap *)dest  cell:(int)cell  at:(SGPoint2D *)position
{
    sg_Images_DrawCellOnto(dest->pointer, self->pointer, cell, &position->data);
}

- (void)drawOnto:(SGBitmap *)dest  cell:(int)cell  atX:(float)x  y:(float)y
{
    sg_Images_DrawCellOntoXY(dest->pointer, self->pointer, cell, x, y);
}

- (void)drawOnScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPointOnScreen(self->pointer, &position->data);
}

- (void)drawOnScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapOnScreen(self->pointer, x, y);
}

- (void)drawOnto:(SGBitmap *)dest  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapAtPointOnto(dest->pointer, self->pointer, &position->data);
}

- (void)drawOnto:(SGBitmap *)dest  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapOnto(dest->pointer, self->pointer, x, y);
}

- (void)drawSrcRect:(SGRectangle *)source  position:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPoint(self->pointer, &source->data, &position->data);
}

- (void)drawSrcRect:(SGRectangle *)source  x:(float)x  y:(float)y
{
    sg_Images_DrawBitmapPartFromRect(self->pointer, &source->data, x, y);
}

- (void)drawSrcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  x:(float)x  y:(float)y
{
    sg_Images_DrawBitmapPart(self->pointer, srcX, srcY, srcW, srcH, x, y);
}

- (void)drawSrcRect:(SGRectangle *)source  onScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPointOnScreen(self->pointer, &source->data, &position->data);
}

- (void)drawSrcRect:(SGRectangle *)source  onScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartFromRectOnScreen(self->pointer, &source->data, x, y);
}

- (void)drawSrcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  onScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartOnScreen(self->pointer, srcX, srcY, srcW, srcH, x, y);
}

- (void)drawOnto:(SGBitmap *)src  srcRect:(SGRectangle *)source  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapPartFromRectAtPointOnto(self->pointer, src->pointer, &source->data, &position->data);
}

- (void)drawOnto:(SGBitmap *)src  srcRect:(SGRectangle *)source  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartFromRectOnto(self->pointer, src->pointer, &source->data, x, y);
}

- (void)drawOnto:(SGBitmap *)dest  srcX:(int)srcX  srcY:(int)srcY  srcW:(int)srcW  srcH:(int)srcH  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapPartOnto(dest->pointer, self->pointer, srcX, srcY, srcW, srcH, x, y);
}

- (color)colorAtX:(int)x  y:(int)y
{
    color result;
    result = sg_Graphics_GetPixel(self->pointer, x, y);
    return result;
}

- (void)makeOpaque
{
    sg_Images_MakeOpaque(self->pointer);
}

- (void)makeTransparent
{
    sg_Images_MakeTransparent(self->pointer);
}

- (void)optimiseBitmap
{
    sg_Images_OptimiseBitmap(self->pointer);
}

- (BOOL)pixelDrawnAtX:(int)x  y:(int)y
{
    BOOL result;
    result = sg_Images_PixelDrawnAtPoint(self->pointer, x, y) != 0;
    return result;
}

- (BOOL)atX:(int)x  y:(int)y  collisionWithPt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_BitmapPointPtCollision(self->pointer, x, y, &pt->data) != 0;
    return result;
}

- (BOOL)atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPt:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Physics_BitmapPartPointXYCollision(self->pointer, x, y, &part->data, &pt->data) != 0;
    return result;
}

- (BOOL)atX:(int)x  y:(int)y  collisionWithPtX:(float)ptX  y:(float)ptY
{
    BOOL result;
    result = sg_Physics_BitmapPointCollision(self->pointer, x, y, ptX, ptY) != 0;
    return result;
}

- (BOOL)atX:(int)x  y:(int)y  part:(SGRectangle *)part  collisionWithPtX:(float)ptX  y:(float)ptY
{
    BOOL result;
    result = sg_Physics_BitmapPartPointCollision(self->pointer, x, y, &part->data, ptX, ptY) != 0;
    return result;
}

- (void)popClip
{
    sg_Graphics_PopClipBmp(self->pointer);
}

- (void)pushClip:(SGRectangle *)r
{
    sg_Graphics_PushClipRectForBitmap(self->pointer, &r->data);
}

- (BOOL)collisionAtX:(int)x  y:(int)y  withRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapRectangleCollision(self->pointer, x, y, &rect->data) != 0;
    return result;
}

- (BOOL)atPt:(SGPoint2D *)pt  part:(SGRectangle *)part  collisionWithRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapPartAtPtRectCollision(self->pointer, &pt->data, &part->data, &rect->data) != 0;
    return result;
}

- (BOOL)collisionAtX:(int)x  y:(int)y  part:(SGRectangle *)part  withRect:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Physics_BitmapPartRectCollision(self->pointer, x, y, &part->data, &rect->data) != 0;
    return result;
}

- (BOOL)collisionAtX:(int)x  y:(int)y  withRectX:(int)rectX  y:(int)rectY  width:(int)rectWidth  height:(int)rectHeight
{
    BOOL result;
    result = sg_Physics_BitmapRectCollision(self->pointer, x, y, rectX, rectY, rectWidth, rectHeight) != 0;
    return result;
}

- (void)resetClip
{
    sg_Graphics_ResetClipForBitmap(self->pointer);
}

- (SGBitmap *)rotate:(float)degRot  scale:(float)scale
{
    SGBitmap * result;
    result = [SGBitmap createWithId:sg_Images_RotateScaleBitmap(self->pointer, degRot, scale)];
    return result;
}

- (void)saveToFile:(NSString *)filepath
{
    char filepath_temp[[filepath length] + 1];
    [filepath getCString:filepath_temp maxLength:[filepath length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_SaveBitmap(self->pointer, filepath_temp);
}

- (void)setCellWidth:(int)width  height:(int)height  columns:(int)columns  rows:(int)rows  count:(int)count
{
    sg_Images_BitmapSetCellDetails(self->pointer, width, height, columns, rows, count);
}

- (void)setClip:(SGRectangle *)r
{
    sg_Graphics_SetBmpClip(self->pointer, &r->data);
}

- (void)setClipX:(int)x  y:(int)y  width:(int)w  height:(int)h
{
    sg_Graphics_SetBmpClipXY(self->pointer, x, y, w, h);
}

- (void)setOpacity:(float)pct
{
    sg_Images_SetOpacity(self->pointer, pct);
}

- (void)setTransparentColor:(color)clr
{
    sg_Images_SetTransparentColor(self->pointer, clr);
}

- (void)setupForCollisions
{
    sg_Images_SetupBitmapForCollisions(self->pointer);
}

- (SGCircle *)circleCellAtPT:(SGPoint2D *)pt
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCellCircle(self->pointer, &pt->data)];
    return result;
}

- (SGCircle *)circleCellAtX:(int)x  y:(int)y
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCellCircleXY(self->pointer, x, y)];
    return result;
}

- (SGRectangle *)toRectangleForCellAtOrigin
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangleAtOrigin(self->pointer)];
    return result;
}

- (SGRectangle *)toRectangleForCellAt:(SGPoint2D *)pt
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangle(&pt->data, self->pointer)];
    return result;
}

- (SGRectangle *)toRectangleForCellAtX:(float)x  y:(float)y
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapCellRectangleXY(x, y, self->pointer)];
    return result;
}

- (SGCircle *)circleAtPt:(SGPoint2D *)pt
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCircle(self->pointer, &pt->data)];
    return result;
}

- (SGCircle *)circleAtX:(int)x  y:(int)y
{
    SGCircle * result;
    result = [SGCircle circleForData:sg_Images_BitmapCircleXY(self->pointer, x, y)];
    return result;
}

- (SGRectangle *)toRectangleAtOrigin
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectAtOrigin(self->pointer)];
    return result;
}

- (SGRectangle *)toRectangleAtX:(float)x  y:(float)y
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Images_BitmapRectXY(x, y, self->pointer)];
    return result;
}

- (BOOL)interchangableWith:(SGBitmap *)bmp2
{
    BOOL result;
    result = sg_Images_BitmapsInterchangable(self->pointer, bmp2->pointer) != 0;
    return result;
}

- (void)saveToPNG:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Images_SaveToPNG(self->pointer, filename_temp);
}

- (void)free
{
    sg_Images_FreeBitmap(&self->pointer);
}


@end
