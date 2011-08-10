#import <stdbool.h>
#import <Foundation/Foundation.h>
#import "SwinGame.h"

#import "shapes.h"
#import "Face.h"

int main(int argc, const char* argv[])
{
    [SGResources setAppPath:[NSString stringWithCString:argv[0] encoding:NSASCIIStringEncoding]];
    
    [SGAudio openAudio];
    [SGGraphics openGraphicsWindow:@"Random Shapes" 
                             width:800
                            height:600];
    
    [SGColors loadDefaultColors];
    [SGGraphics clearScreen:ColorWhite];
    
    
    GSRectangle *r = [[GSRectangle randomRectangle] retain]; 
    
    GSEllipse *e = [[GSEllipse randomEllipse] retain];
    
    GSLine *l = [[GSLine randomLine] retain];
    
    
    while (![SGInput windowCloseRequested])
    {
        //Update game...
        [SGInput processEvents];
        
        float rnd = [SGUtils rnd];
        //Draw game...
        //[SGText drawFramerateAtX:0 y:0];
        
        if (rnd > 0.63f) // 50% of the time
        {

            GSCircle *sm = [[GSCircle alloc] init];
            [sm setX:300.0f];
            [sm setY:300.0f];
            sm.rad = 100;
            sm.CircleColor = ColorRed;
            
            
            [sm draw];
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
    [r release];
    [e release];
    [l release];
    
    [SGAudio closeAudio];
    [SGResources releaseAllResources];
    return 0;
}
