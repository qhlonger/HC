//
//  HCHelper.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HCFileType) {
    HCFileTypeDIR,
    HCFileTypeUNKNOW,
    HCFileTypeIMG,
    HCFileTypeTEXT,
    HCFileTypeWORD,
    HCFileTypePPT,
    HCFileTypeEXCEL,
    HCFileTypeARCHIVE,
    HCFileTypeVIDEO,
    HCFileTypeMUSIC,
    
    
};

@interface HCHelper : NSObject
@property(nonatomic, strong) HTTPServer *hcLocalServer;

+ (instancetype)helper;
- (void)startLocalHttpServer;
- (void)stopLocalHttpServer;

@end
