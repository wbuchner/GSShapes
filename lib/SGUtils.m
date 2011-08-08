#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGUtils.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGUtils : NSObject


+ (void)calculateFramerateAvg:(NSString **)average  high:(NSString **)highest  low:(NSString **)lowest  color:(color *)textColor
{
    char average_temp[2048];
    char highest_temp[2048];
    char lowest_temp[2048];
    sg_Utils_CalculateFramerate(average_temp, highest_temp, lowest_temp, textColor);
    *lowest = [[[NSString alloc] initWithCString:lowest_temp encoding:NSASCIIStringEncoding] autorelease];
    *highest = [[[NSString alloc] initWithCString:highest_temp encoding:NSASCIIStringEncoding] autorelease];
    *average = [[[NSString alloc] initWithCString:average_temp encoding:NSASCIIStringEncoding] autorelease];
}

+ (void)delay:(uint)time
{
    sg_Utils_Delay(time);
}

+ (NSString *)exceptionMessage
{
    char result[2048];
    sg_Utils_ExceptionMessage(result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (BOOL)exceptionOccured
{
    BOOL result;
    result = sg_Utils_ExceptionOccured() != 0;
    return result;
}

+ (int)getFramerate
{
    int result;
    result = sg_Utils_GetFramerate();
    return result;
}

+ (uint)getTicks
{
    uint result;
    result = sg_Utils_GetTicks();
    return result;
}

+ (float)rnd
{
    float result;
    result = sg_Utils_Rnd();
    return result;
}

+ (int)rndUpto:(int)ubound
{
    int result;
    result = sg_Utils_RndUpto(ubound);
    return result;
}

+ (NSString *)swinGameVersion
{
    char result[2048];
    sg_Utils_SwinGameVersion(result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}









@end
