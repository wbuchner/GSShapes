#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGCharacters.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGCharacters : NSObject


+ (SGDirectionAngles *)character:(SGCharacter *)c  angleAtIdx:(int)index
{
    SGDirectionAngles * result;
    result = [SGDirectionAngles directionAnglesForData:sg_Characters_CharacterAngleAt(c->pointer, index)];
    return result;
}

+ (int)character:(SGCharacter *)c  maxAngleAtIdx:(int)index
{
    int result;
    result = sg_Characters_CharacterAngleMaxAt(c->pointer, index);
    return result;
}

+ (int)character:(SGCharacter *)c  minAngleAtIdx:(int)index
{
    int result;
    result = sg_Characters_CharacterAngleMinAt(c->pointer, index);
    return result;
}

+ (int)characterAnglesLength:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterAnglesLength(c->pointer);
    return result;
}

+ (NSString *)characterCharacterName:(SGCharacter *)c
{
    char result[2048];
    sg_Characters_CharacterCharacterName(c->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (int)characterCurrentDirection:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterCurrentDirection(c->pointer);
    return result;
}

+ (int)characterCurrentState:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterCurrentState(c->pointer);
    return result;
}

+ (int)characterDirectionCount:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterDirectionCount(c->pointer);
    return result;
}

+ (NSArray *)characterDirections:(SGCharacter *)c
{
    int result_len = sg_Characters_CharacterDirectionCount(c->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterDirections(c->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

+ (NSString *)characterFilename:(SGCharacter *)c
{
    char result[2048];
    sg_Characters_CharacterFilename(c->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)characterName:(SGCharacter *)c
{
    char result[2048];
    sg_Characters_CharacterName(c->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (SGCharacter *)characterNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGCharacter * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGCharacter createWithId:sg_Characters_CharacterNamed(name_temp)];
    return result;
}

+ (void)character:(SGCharacter *)c  setDirection:(int)direction
{
    sg_Characters_CharacterSetCurrentDirection(c->pointer, direction);
}

+ (void)character:(SGCharacter *)c  setState:(int)state
{
    sg_Characters_CharacterSetCurrentState(c->pointer, state);
}

+ (void)character:(SGCharacter *)c  setName:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetName(c->pointer, name_temp);
}

+ (void)character:(SGCharacter *)c  setType:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetType(c->pointer, name_temp);
}

+ (void)character:(SGCharacter *)c  setValue:(int)idx  to:(float)val
{
    sg_Characters_CharacterSetValue(c->pointer, idx, val);
}

+ (void)character:(SGCharacter *)c  setValueNamed:(NSString *)name  to:(float)val
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_CharacterSetValueByName(c->pointer, name_temp, val);
}

+ (BOOL)character:(SGCharacter *)c  shownLayersAt:(int)index
{
    BOOL result;
    result = sg_Characters_CharacterShownLayersAt(c->pointer, index) != 0;
    return result;
}

+ (SGSprite *)characterSprite:(SGCharacter *)c
{
    SGSprite * result;
    result = [SGSprite createWithId:sg_Characters_CharacterSprite(c->pointer)];
    return result;
}

+ (int)characterStateCount:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterStateCount(c->pointer);
    return result;
}

+ (NSArray *)characterStates:(SGCharacter *)c
{
    int result_len = sg_Characters_CharacterStateCount(c->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterStates(c->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

+ (NSString *)characterType:(SGCharacter *)c
{
    char result[2048];
    sg_Characters_CharacterType(c->pointer, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (float)character:(SGCharacter *)c  valueAtIndex:(int)index
{
    float result;
    result = sg_Characters_CharacterValueAt(c->pointer, index);
    return result;
}

+ (int)characterValueCount:(SGCharacter *)c
{
    int result;
    result = sg_Characters_CharacterValueCount(c->pointer);
    return result;
}

+ (NSArray *)characterValueNames:(SGCharacter *)c
{
    int result_len = sg_Characters_CharacterValueCount(c->pointer);
    char * result[result_len];
    [SGStringBufferManager stringBufferManagerFor:result size:result_len];
    
    sg_Characters_CharacterValueNames(c->pointer, result, result_len);
    return [NSString arrayOfStrings:result size:result_len];
}

+ (void)drawCharacter:(SGCharacter *)c
{
    sg_Characters_DrawCharacter(c->pointer);
}

+ (void)drawCharacterSprite:(SGCharacter *)c
{
    sg_Characters_DrawCharacterSprite(c->pointer);
}

+ (void)character:(SGCharacter *)c  stationaryState:(int)stationaryState  state:(int)state
{
    sg_Characters_DrawCharacterWithStationary(c->pointer, stationaryState, state);
}

+ (void)freeCharacter:(SGCharacter *)c
{
    sg_Characters_FreeCharacter(&c->pointer);
}

+ (BOOL)hasCharacter:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Characters_HasCharacter(name_temp) != 0;
    return result;
}

+ (SGCharacter *)loadCharacter:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    SGCharacter * result;
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGCharacter createWithId:sg_Characters_LoadCharacter(filename_temp)];
    return result;
}

+ (SGCharacter *)loadCharacterNamed:(NSString *)name  fromFile:(NSString *)filename
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    SGCharacter * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGCharacter createWithId:sg_Characters_LoadCharacterNamed(name_temp, filename_temp)];
    return result;
}

+ (void)releaseAllCharacters
{
    sg_Characters_ReleaseAllCharacters();
}

+ (void)releaseCharacter:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Characters_ReleaseCharacter(name_temp);
}

+ (void)setActiveLayer:(SGCharacter *)c
{
    sg_Characters_SetActiveLayer(c->pointer);
}

+ (void)character:(SGCharacter *)c  idx:(int)index
{
    sg_Characters_ToggleLayerVisibility(c->pointer, index);
}

+ (BOOL)updateDirectionAnimation:(SGCharacter *)c
{
    BOOL result;
    result = sg_Characters_UpdateDirectionAnimation(c->pointer) != 0;
    return result;
}

+ (BOOL)character:(SGCharacter *)c  stationaryState:(int)state  newState:(int)newState
{
    BOOL result;
    result = sg_Characters_UpdateDirectionAnimationWithStationary(c->pointer, state, newState) != 0;
    return result;
}









@end
