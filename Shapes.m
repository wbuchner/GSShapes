//
//  Shapes.m
//  MyGame
//
//  Created by Wayne Buchner on 26/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Shapes.h"

@implementation GSShape
    @synthesize y;
    @synthesize width = w, height = h, shape_color = c;

-(id) initShape:(color) startColor 
            atX:(float) startX 
           andY:(float) startY 
      withWidth:(int)   startW 
      andHeight:(int)   startH
{
    self = [super init];
    if (self !=nil)
    {
        x = startX;
        y = startY;
        c = startColor;
        w = startW;
        h = startH;
    }
    return self; 
}

@end



@implementation GSRectangle

+(GSRectangle *) randomRectangle
{
    GSRectangle *ranRect = [[GSRectangle alloc] initRectangle:[SGGraphics rgbFloatColorRed:[SGUtils rnd] 
                                                                                     green:[SGUtils rnd] 
                                                                                      blue:[SGUtils rnd]] 
                                                          atX:[SGUtils rnd] * [SGGraphics screenWidth] 
                                                         andY:[SGUtils rnd] * [SGGraphics screenHeight] 
                                                    withWidth:[SGUtils rndUpto:200] 
                                                    andHeight:[SGUtils rndUpto:200]];    
    
    
return [ranRect autorelease];                   
                                               

}


-(float) x
{
    return x;
}

-(void) setX:(float)value{
    x = value;
}



-(id) initRectangle:(color) startColor 
                atX:(float) startX 
               andY:(float) startY 
          withWidth:(int)startW 
          andHeight:(int)startH
{
    self = [super initShape:startColor
                        atX:startX 
                       andY:startY 
                  withWidth:startW 
                  andHeight:startH ];
       return self;
}

-(void) draw
{
    [SGGraphics fill:c rectangleX:x y:y width:w height:h];
}

@end

@implementation GSEllipse

+(GSEllipse *) randomEllipse
{
    GSEllipse *ranEllipse = [[GSEllipse alloc] initEllipse:[SGGraphics rgbFloatColorRed:[SGUtils rnd] 
                                                                                  green:[SGUtils rnd] 
                                                                                   blue:[SGUtils rnd]] 
                                                       atX:[SGUtils rnd] * [SGGraphics screenWidth] 
                                                      andY:[SGUtils rnd] * [SGGraphics screenHeight] 
                                                 withWidth:[SGUtils rndUpto:200] 
                                                 andHeight:[SGUtils rndUpto:200]]; 
   
    return [ranEllipse autorelease]; 
}

-(float) x
{
    return x;
}

-(void) setX:(float)value{
    x = value;
}


-(id) initEllipse:(color) startColor 
              atX:(float) startX 
             andY:(float) startY 
        withWidth:(int)startW 
        andHeight:(int)startH
{
    self = [super initShape:startColor
                        atX:startX 
                       andY:startY 
                  withWidth:startW 
                  andHeight:startH ];
    return self;
}

-(void) draw
{
    [SGGraphics fill:c ellipseOnScreenX:x y:y width:w height:h];
}
-(void) drawAtX:(float)xOffset andY:(float):yOffset
{
    [SGGraphics fill:c ellipseOnScreenX:x y:y width:w height:h];
}
@end

@implementation GSLine

+(GSLine *) randomLine
{
    GSLine *ranLine = [[GSLine alloc] initLine:[SGGraphics randomColor] 
                                     xPosStart:[SGUtils rnd] * [SGGraphics screenWidth] 
                                     yPosStart:[SGUtils rnd] * [SGGraphics screenHeight] 
                                       xPosEnd:[SGUtils rnd] * [SGGraphics screenWidth] 
                                       yPosEnd:[SGUtils rnd] * [SGGraphics screenHeight]];

    return [ranLine autorelease];
}

-(float) xPosStart
{
    return xPosStart;
}

-(void) setLine:(float)value
{
    xPosStart = value;
}

@synthesize yStart = yPosStart, yEnd = yPosEnd, xStart = xPosStart, xEnd = xPosEnd, line_color = c;

-(id) initLine:(color) line_color 
     xPosStart:(float) xStart 
     yPosStart:(float) yStart 
       xPosEnd:(float) xEnd 
       yPosEnd:(float) yEnd
{
    self = [super init];
    if (self !=nil)
    {
        [self setXStart: xStart];
        self.yStart = yStart;
        self.yEnd = yEnd;
        self.xEnd = xEnd;
        self.line_color = line_color;

    }
    return self;
}

-(void) draw{
    [SGGraphics draw:[SGGraphics randomColor] lineX1:xPosStart y1:yPosStart x2:xPosEnd y2:yPosEnd];
}

@end