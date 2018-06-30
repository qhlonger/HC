//
//  Authorization.h
//  BaseProject
//
//  Created by 邱海龙 on 2016/12/30.
//  Copyright © 2016年 qiuhailong. All rights reserved.
//
//授权
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, AuthType) {
    AuthTypeCamera,
    AuthTypePhotos,
    AuthTypeMicroPhone,
    AuthTypeContact,
    
};
@interface Authorization : NSObject

+ (void)juageAuth:(AuthType )authType ifHaveAuthDo:(void(^)(void))function;
@end
