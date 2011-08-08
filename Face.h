//
//  Face.h
//  MyGame
//
//  Created by Wayne Buchner on 7/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Swingame.h"
#import "Shapes.h"

@interface GSFace : GSShape{    
    GSEllipse *leftEye, *rightEye;
    GSRectangle *mouth;
}

+(GSFace *) randomFace;

-(id) initFace:(color)  startColor 
           atX:(float)  startS 
          andY:(float)  startX 
     withWidth:(int)    startW 
     andHeight:(int)    startH;

-(void) draw;

@end
