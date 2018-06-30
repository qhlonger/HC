//
//  HCListAdapter.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCItem.h"
#import "HCHelper.h"

@interface HCListAdapter : NSObject

@property(nonatomic, strong) HCItem *item;

@property(nonatomic, assign) NSInteger numberOfItems;
@property(nonatomic, assign) NSInteger numberOfInfo;



- (NSString *)mimeTypeForFileAtPath:(NSString *)path;
- (HCFileType)typeOfPath:(NSString *)path;
- (NSString *)titleForIndex:(NSInteger)index;
- (NSString *)pathOfIndex:(NSInteger)index;
- (NSString *)detailKeyForIndex:(NSInteger)index;
- (NSString *)detailValueForIndex:(NSInteger)index;
@end
