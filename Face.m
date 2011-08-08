//
//  Face.m
//  MyGame
//
//  Created by Wayne Buchner on 7/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Face.h"

@implementation GSFace

+(GSFace *) randomFace
{
    GSFace *ranFace = [[GSFace alloc] initFace:[SGGraphics rgbFloatColorRed:[SGUtils rnd] 
                                                                      green:[SGUtils rnd] 
                                                                       blue:[SGUtils rnd]] 
                                                       atX:[SGUtils rnd] * [SGGraphics screenWidth] 
                                                      andY:[SGUtils rnd] * [SGGraphics screenHeight] 
                                                 withWidth:[SGUtils rndUpto:200] 
                                                 andHeight:[SGUtils rndUpto:200]]; 
    
    return [ranFace autorelease]; 
}

-(float) x
{
    return x;
}

-(void) setX:(float)value{
    x = value;
}


-(id) initFace:(color) startColor 
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
    
    
    if (self !=nil)
    {
        float lx, rx, eyeY;
        int eyeW;
        
        eyeW = startW /6;
        lx= startW /3 - eyeW /2;
        rx =2 * startW / 3 - eyeW /2;
        eyeY = startH /3;
        
        leftEye = [[GSEllipse alloc] initEllipse:ColorWhite 
                                             atX:lx 
                                            andY:eyeY 
                                       withWidth:eyeW 
                                       andHeight:eyeW];
        
        rightEye = [[GSEllipse alloc] initEllipse:ColorWhite 
                                             atX:rx 
                                            andY:eyeY 
                                       withWidth:eyeW 
                                       andHeight:eyeW];
        
        float mx, my;
        int mW, mH;
        
        mx = lx;
        my = 2 * h/3;
        mW = w / 3 + eyeW;
        mH = h / 8;
        
        mouth = [[GSRectangle alloc] initRectangle:ColorRed 
                                               atX:mx 
                                              andY:my 
                                         withWidth:mW 
                                         andHeight:mH];
    }
    
    return self;
}
-(void) dealloc
{
    [mouth release];
    [leftEye release];
    [rightEye release];
    
    [super dealloc];
}

-(void) draw
{
    [SGGraphics fill:c ellipseOnScreenX:x y:y width:w height:h];
    [leftEye drawAtX: x andY:y];
    [rightEye drawAtX: x andY: y];
    [mouth drawAtX: x andY:y];
}

@end
