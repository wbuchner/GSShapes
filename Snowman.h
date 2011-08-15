//
//  Snowman.h
//  MyGame
//
//  Created by Wayne Buchner on 10/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Swingame.h"
#import "Shapes.h"

@interface Snowman : GSCircle{
    GSCircle *body, *head, *button1,*button2, *button3, *leftEye, *rightEye;; 
    GSRectangle *mouth;
    GSLine *armLeft, *armRight;
}

+(Snowman *) randomSnowman;

-(id) initSnowman:(color)   startColor 
              atX:(float)   xPos 
             andY:(float)   yPos 
       withRadius:(int)     rad;

-(void) draw;

@end
