#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGFont : NSObject <PointerWrapper>
{
@package
    font pointer;
}

+ (NSArray *) arrayOfFonts:(font *)firstPtr size:(int)sz;
+ (void) getFonts:(font *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(font)ptr;

- (id)initWithId:(font)ptr; 

- (id)initWithFontName:(NSString *)fontName  andSize:(int)size;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename  size:(int)size;


#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) font_style fontStyle;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (font_style)fontStyle;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setFontStyle:(font_style)value;
#endif
- (int)textHeight:(NSString *)theText;
- (int)textWidth:(NSString *)theText;
- (void)free;
@end
