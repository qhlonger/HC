//
//  QFileManager.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "QFileManager.h"

@implementation QFileManager

+ (instancetype)sharedManager{
    static QFileManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[QFileManager alloc]init];
    });
    return manager;
}

+ (NSString *)documentsPath{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)tmpPath{
    return NSTemporaryDirectory();
}
+ (NSString *)cachesPath{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)libraryPath{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)homePath{
    return NSHomeDirectory();
}



+ (BOOL)addDir:(NSString *)dirName onPath:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [path stringByAppendingPathComponent:path];
    return [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
}
+ (void)addFile:(NSString *)fileName onPath:(NSString *)path withContents:(NSString *)contents{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    [fileManager createFileAtPath:filePath contents:[contents  dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}
+ (NSArray *)getItemsOnPath:(NSString *)path{
//    return [[NSFileManager defaultManager] subpathsAtPath:path];
    return [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:nil];
//    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
}
+ (NSDictionary *)fileInfoWithPath:(NSString *)path{
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    return dict;
}

@end
