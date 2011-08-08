#import <string.h>
#import "SGMatrix2D.h"

#import "SGSDK.h"
#import "SwinGame.h"

@implementation SGMatrix2D : NSObject

+ (SGMatrix2D *) matrix2DForData: (matrix2d)dat
{
    SGMatrix2D *ret = [[SGMatrix2D alloc] initWithMatrix2D: dat];
    [ret autorelease];
    return ret;
}

- (void) copyTo:(matrix2d *)dest
{
    memcpy((void *)dest, (void *)data, sizeof(data));
}

+ (void) getMatrix2Ds:(matrix2d *)firstPtr fromArray:(const NSArray *)arr maxSize:(int)sz
{
    int i, count = [arr count];
    count = count <= sz ? count: sz; //get min of count and sz
    
    for (i = 0; i < count; i++)
    {
        // get the i'th object from the NSArray
        SGMatrix2D *obj = ((SGMatrix2D *)[arr objectAtIndex: i]);
        [obj copyTo:(firstPtr + i)];
    }
}

- (id)initWithMatrix2D:(matrix2d)dat
{
    //Assign super's initialised value to the self pointer
    self = [super init];
    if (self != nil)
    {
        //If self isn't nil then assign pointer.
        memcpy((void *) data, (void *) dat, sizeof(data));
    }
    return self;
}

- (float) valueAtIndex:(int)idx0: (int)idx1
{
    return data[idx0][idx1];
}

- (void) setValueAtIndex:(int)idx0: (int)idx1 toValue:(float)value
{
    data[idx0][idx1] = value;
}


+ (SGMatrix2D *)identityMatrix
{
    matrix2d result;
    sg_Geometry_IdentityMatrix(result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)rotationMatrix:(float)deg
{
    matrix2d result;
    sg_Geometry_RotationMatrix(deg, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)scaleMatrix:(float)scale
{
    matrix2d result;
    sg_Geometry_ScaleMatrix(scale, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)scaleMatrixByPoint:(SGPoint2D *)scale
{
    matrix2d result;
    sg_Geometry_ScaleMatrixByPoint(&scale->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)matrixToScale:(SGPoint2D *)scale  rotate:(float)deg  translate:(SGPoint2D *)translate
{
    matrix2d result;
    sg_Geometry_ScaleRotateTranslateMatrix(&scale->data, deg, &translate->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)translationMatrixDx:(float)dx  dy:(float)dy
{
    matrix2d result;
    sg_Geometry_TranslationMatrix(dx, dy, result);
    return [SGMatrix2D matrix2DForData:result];
}

+ (SGMatrix2D *)translationMatrix:(SGPoint2D *)pt
{
    matrix2d result;
    sg_Geometry_TranslationMatrixPt(&pt->data, result);
    return [SGMatrix2D matrix2DForData:result];
}





- (void)applyToTriangle:(SGTriangle *)tri
{
    sg_Geometry_ApplyMatrix(self->data, tri->data);
}

- (void)applyToPoints:(NSArray *)pts
{
    point2d pts_temp[[pts count]];
    [SGPoint2D getPoint2Ds:pts_temp fromArray:pts maxSize:[pts count]];
    sg_Geometry_ApplyMatrixToPoints(self->data, pts_temp, [pts count]);
    [SGPoint2D updatePoint2DsIn:pts fromDataIn:pts_temp size:[pts count]];
}

- (SGVector *)multiplyByVector:(SGVector *)v
{
    SGVector * result;
    result = [SGVector vectorForData:sg_Geometry_MatrixMultiplyVector(self->data, &v->data)];
    return result;
}

- (SGMatrix2D *)multiplyByMatrix:(SGMatrix2D *)m2
{
    matrix2d result;
    sg_Geometry_MatrixMultiply(self->data, m2->data, result);
    return [SGMatrix2D matrix2DForData:result];
}

- (NSString *)description
{
    char result[2048];
    sg_Geometry_MatrixToString(self->data, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}


@end

