//
//  HCItem.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "HCItemInfo.h"

@interface HCItem : NSObject

- (instancetype)initWithpath:(NSString *)path;
@property(nonatomic, copy) NSString *path;

@property(nonatomic, strong) NSDictionary *info;
@property(nonatomic, assign) BOOL isDirectory;
@property(nonatomic, strong) NSArray <NSString *>*subItems;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *superPath;




@end
