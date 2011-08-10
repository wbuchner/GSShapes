//
//  Snowman.m
//  MyGame
//
//  Created by Wayne Buchner on 10/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Snowman.h"


@implementation Snowman

+(Snowman *) randomSnowman{
    
    Snowman *ranSnowman = [[Snowman alloc] initSnowman:[SGGraphics rgbaFloatColorRed:[SGUtils rnd] 
                                                                            green:[SGUtils rnd] 
                                                                             blue:[SGUtils rnd]
                                                                            alpha:[SGUtils rndUpto:100]] 
                                                atX:[SGUtils rnd] * [SGGraphics screenWidth] 
                                               andY:[SGUtils rnd] * [SGGraphics screenHeight] 
                                         withRadius:[SGUtils rndUpto:80]];
    return [ranSnowman autorelease];
}

-(float) x
{
    return x;
}
-(void) setX:(float)value
{
    x = value;
}

@synthesize y = y;
@synthesize rad = r;
@synthesize CircleColor = c;


-(id) initSnowman:(color)   SnowmanColor 
              atX:(float)   xPos 
             andY:(float)   yPos 
       withRadius:(int)     rad{
    
    self = [super initCircle:[SGGraphics rgbFloatColorRed:[SGUtils rnd] 
                                                     green:[SGUtils rnd] 
                                                      blue:[SGUtils rnd]]
                         atX:[SGUtils rnd] * [SGGraphics screenWidth] 
                        andY:[SGUtils rnd] * [SGGraphics screenHeight] 
                  withRadius:[SGUtils rndUpto:60]];
    
    if (self != nil)
    {
        // Snowmans Head
        int headRadius;
        float headX, headY;
        
        headRadius = r / 1.7;
        headX = x;
        headY = y - r - (r/4); 
        
        head = [[GSCircle alloc] initCircle:c atX:headX andY:headY withRadius:headRadius];
         
         NSLog(@"headRadius %d headX %f headY %f  ",headRadius, headX, headY);
        
        // Snowmans Eyes
        int eyeRadius;
        float leftEyeX, rightEyeX, EyeY;
        
        eyeRadius = headRadius / 7;
        leftEyeX = headX - (eyeRadius * 3);
        rightEyeX = headX + (eyeRadius * 3);
        EyeY = headY - (eyeRadius * 2);
        
        
        leftEye = [[GSCircle alloc] initCircle:ColorBlack atX:leftEyeX andY:EyeY withRadius:eyeRadius];
        
        
        
        
        rightEye = [[GSCircle alloc] initCircle:ColorBlack atX:rightEyeX andY:EyeY withRadius:eyeRadius];
    }
    return self;

}

-(void) draw{
    [SGGraphics fill:c circleOnScreenX:x y:y radius:r];
    [head draw];
    [leftEye draw];
    [rightEye draw];
}

-(void) dealloc
{
    [Snowman release];
    [head release];
    [super dealloc];
}
@end
