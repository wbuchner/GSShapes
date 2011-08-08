#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGAnimationScript : NSObject <PointerWrapper>
{
@package
    animation_script pointer;
}

+ (NSArray *) arrayOfAnimationScripts:(animation_script *)firstPtr size:(int)sz;
+ (void) getAnimationScripts:(animation_script *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(animation_script)ptr;

- (id)initWithId:(animation_script)ptr; 

- (id)initFromFile:(NSString *)filename;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename;




- (int)indexOfAnimation:(NSString *)name;
- (NSString *)nameOfAnimation:(int)idx;
- (void)free;
@end
