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


@interface SGInput : NSObject
{
  
}

+ (BOOL)anyKeyPressed;
+ (NSString *)endReadingText;
+ (void)hideMouse;
+ (BOOL)keyDown:(key_code)key;
+ (NSString *)keyName:(key_code)key;
+ (BOOL)keyTyped:(key_code)key;
+ (BOOL)mouseClicked:(mouse_button)button;
+ (BOOL)mouseDown:(mouse_button)button;
+ (SGVector *)mouseMovement;
+ (SGPoint2D *)mousePosition;
+ (SGVector *)mousePositionAsVector;
+ (BOOL)mouseShown;
+ (BOOL)mouseUp:(mouse_button)button;
+ (float)mouseX;
+ (float)mouseY;
+ (void)moveMouseToPoint:(SGPoint2D *)point;
+ (void)moveMouseToX:(unsigned short)x  y:(unsigned short)y;
+ (void)processEvents;
+ (BOOL)readingText;
+ (void)showMouse;
+ (void)showMouse:(BOOL)show;
+ (void)startReadingTextColor:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  area:(SGRectangle *)area;
+ (void)startReadingTextColor:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  x:(int)x  y:(int)y;
+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  at:(SGPoint2D *)pt;
+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  area:(SGRectangle *)area;
+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  x:(int)x  y:(int)y;
+ (BOOL)textEntryCancelled;
+ (NSString *)textReadAsASCII;
+ (BOOL)windowCloseRequested;








@end

