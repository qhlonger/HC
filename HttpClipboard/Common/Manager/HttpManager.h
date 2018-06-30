//
//  HttpManager.h
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>













@class AFHTTPSessionManager;
@interface HttpManager : NSObject

@property (nonatomic, strong)  AFHTTPSessionManager * _Nonnull sessionManager;

+ (instancetype _Nonnull)sharedManager;


@property(nonatomic, strong) NSMutableDictionary * _Nullable cookies;


+ (void)postWithPath:(nullable NSString *)path
               param:(nullable NSDictionary *)param
               token:(BOOL)needToken
             showMsg:(BOOL)show
             success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
             failure:(nullable void (^)(void))failure;


+ (void)postOriginDataWithPath:(nullable NSString *)path
                         param:(nullable NSDictionary *)param
                       success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
                       failure:(nullable void (^)(void))failure;

+ (void)getWithPath:(nullable NSString *)path
              param:(nullable NSDictionary *)param
              token:(BOOL)needToken
            showMsg:(BOOL)isShowMsg
            success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
            failure:(nullable void (^)(void))failure;


+ (void)getOriginDataWithPath:(nullable NSString *)path
                        param:(nullable NSDictionary *)param
                      success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
                      failure:(nullable void (^)(void))failure;



+ (void)postImagesWithPath:(nullable NSString *)path
                    params:(nullable NSDictionary *)params
                     token:(BOOL)needToken
                 isShowMsg:(BOOL)isShowMsg
                    images:(nullable NSDictionary*)images
                  progress:(nullable nullable void (^)(NSProgress * _Nonnull))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
                   failure:(nullable void (^)(void))failure;

@end
