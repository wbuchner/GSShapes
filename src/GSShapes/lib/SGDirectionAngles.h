#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGDirectionAngles : NSObject
{
@package
    direction_angles data;
}

+ (void) updateDirectionAnglessIn:(NSArray *)arr fromDataIn:(direction_angles *)firstPtr size:(int)sz;
+ (NSArray *) arrayOfDirectionAngless:(direction_angles *)firstPtr size:(int)sz;
+ (void) getDirectionAngless:(direction_angles *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz;

+ (SGDirectionAngles *) directionAnglesForData: (direction_angles)dat;

- (SGDirectionAngles *)initWithDirectionAngles:(direction_angles)dat;

- (direction_angles) data;
- (void) setData:(direction_angles)dat;






#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int max;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int min;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (int)max;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setMax:(int)value;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)min;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setMin:(int)value;
#endif

@end

@interface SGWrappedDirectionAngles : SGDirectionAngles
{
@package
    id       delegate;
    SEL      call_on_update;
    SEL      call_on_read;
}

+ (SGWrappedDirectionAngles *) directionAnglesWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;
- (id) initDirectionAnglesWithDelegate:(id)del update:(SEL)sel1 andRead:(SEL)sel2;

@end

