#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>

#import "SGResources.h"
#import "SGSDK.h"
#import "SwinGame.h"

#import <stdlib.h>

@implementation SGResources : NSObject


+ (NSString *)appPath
{
    char result[2048];
    sg_Resources_AppPath(result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)filenameFor:(NSString *)name  ofKind:(resource_kind)kind
{
    char name_temp[[name length] + 1];
    char result[2048];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_FilenameToResource(name_temp, (int)kind, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (BOOL)hasResourceBundle:(NSString *)name
{
    char name_temp[[name length] + 1];
    BOOL result;
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    result = sg_Resources_HasResourceBundle(name_temp) != 0;
    return result;
}

+ (void)loadResourceBundleWithProgress:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_LoadResourceBundle(name_temp, 1);
}

+ (void)loadResourceBundleNamed:(NSString *)name  showingProgress:(BOOL)showProgress
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_LoadResourceBundle(name_temp, (showProgress ? 1 : 0));
}

+ (void)mapResourceBundle:(NSString *)name  filename:(NSString *)filename  showProgress:(BOOL)showProgress
{
    char name_temp[[name length] + 1];
    char filename_temp[[filename length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_LoadResourceBundleNamed(name_temp, filename_temp, (showProgress ? 1 : 0));
}

+ (NSString *)pathToResourceFilename:(NSString *)filename
{
    char filename_temp[[filename length] + 1];
    char result[2048];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToOtherResource(filename_temp, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResourceFilename:(NSString *)filename  kind:(resource_kind)kind
{
    char filename_temp[[filename length] + 1];
    char result[2048];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToResource(filename_temp, (int)kind, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResource:(NSString *)filename  inSubdir:(NSString *)subdir
{
    char filename_temp[[filename length] + 1];
    char subdir_temp[[subdir length] + 1];
    char result[2048];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    [subdir getCString:subdir_temp maxLength:[subdir length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToResourseInSubdir(filename_temp, subdir_temp, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResourceFilename:(NSString *)filename  kind:(resource_kind)kind  subPaths:(NSArray *)subPaths
{
    char filename_temp[[filename length] + 1];
    char * subPaths_temp[[subPaths count]];
    [SGStringBufferManager stringBufferManagerFor:subPaths_temp size:[subPaths count]];
    
    char result[2048];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    [NSString getStrings:subPaths_temp fromArray:subPaths maxSize:[subPaths count]];
    sg_Resources_PathToResourceWithSubPaths(filename_temp, (int)kind, subPaths_temp, result, [subPaths count]);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResource:(NSString *)filename  kind:(resource_kind)kind  inSubdir:(NSString *)subdir
{
    char filename_temp[[filename length] + 1];
    char subdir_temp[[subdir length] + 1];
    char result[2048];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    [subdir getCString:subdir_temp maxLength:[subdir length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToResourseKindInSubdir(filename_temp, (int)kind, subdir_temp, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResourceBase:(NSString *)path  filename:(NSString *)filename
{
    char path_temp[[path length] + 1];
    char filename_temp[[filename length] + 1];
    char result[2048];
    [path getCString:path_temp maxLength:[path length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToOtherResourceWithBase(path_temp, filename_temp, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (NSString *)pathToResourceBase:(NSString *)path  filename:(NSString *)filename  resourceKind:(resource_kind)kind
{
    char path_temp[[path length] + 1];
    char filename_temp[[filename length] + 1];
    char result[2048];
    [path getCString:path_temp maxLength:[path length] + 1 encoding:NSASCIIStringEncoding];
    [filename getCString:filename_temp maxLength:[filename length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_PathToResourceWithBase(path_temp, filename_temp, (int)kind, result);
    return [[[NSString alloc] initWithCString:result encoding:NSASCIIStringEncoding] autorelease];
}

+ (void)registerFreeNotifier:(free_notifier)fn
{
    sg_Resources_RegisterFreeNotifier(fn);
}

+ (void)releaseAllResources
{
    sg_Resources_ReleaseAllResources();
}

+ (void)releaseResourceBundle:(NSString *)name
{
    char name_temp[[name length] + 1];
    [name getCString:name_temp maxLength:[name length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_ReleaseResourceBundle(name_temp);
}

+ (void)setAppPath:(NSString *)path
{
    char path_temp[[path length] + 1];
    [path getCString:path_temp maxLength:[path length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_SetAppPath(path_temp);
}

+ (void)setAppPath:(NSString *)path  withExe:(BOOL)withExe
{
    char path_temp[[path length] + 1];
    [path getCString:path_temp maxLength:[path length] + 1 encoding:NSASCIIStringEncoding];
    sg_Resources_SetAppPathWithExe(path_temp, (withExe ? 1 : 0));
}

+ (void)showLogos
{
    sg_Resources_ShowLogos();
}









@end
