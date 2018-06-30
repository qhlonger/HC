//
//  HCItem.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCItem.h"

@implementation HCItem

- (instancetype)initWithpath:(NSString *)path{
    self = [super init];
    if (self) {
        self.path = path;
        
        //子项
        self.subItems = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        //信息
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];

        self.info = dict;
//        self.info = [HCItemInfo mj_objectWithKeyValues:dict];
        BOOL isDir;
        [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
        self.isDirectory = isDir;
        
        
    }
    return self;
}
@end
