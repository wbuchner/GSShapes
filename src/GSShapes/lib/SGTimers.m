#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGTimers.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGTimers : NSObject


+ (SGTimer *)init
{
    SGTimer * result;
    result = [SGTimer createWithId:sg_Timers_CreateTimer()];
    return result;
}

+ (SGTimer *)initWithName:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGTimer * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGTimer createWithId:sg_Timers_CreateTimerNamed(name_temp)];
    return result;
}

+ (void)freeTimer:(SGTimer *)toFree
{
    sg_Timers_FreeTimer(&toFree->pointer);
}

+ (void)pauseTimer:(SGTimer *)toPause
{
    sg_Timers_PauseTimer(toPause->pointer);
}

+ (void)releaseAllTimers
{
    sg_Timers_ReleaseAllTimers();
}

+ (void)releaseTimer:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Timers_ReleaseTimer(name_temp);
}

+ (void)resetTimer:(SGTimer *)tmr
{
    sg_Timers_ResetTimer(tmr->pointer);
}

+ (void)resumeTimer:(SGTimer *)toUnpause
{
    sg_Timers_ResumeTimer(toUnpause->pointer);
}

+ (void)startTimer:(SGTimer *)toStart
{
    sg_Timers_StartTimer(toStart->pointer);
}

+ (void)stopTimer:(SGTimer *)toStop
{
    sg_Timers_StopTimer(toStop->pointer);
}

+ (SGTimer *)timerNamed:(NSString *)name
{
    char name_temp[[name length] + 1];
    SGTimer * result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = [SGTimer createWithId:sg_Timers_TimerNamed(name_temp)];
    return result;
}

+ (uint)timerTicks:(SGTimer *)toGet
{
    uint result;
    result = sg_Timers_TimerTicks(toGet->pointer);
    return result;
}









@end
