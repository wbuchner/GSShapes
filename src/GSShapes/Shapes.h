//
//  Shapes.h
//  MyGame
//
//  Created by Wayne Buchner on 26/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import "Swingame.h"

@interface GSShape : NSObject {
    float x,y;
    int w,h;
    color c;
}

-(id) initShape:(color) startColor 
                atX:(float) startX 
               andY:(float) startY 
          withWidth:(int)   startW 
          andHeight:(int)   startH;

//@property (assign) float x;
@property (assign) float y;
@property (assign) int width;
@property (assign) int height;
@property (assign) color shape_color;

@end


@interface GSRectangle : GSShape{

}


-(float) x;
-(void) setX:(float)value;

+(GSRectangle *) randomRectangle;

-(id) initRectangle:(color) shape_color atX:(float) x andY:(float) y withWidth:(int)w andHeight:(int)h;

-(void) draw;
-(void) drawAtX:(float)xOffset andY:(float)yOffset; 

@end

@interface GSEllipse : GSShape{

}


-(float) x;
-(void) setX:(float)value;


+(GSEllipse *) randomEllipse;

-(id) initEllipse:(color) shape_color atX:(float) x andY:(float) y withWidth:(int)w andHeight:(int)h;

-(void) draw;
-(void) drawAtX:(float)xOffset andY:(float)yOffset;

@end


@interface GSLine : NSObject {
    float xPosStart,yPosStart,xPosEnd,yPosEnd;
    color c;
}

-(float) xPosStart;
-(void) setXStart:(float)value;
@property (assign) float xStart;
@property (assign) float yStart;
@property (assign) float xEnd;
@property (assign) float yEnd;
@property (assign) color line_color;

+(GSLine *) randomLine;

-(id) initLine:(color) line_color xPosStart:(float) xStart yPosStart:(float) yStart xPosEnd:(float) xEnd yPosEnd:(float) yEnd;

-(void) draw;

@end

@interface GSCircle : NSObject {
    float xPos, yPos, radius;
    color circleColor;
}

@property (assign) float xPos;
@property (assign) float yPos;
@property (assign) float radius;

@property (assign) color circleColor;

@end