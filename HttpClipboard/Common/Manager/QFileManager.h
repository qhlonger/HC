//
//  QFileManager.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFileManager : NSObject

+ (instancetype)sharedManager;

+ (NSString *)documentsPath;
+ (NSString *)tmpPath;
+ (NSString *)cachesPath;
+ (NSString *)libraryPath;
+ (NSString *)homePath;



+ (void)addDir:(NSString *)dirName onPath:(NSString *)path;
+ (void)addFile:(NSString *)fileName onPath:(NSString *)path;
@end
