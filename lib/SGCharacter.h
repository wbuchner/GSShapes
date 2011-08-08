#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "PointerManager.h"


@interface SGCharacter : NSObject <PointerWrapper>
{
@package
    character pointer;
}

+ (NSArray *) arrayOfCharacters:(character *)firstPtr size:(int)sz;
+ (void) getCharacters:(character *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;
+ (id)createWithId:(character)ptr;

- (id)initWithId:(character)ptr; 

- (id)initFromFile:(NSString *)filename;
- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename;


#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int angleLength;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) SGSprite * charSprite;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) NSString * characterType;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int currentDirection;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) int currentState;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int directionCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * directions;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSString * filename;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readwrite) NSString * name;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int stateCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * states;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) int valueCount;
#endif;
#if OBJC_NEW_PROPERTIES
@property (assign, readonly ) NSArray * valueNames;
#endif;


#if OBJC_NEW_PROPERTIES != 1
- (int)angleLength;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (SGSprite *)charSprite;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)characterType;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCharacterType:(NSString *)name;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)currentDirection;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCurrentDirection:(int)direction;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)currentState;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setCurrentState:(int)state;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)directionCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)directions;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)filename;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSString *)name;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (void)setName:(NSString *)name;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)stateCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)states;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (int)valueCount;
#endif
#if OBJC_NEW_PROPERTIES != 1
- (NSArray *)valueNames;
#endif
- (void)activeLayer;
- (SGDirectionAngles *)angleAt:(int)index;
- (int)angleMaxAt:(int)index;
- (int)angleMinAt:(int)index;
- (void)centerCameraOffset:(SGVector *)offset;
- (void)drawCharacter;
- (void)drawCharacterSprite;
- (void)stationaryState:(int)stationaryState  state:(int)state;
- (BOOL)layerShownAt:(int)index;
- (void)setValueNamed:(NSString *)name  to:(float)val;
- (void)setValue:(int)idx  to:(float)val;
- (void)toggleVisibility:(int)index;
- (BOOL)updateDirectionAnimation;
- (BOOL)stationaryState:(int)state  newState:(int)newState;
- (float)valueAtIndex:(int)index;
- (void)free;
@end
