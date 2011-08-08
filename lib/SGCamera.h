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


@interface SGCamera : NSObject
{
  
}

+ (SGPoint2D *)position;
+ (void)setPosition:(SGPoint2D *)pt;
+ (SGRectangle *)screenRect;
+ (float)x;
+ (void)setX:(float)x;
+ (float)y;
+ (void)setY:(float)y;
+ (void)centerCameraOnCharacter:(SGCharacter *)c  offset:(SGVector *)offset;
+ (void)centerCameraOnSprite:(SGSprite *)s  offset:(SGVector *)offset;
+ (void)centerCameraOnSprite:(SGSprite *)s  offsetX:(int)offsetX  offsetY:(int)offsetY;
+ (void)moveCameraBy:(SGVector *)offset;
+ (void)moveCameraByX:(float)dx  y:(float)dy;
+ (void)moveCameraTo:(SGPoint2D *)pt;
+ (void)moveCaneraToX:(float)x  y:(float)y;
+ (BOOL)pointOnScreen:(SGPoint2D *)pt;
+ (BOOL)rectOnScreen:(SGRectangle *)rect;
+ (SGPoint2D *)toScreen:(SGPoint2D *)worldPoint;
+ (SGRectangle *)toScreenRect:(SGRectangle *)rect;
+ (int)toScreenX:(float)worldX;
+ (int)toScreenY:(float)worldY;
+ (SGPoint2D *)toWorld:(SGPoint2D *)screenPoint;
+ (float)toWorldX:(int)screenX;
+ (float)toWorldY:(int)screenY;








@end

