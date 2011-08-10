#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGInput.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGInput : NSObject


+ (BOOL)anyKeyPressed
{
    BOOL result;
    result = sg_Input_AnyKeyPressed() != 0;
    return result;
}

+ (NSString *)endReadingText
{
    char result[2048];
    sg_Input_EndReadingText(result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (void)hideMouse
{
    sg_Input_HideMouse();
}

+ (BOOL)keyDown:(key_code)key
{
    BOOL result;
    result = sg_Input_KeyDown((int)key) != 0;
    return result;
}

+ (NSString *)keyName:(key_code)key
{
    char result[2048];
    sg_Input_KeyName((int)key, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (BOOL)keyTyped:(key_code)key
{
    BOOL result;
    result = sg_Input_KeyTyped((int)key) != 0;
    return result;
}

+ (BOOL)mouseClicked:(mouse_button)button
{
    BOOL result;
    result = sg_Input_MouseClicked((int)button) != 0;
    return result;
}

+ (BOOL)mouseDown:(mouse_button)button
{
    BOOL result;
    result = sg_Input_MouseDown((int)button) != 0;
    return result;
}

+ (SGVector *)mouseMovement
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Input_MouseMovement()];
    return result;
}

+ (SGPoint2D *)mousePosition
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Input_MousePosition()];
    return result;
}

+ (SGVector *)mousePositionAsVector
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Input_MousePositionAsVector()];
    return result;
}

+ (BOOL)mouseShown
{
    BOOL result;
    result = sg_Input_MouseShown() != 0;
    return result;
}

+ (BOOL)mouseUp:(mouse_button)button
{
    BOOL result;
    result = sg_Input_MouseUp((int)button) != 0;
    return result;
}

+ (float)mouseX
{
    float result;
    result = sg_Input_MouseX();
    return result;
}

+ (float)mouseY
{
    float result;
    result = sg_Input_MouseY();
    return result;
}

+ (void)moveMouseToPoint:(SGPoint2D *)point
{
    sg_Input_MoveMouseToPoint(&point->data);
}

+ (void)moveMouseToX:(unsigned short)x  y:(unsigned short)y
{
    sg_Input_MoveMouse(x, y);
}

+ (void)processEvents
{
    sg_Input_ProcessEvents();
}

+ (BOOL)readingText
{
    BOOL result;
    result = sg_Input_ReadingText() != 0;
    return result;
}

+ (void)showMouse
{
    sg_Input_ShowMouse();
}

+ (void)showMouse:(BOOL)show
{
    sg_Input_SetMouseVisible((show ? 1 : 0));
}

+ (void)startReadingTextColor:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  area:(SGRectangle *)area
{
    sg_Input_StartReadingTextWithinArea(textColor, maxLength, theFont->pointer, &area->data);
}

+ (void)startReadingTextColor:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  x:(int)x  y:(int)y
{
    sg_Input_StartReadingText(textColor, maxLength, theFont->pointer, x, y);
}

+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  at:(SGPoint2D *)pt
{
    char text_temp[[text length] + 1];
    [text getCString:text_temp maxLength:[text length] + 1 encoding:NSASCIIStringEncoding];
    sg_Input_StartReadingTextWithTextAtPt(text_temp, textColor, maxLength, theFont->pointer, &pt->data);
}

+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  area:(SGRectangle *)area
{
    char text_temp[[text length] + 1];
    [text getCString:text_temp maxLength:[text length] + 1 encoding:NSASCIIStringEncoding];
    sg_Input_StartReadingTextWithTextInArea(text_temp, textColor, maxLength, theFont->pointer, &area->data);
}

+ (void)startReadingTextWith:(NSString *)text  color:(color)textColor  maxLen:(int)maxLength  font:(SGFont *)theFont  x:(int)x  y:(int)y
{
    char text_temp[[text length] + 1];
    [text getCString:text_temp maxLength:[text length] + 1 encoding:NSASCIIStringEncoding];
    sg_Input_StartReadingTextWithText(text_temp, textColor, maxLength, theFont->pointer, x, y);
}

+ (BOOL)textEntryCancelled
{
    BOOL result;
    result = sg_Input_TextEntryCancelled() != 0;
    return result;
}

+ (NSString *)textReadAsASCII
{
    char result[2048];
    sg_Input_TextReadAsASCII(result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (BOOL)windowCloseRequested
{
    BOOL result;
    result = sg_Input_WindowCloseRequested() != 0;
    return result;
}









@end
