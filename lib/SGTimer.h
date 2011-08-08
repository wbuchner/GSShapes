#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGTimer : NSObject <PointerWrapper>
{
@package
    timer pointer;
}

+ (NSArray *) arrayOfTimers:(timer *)firstPtr size:(int)sz;
+ (void) getTimers:(timer *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(timer)ptr;

- (id)initWithId:(timer)ptr; 

- (id)timer;
- (id)timer:(NSString *)name;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) uint ticks;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (uint)ticks;
#endif
- (void)pause;
- (void)reset;
- (void)resume;
- (void)start;
- (void)stop;
- (void)free;
@end
