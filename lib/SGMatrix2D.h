#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"

@interface SGMatrix2D : NSObject
{
@package
    matrix2d data;
}

+ (SGMatrix2D *) matrix2DForData: (matrix2d)dat;
+ (void) getMatrix2Ds:(matrix2d *)firstPtr fromArray:(NSArray *)in_data maxSize:(int)sz;

- (id)initWithMatrix2D:(matrix2d)dat;

- (float) valueAtIndex:(int)idx0: (int)idx1;
- (void) setValueAtIndex:(int)idx0: (int)idx1 toValue:(float)value;



+ (SGMatrix2D *)identityMatrix;
+ (SGMatrix2D *)rotationMatrix:(float)deg;
+ (SGMatrix2D *)scaleMatrix:(float)scale;
+ (SGMatrix2D *)scaleMatrixByPoint:(SGPoint2D *)scale;
+ (SGMatrix2D *)matrixToScale:(SGPoint2D *)scale  rotate:(float)deg  translate:(SGPoint2D *)translate;
+ (SGMatrix2D *)translationMatrixDx:(float)dx  dy:(float)dy;
+ (SGMatrix2D *)translationMatrix:(SGPoint2D *)pt;




- (void)applyToTriangle:(SGTriangle *)tri;
- (void)applyToPoints:(NSArray *)pts;
- (SGVector *)multiplyByVector:(SGVector *)v;
- (SGMatrix2D *)multiplyByMatrix:(SGMatrix2D *)m2;
- (NSString *)description;

@end
