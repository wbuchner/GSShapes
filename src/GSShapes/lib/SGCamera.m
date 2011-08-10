#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGCamera.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGCamera : NSObject


+ (SGPoint2D *)position
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Camera_CameraPos()];
    return result;
}

+ (void)setPosition:(SGPoint2D *)pt
{
    sg_Camera_SetCameraPos(&pt->data);
}

+ (SGRectangle *)screenRect
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Camera_CameraScreenRect()];
    return result;
}

+ (float)x
{
    float result;
    result = sg_Camera_CameraX();
    return result;
}

+ (void)setX:(float)x
{
    sg_Camera_SetCameraX(x);
}

+ (float)y
{
    float result;
    result = sg_Camera_CameraY();
    return result;
}

+ (void)setY:(float)y
{
    sg_Camera_SetCameraY(y);
}

+ (void)centerCameraOnCharacter:(SGCharacter *)c  offset:(SGVector *)offset
{
    sg_Camera_CenterCameraOnCharacter(c->pointer, &offset->data);
}

+ (void)centerCameraOnSprite:(SGSprite *)s  offset:(SGVector *)offset
{
    sg_Camera_CenterCameraOn(s->pointer, &offset->data);
}

+ (void)centerCameraOnSprite:(SGSprite *)s  offsetX:(int)offsetX  offsetY:(int)offsetY
{
    sg_Camera_CenterCameraOnWithXYOffset(s->pointer, offsetX, offsetY);
}

+ (void)moveCameraBy:(SGVector *)offset
{
    sg_Camera_MoveCameraBy(&offset->data);
}

+ (void)moveCameraByX:(float)dx  y:(float)dy
{
    sg_Camera_MoveCameraByXY(dx, dy);
}

+ (void)moveCameraTo:(SGPoint2D *)pt
{
    sg_Camera_MoveCameraTo(&pt->data);
}

+ (void)moveCaneraToX:(float)x  y:(float)y
{
    sg_Camera_MoveCameraToXY(x, y);
}

+ (BOOL)pointOnScreen:(SGPoint2D *)pt
{
    BOOL result;
    result = sg_Camera_PointOnScreen(&pt->data) != 0;
    return result;
}

+ (BOOL)rectOnScreen:(SGRectangle *)rect
{
    BOOL result;
    result = sg_Camera_RectOnScreen(&rect->data) != 0;
    return result;
}

+ (SGPoint2D *)toScreen:(SGPoint2D *)worldPoint
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Camera_ToScreen(&worldPoint->data)];
    return result;
}

+ (SGRectangle *)toScreenRect:(SGRectangle *)rect
{
    SGRectangle * result;
    result = [SGRectangle rectangleForData:sg_Camera_ToScreenRect(&rect->data)];
    return result;
}

+ (int)toScreenX:(float)worldX
{
    int result;
    result = sg_Camera_ToScreenX(worldX);
    return result;
}

+ (int)toScreenY:(float)worldY
{
    int result;
    result = sg_Camera_ToScreenY(worldY);
    return result;
}

+ (SGPoint2D *)toWorld:(SGPoint2D *)screenPoint
{
    SGPoint2D * result;
    result = [SGPoint2D point2DForData:sg_Camera_ToWorld(&screenPoint->data)];
    return result;
}

+ (float)toWorldX:(int)screenX
{
    float result;
    result = sg_Camera_ToWorldX(screenX);
    return result;
}

+ (float)toWorldY:(int)screenY
{
    float result;
    result = sg_Camera_ToWorldY(screenY);
    return result;
}









@end
