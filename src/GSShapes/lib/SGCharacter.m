#import "SGCharacter.h"

#import <stdlib.h>

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGCharacter : NSObject

+ (void) getCharacters:(character *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz
{
    int i;
    int count = [in_data count];
    count = count <= sz ? count : sz; //get min of sz and count
    for ( i = 0; i < count; i++ ) 
    {
        SGCharacter *obj = [in_data objectAtIndex:i];
        *(firstPtr + i) = obj->pointer;
    }
}

+ (NSArray *) arrayOfCharacters:(character *)firstPtr size:(int)sz
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:sz];
    int i;
    SGCharacter *obj;
    
    for (i = 0; i < sz; i++)
    {
        obj = [SGCharacter createWithId: *(firstPtr + i)];
        [result addObject: obj];
    }
    
    return [result autorelease];
}

+ (id)createWithId:(character)ptr
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

- (id)initWithId:(character)ptr
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



- (id)initFromFile:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGCharacter * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Characters_LoadCharacter(filename_temp)];
    return result;
}

- (id)initWithName:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGCharacter * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [self initWithId: sg_Characters_LoadCharacterNamed(name_temp, filename_temp)];
    return result;
}



@dynamic angleLength;
@dynamic charSprite;
@dynamic characterType;
@dynamic currentDirection;
@dynamic currentState;
@dynamic directionCount;
@dynamic directions;
@dynamic filename;
@dynamic name;
@dynamic stateCount;
@dynamic states;
@dynamic valueCount;
@dynamic valueNames;


- (int)angleLength
{
    int result;
    result = sg_Characters_CharacterAnglesLength(self->pointer);
    return result;
}

- (SGSprite *)charSprite
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Characters_CharacterSprite(self->pointer)];
    return result;
}

- (NSString *)characterType
{
    char result[2048];
    sg_Characters_CharacterType(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (void)setCharacterType:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetType(self->pointer, name_temp);
}

- (int)currentDirection
{
    int result;
    result = sg_Characters_CharacterCurrentDirection(self->pointer);
    return result;
}

- (void)setCurrentDirection:(int)direction
{
    sg_Characters_CharacterSetCurrentDirection(self->pointer, direction);
}

- (int)currentState
{
    int result;
    result = sg_Characters_CharacterCurrentState(self->pointer);
    return result;
}

- (void)setCurrentState:(int)state
{
    sg_Characters_CharacterSetCurrentState(self->pointer, state);
}

- (int)directionCount
{
    int result;
    result = sg_Characters_CharacterDirectionCount(self->pointer);
    return result;
}

- (NSArray *)directions
{
    int result_len = sg_Characters_CharacterDirectionCount(self->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterDirections(self->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

- (NSString *)filename
{
    char result[2048];
    sg_Characters_CharacterFilename(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (NSString *)name
{
    char result[2048];
    sg_Characters_CharacterName(self->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

- (void)setName:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetName(self->pointer, name_temp);
}

- (int)stateCount
{
    int result;
    result = sg_Characters_CharacterStateCount(self->pointer);
    return result;
}

- (NSArray *)states
{
    int result_len = sg_Characters_CharacterStateCount(self->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterStates(self->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

- (int)valueCount
{
    int result;
    result = sg_Characters_CharacterValueCount(self->pointer);
    return result;
}

- (NSArray *)valueNames
{
    int result_len = sg_Characters_CharacterValueCount(self->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterValueNames(self->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

- (void)activeLayer
{
    sg_Characters_SetActiveLayer(self->pointer);
}

- (SGDirectionAngles *)angleAt:(int)index
{
    SGDirectionAngles * result;
    result = [SGDirectionAngles directionAnglesForData:sg_Characters_CharacterAngleAt(self->pointer, index)];
    return result;
}

- (int)angleMaxAt:(int)index
{
    int result;
    result = sg_Characters_CharacterAngleMaxAt(self->pointer, index);
    return result;
}

- (int)angleMinAt:(int)index
{
    int result;
    result = sg_Characters_CharacterAngleMinAt(self->pointer, index);
    return result;
}

- (void)centerCameraOffset:(SGVector *)offset
{
    sg_Camera_CenterCameraOnCharacter(self->pointer, &offset->data);
}

- (void)drawCharacter
{
    sg_Characters_DrawCharacter(self->pointer);
}

- (void)drawCharacterSprite
{
    sg_Characters_DrawCharacterSprite(self->pointer);
}

- (void)stationaryState:(int)stationaryState  state:(int)state
{
    sg_Characters_DrawCharacterWithStationary(self->pointer, stationaryState, state);
}

- (BOOL)layerShownAt:(int)index
{
    BOOL result;
    result = sg_Characters_CharacterShownLayersAt(self->pointer, index) != 0;
    return result;
}

- (void)setValueNamed:(NSString *)name  to:(float)val
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetValueByName(self->pointer, name_temp, val);
}

- (void)setValue:(int)idx  to:(float)val
{
    sg_Characters_CharacterSetValue(self->pointer, idx, val);
}

- (void)toggleVisibility:(int)index
{
    sg_Characters_ToggleLayerVisibility(self->pointer, index);
}

- (BOOL)updateDirectionAnimation
{
    BOOL result;
    result = sg_Characters_UpdateDirectionAnimation(self->pointer) != 0;
    return result;
}

- (BOOL)stationaryState:(int)state  newState:(int)newState
{
    BOOL result;
    result = sg_Characters_UpdateDirectionAnimationWithStationary(self->pointer, state, newState) != 0;
    return result;
}

- (float)valueAtIndex:(int)index
{
    float result;
    result = sg_Characters_CharacterValueAt(self->pointer, index);
    return result;
}

- (void)free
{
    sg_Characters_FreeCharacter(&self->pointer);
}


@end
