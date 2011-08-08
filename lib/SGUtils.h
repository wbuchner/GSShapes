#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "SGPoint2D.h"
#import "SGVector.h"
#import "SGRectangle.h"
#import "SGCircle.h"
#import "SGLineSegment.h"
#import "SGTriangle.h"
#import "SGSoundEffect.h"
#import "SGMusic.h"
#import "SGMatrix2D.h"
#import "SGAnimationScript.h"
#import "SGAnimation.h"
#import "SGBitmap.h"
#import "SGBitmapCell.h"
#import "SGSprite.h"
#import "SGTimer.h"
#import "SGFont.h"
#import "SGDirectionAngles.h"
#import "SGCharacter.h"


@interface SGUtils : NSObject
{
  
}

+ (void)calculateFramerateAvg:(NSString **)average  high:(NSString **)highest  low:(NSString **)lowest  color:(color *)textColor;
+ (void)delay:(uint)time;
+ (NSString *)exceptionMessage;
+ (BOOL)exceptionOccured;
+ (int)getFramerate;
+ (uint)getTicks;
+ (float)rnd;
+ (int)rndUpto:(int)ubound;
+ (NSString *)swinGameVersion;








@end

