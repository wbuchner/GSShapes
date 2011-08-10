#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "Types.h"
#import "SGTypes.h"
#import "SGPoint2D.h"
#import "SGVector.h"
#import "SGRectangle.h"
#import "SGCircle.h"
#import "SGLineSegment.h"
#import "SGTriangle.h"
#import "SGSoundEffect.h"
#import "SGMusic.h"
#import "SGMatrix2D.h"
#import "SGAnimationScript.h"
#import "SGAnimation.h"
#import "SGBitmap.h"
#import "SGBitmapCell.h"
#import "SGSprite.h"
#import "SGTimer.h"
#import "SGFont.h"
#import "SGDirectionAngles.h"
#import "SGCharacter.h"


@interface SGResources : NSObject
{
  
}

+ (NSString *)appPath;
+ (NSString *)filenameFor:(NSString *)name  ofKind:(resource_kind)kind;
+ (BOOL)hasResourceBundle:(NSString *)name;
+ (void)loadResourceBundleWithProgress:(NSString *)name;
+ (void)loadResourceBundleNamed:(NSString *)name  showingProgress:(BOOL)showProgress;
+ (void)mapResourceBundle:(NSString *)name  filename:(NSString *)filename  showProgress:(BOOL)showProgress;
+ (NSString *)pathToResourceFilename:(NSString *)filename;
+ (NSString *)pathToResourceFilename:(NSString *)filename  kind:(resource_kind)kind;
+ (NSString *)pathToResource:(NSString *)filename  inSubdir:(NSString *)subdir;
+ (NSString *)pathToResourceFilename:(NSString *)filename  kind:(resource_kind)kind  subPaths:(NSArray *)subPaths;
+ (NSString *)pathToResource:(NSString *)filename  kind:(resource_kind)kind  inSubdir:(NSString *)subdir;
+ (NSString *)pathToResourceBase:(NSString *)path  filename:(NSString *)filename;
+ (NSString *)pathToResourceBase:(NSString *)path  filename:(NSString *)filename  resourceKind:(resource_kind)kind;
+ (void)registerFreeNotifier:(free_notifier)fn;
+ (void)releaseAllResources;
+ (void)releaseResourceBundle:(NSString *)name;
+ (void)setAppPath:(NSString *)path;
+ (void)setAppPath:(NSString *)path  withExe:(BOOL)withExe;
+ (void)showLogos;








@end

