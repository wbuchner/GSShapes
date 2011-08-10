#import "SGFont.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGFont : NSObject

+ (void) getFonts:(font *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGFont *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfFonts:(font *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGFont *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGFont createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(font)ptr
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

- (id)initWithId:(font)ptr
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



- (id)initWithFontName:(NSString *)fontName  andSize:(int)size
{
    char fontName_temp[[fontName length] + 1];
    SGFont * result;
    [fontName getCString:fontName_temp maxLength:[fontName length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Text_LoadFont(fontName_temp, size)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename  size:(int)size
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGFont * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Text_LoadFontNamed(name_temp, filename_temp, size)];
    return result;
}



@dynamic fontStyle;


- (font_style)fontStyle
{
    font_style result;
    result = (font_style)sg_Text_FontFontStyle(self->pointer);
    return result;
}

- (void)setFontStyle:(font_style)value
{
    sg_Text_FontSetStyle(self->pointer, (int)value);
}

- (int)textHeight:(NSString *)theText
{
    char theText_temp[[theText length] + 1];
    int result;
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Text_TextHeight(self->pointer, theText_temp);
    return result;
}

- (int)textWidth:(NSString *)theText
{
    char theText_temp[[theText length] + 1];
    int result;
    [theText getCString:theText_temp maxLength:[theText length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Text_TextWidth(self->pointer, theText_temp);
    return result;
}

- (void)free
{
    sg_Text_FreeFont(&self->pointer);
}


@end
