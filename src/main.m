#import <stdbool.h>
#import <Foundation/Foundation.h>
#import "SwinGame.h"

#import "shapes.h"
#import "Face.h"
#import "Snowman.h"

int main(int argc, const char* argv[])
{
    [SGResources setAppPath:[NSString stringWithCString:argv[0] encoding:NSASCIIStringEncoding]];
    
    [SGAudio openAudio];
    [SGGraphics openGraphicsWindow:@"Random Shapes" 
                             width:800
                            height:600];
    
    [SGColors loadDefaultColors];
    [SGGraphics clearScreen:ColorWhite];
    
    
//    GSRectangle *r = [[GSRectangle randomRectangle] retain]; 
//    
//    GSEllipse *e = [[GSEllipse randomEllipse] retain];
//    
//    GSLine *l = [[GSLine randomLine] retain];
    
    Snowman *s = [[Snowman randomSnowman] retain]; 

    
    while (![SGInput windowCloseRequested])
    {
        //Update game...
        [SGInput processEvents];
        
        float rnd = [SGUtils rnd];
        //Draw game...
        //[SGText drawFramerateAtX:0 y:0];
        
        if (rnd > 0.63f) // 50% of the time
        {

            Snowman *s = [Snowman randomSnowman];
            [s  draw];
            
//            GSRectangle *r = [GSRectangle randomRectangle];
//            [r draw];
            
        }else if (rnd < 0.33f)
        {
//            GSEllipse *e = [GSEllipse randomEllipse];
//            [e draw];
            
        }else
        {
//            GSLine *l = [GSLine randomLine];
//            [l draw];
           
//            GSFace *f = [GSFace randomFace];
//            [f draw];
        }
        
        [SGGraphics refreshScreen];
    }

//    [r release];
//    [e release];
//    [l release];
      [s release];
  
    
    [SGAudio closeAudio];
    [SGResources releaseAllResources];
    return 0;
}
