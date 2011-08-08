#import "SGBitmapCell.h"

#import <Foundation/NSInvocation.h>

#import "PointerManager.h"
#import "SGSDK.h"
#import "SwinGame.h"

@interface SGBitmapCell ( Private )
- (id) init;
@end

@implementation SGWrappedBitmapCell : SGBitmapCell

+ (SGWrappedBitmapCell *) bitmapCellWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    SGWrappedBitmapCell *ret = [[SGWrappedBitmapCell alloc] initBitmapCellWithDelegate:del update:sel1 andRead:sel2];
    [ret autorelease];
    return ret;
}

- (id)initBitmapCellWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2
{
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        call_on_update = sel1;
        call_on_read   = sel2;
        delegate       = del;
        
        [delegate retain];
    }
    return self;
}

- (void) dealloc
{
    [delegate release];
    [super dealloc];
}

- (void) callUpdate
{
    if (delegate == nil || call_on_update == nil) return;
    
    NSMethodSignature *sig = [self methodSignatureForSelector:call_on_update];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature: sig];
    [inv setArgument:&self atIndex:2]; //first arg after self + _cmd (for call)
    [inv invokeWithTarget: delegate]; //call on the delegate
}

- (void) callRead
{
    if (delegate == nil || call_on_read == nil) return;
    
    NSMethodSignature *sig = [self methodSignatureForSelector:call_on_read];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature: sig];
    [inv invokeWithTarget: delegate]; //call on the delegate
    
    SGBitmapCell *ret;
    [inv getReturnValue: &ret];
    data = ret->data;
}


- (int)height
{
    [self callRead];
    int result;
    result = sg_Images_BitmapHeightForCell(&self->data);
    return result;
}

- (int)width
{
    [self callRead];
    int result;
    result = sg_Images_BitmapWidthForCell(&self->data);
    return result;
}

- (int)cell
{
    [self callRead];
    int result;
    result = data.cell;
    return result;
}

- (void)setCell:(int)value
{
    data.cell = value;
    [self callUpdate];
}

- (SGBitmap *)bmp
{
    [self callRead];
    SGBitmap * result;
    result = [SGBitmap createWithId:data.bmp];
    return result;
}

- (void)setBmp:(SGBitmap *)value
{
    data.bmp = value->pointer;
    [self callUpdate];
}


@end


@implementation SGBitmapCell ( Private )

- (id) init
{
    return [super init];
}

@end


@implementation SGBitmapCell : NSObject

//
// Update the BitmapCell objects in the NSArray arr from the array pointed to by firstPtr.
// This is used to restore data to objects after calling a SwinGame method.
//
+ (void) updateBitmapCellsIn:(NSArray *)arr fromDataIn:(bitmap_cell *)firstPtr size:(int)sz
{
    int i;
    SGBitmapCell *current;
    
    for (i = 0; i < [arr count]; i++)
    {
        current = (SGBitmapCell *)[arr objectAtIndex: i];
        [current setData: *(firstPtr + i)];
    }
}

+ (NSArray *) arrayOfBitmapCells:(bitmap_cell *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGBitmapCell *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [[SGBitmapCell alloc] initWithBitmapCell: *(firstPtr + i)];
        [result addObject: obj];
        [obj release];
    }
    
    return [result autorelease];
}

+ (SGBitmapCell *) bitmapCellForData: (bitmap_cell)dat
{
    SGBitmapCell *ret = [[SGBitmapCell alloc] initWithBitmapCell: dat];
    [ret autorelease];
    return ret;
}

+ (void) getBitmapCells:(bitmap_cell *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        *(firstPtr + i) = [((SGBitmapCell *)[arr objectAtIndex: i]) data];
    }
}

- (SGBitmapCell *)initWithBitmapCell:(bitmap_cell)dat
{
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        data = dat;
    }
    return self;
}

- (bitmap_cell) data
{
    return data;
}

- (void) setData:(bitmap_cell)dat
{
    data = dat;
}




@dynamic height;
@dynamic width;
@dynamic cell;
@dynamic bmp;




- (int)height
{
    int result;
    result = sg_Images_BitmapHeightForCell(&self->data);
    return result;
}

- (int)width
{
    int result;
    result = sg_Images_BitmapWidthForCell(&self->data);
    return result;
}

- (void)drawAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPoint(&self->data, &position->data);
}

- (void)drawAtX:(float)x  y:(float)y
{
    sg_Images_DrawBitmapCell(&self->data, x, y);
}

- (void)drawOnScreenAt:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPointOnScreen(&self->data, &position->data);
}

- (void)drawOnScreenAtX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapCellOnScreen(&self->data, x, y);
}

- (void)drawOnto:(SGBitmap *)dest  at:(SGPoint2D *)position
{
    sg_Images_DrawBitmapCellAtPointOnto(dest->pointer, &self->data, &position->data);
}

- (void)drawOnto:(SGBitmap *)dest  atX:(int)x  y:(int)y
{
    sg_Images_DrawBitmapCellOnto(dest->pointer, &self->data, x, y);
}

- (BOOL)sameAs:(SGBitmapCell *)bmp2
{
    BOOL result;
    result = sg_Images_SameBitmapCell(&self->data, &bmp2->data) != 0;
    return result;
}

- (int)cell
{
    int result;
    result = data.cell;
    return result;
}

- (void)setCell:(int)value
{
    data.cell = value;
}

- (SGBitmap *)bmp
{
    SGBitmap * result;
    result = [SGBitmap createWithId:data.bmp];
    return result;
}

- (void)setBmp:(SGBitmap *)value
{
    data.bmp = value->pointer;
}


@end

