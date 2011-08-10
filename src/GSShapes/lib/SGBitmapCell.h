#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGBitmapCell : NSObject
{
@package
    bitmap_cell data;
}

+ (void) updateBitmapCellsIn:(NSArray *)arr fromDataIn:(bitmap_cell *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfBitmapCells:(bitmap_cell *)firstPtr size:(int)sz;
+ (void) getBitmapCells:(bitmap_cell *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGBitmapCell *) bitmapCellForData: (bitmap_cell)dat;

- (SGBitmapCell *)initWithBitmapCell:(bitmap_cell)dat;

- (bitmap_cell) data;
- (void) setData:(bitmap_cell)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int height;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int width;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int cell;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) SGBitmap * bmp;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (int)height;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)width;
#endif
- (void)drawAt:(SGPoint2D *)position;
- (void)drawAtX:(float)x  y:(float)y;
- (void)drawOnScreenAt:(SGPoint2D *)position;
- (void)drawOnScreenAtX:(int)x  y:(int)y;
- (void)drawOnto:(SGBitmap *)dest  at:(SGPoint2D *)position;
- (void)drawOnto:(SGBitmap *)dest  atX:(int)x  y:(int)y;
- (BOOL)sameAs:(SGBitmapCell *)bmp2;
#if OBJC_NEW_PROPERTIES != 1
- (int)cell;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCell:(int)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGBitmap *)bmp;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setBmp:(SGBitmap *)value;
#endif

@end

@interface SGWrappedBitmapCell : SGBitmapCell
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedBitmapCell *) bitmapCellWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initBitmapCellWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

