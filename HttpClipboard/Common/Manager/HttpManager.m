//
//  HttpManager.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+ (instancetype)sharedManager{
    static HttpManager *sharedManager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        sharedManager = [[HttpManager alloc]init];
        
        
        sharedManager.sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@""]];
        sharedManager.sessionManager.requestSerializer.timeoutInterval = 10;
        sharedManager.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sharedManager.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        sharedManager.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
        
        [sharedManager.sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"ios%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]] forHTTPHeaderField:@"User-Agent"];
    });
    return sharedManager;
}


+ (void)postWithPath:(nullable NSString *)path
               param:(nullable NSDictionary *)param
               token:(BOOL)needToken
             showMsg:(BOOL)showMsg
             success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
             failure:(nullable void (^)(void))failure{

    
    path = [self getFinalPath:path];
    NSDictionary *para;
    if(needToken){
        para = [self getFinalParam:param];
    }else{
        para = param;
    }
    
    
    NSString *str = @"";
    for (NSString *key in para) {
        str = [NSString stringWithFormat:@"%@%@:%@\n",str,key, para[key]];
    }
    NSLog(@" =====================\n%@%@\n%@\n===================",[HttpManager sharedManager].sessionManager.baseURL.absoluteString,path,str);
    [[HttpManager sharedManager].sessionManager POST:path parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSInteger statusCode = [rootDict[@"ret"] integerValue];
        if(statusCode == 200){
            NSDictionary *dataDic = rootDict[@"data"];
            
            NSString *code = dataDic[@"code"];
            NSString *msg = dataDic[@"msg"];
            NSString *info = dataDic[@"info"];
            if([code integerValue] == 0){
                success(task, info);
            }else if([code integerValue] == 700){
//                [[UserManager sharedManager] loginWithUsername:LoginedUser.mobile password:LoginedUser.password callback:^(BOOL isSuccess, NSString *msg) {
//                    if(isSuccess){
//                        [[self class] getWithPath:path
//                                            param:param
//                                            token:needToken
//                                          showMsg:showMsg
//                                          success:success failure:failure];;
//                    }
//                }];
                [[self class]doLogout];
            }else{
                if(showMsg)
                    [Utility showError:[NSString stringWithFormat:@"%@\n%@",code, msg]];
                failure();
            }
        }else{
            NSString *respMsg = rootDict[@"msg"];
            if(respMsg && showMsg){
                [Utility showError:[NSString stringWithFormat:@"状态错误%ld\n%@",(long)statusCode, respMsg]];
            }
            failure();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(showMsg){
            [Utility showError:@"网络加载失败"];
        }
        failure();
    }];
}

+ (void)postOriginDataWithPath:(nullable NSString *)path
               param:(nullable NSDictionary *)param
             success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
             failure:(nullable void (^)(void))failure{

    
    
    
    NSString *str = @"";
    for (NSString *key in param) {
        str = [NSString stringWithFormat:@"%@%@:%@\n",str,key, param[key]];
    }
    NSLog(@" =====================\n%@%@\n%@\n===================",[HttpManager sharedManager].sessionManager.baseURL.absoluteString,path,str);
    [[HttpManager sharedManager].sessionManager POST:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:nil];
            success(task, rootDict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure();
    }];
}




+ (void)getWithPath:(nullable NSString *)path
              param:(nullable NSDictionary *)param
              token:(BOOL)needToken
            showMsg:(BOOL)isShowMsg
            success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
            failure:(nullable void (^)(void))failure{
    path = [self getFinalPath:path];
    NSDictionary *para;
    if(needToken){
        para = [self getFinalParam:param];
    }else{
        para = param;
    }
    
    NSString *str = @"";
    for (NSString *key in para) {
        str = [NSString stringWithFormat:@"%@%@:%@\n",str,key, para[key]];
    }
    NSLog(@" =====================\n%@%@\n%@\n===================",[HttpManager sharedManager].sessionManager.baseURL.absoluteString,path,str);
    [[HttpManager sharedManager].sessionManager GET:path parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSInteger statusCode = [rootDict[@"ret"] integerValue];
        if(statusCode == 200){
            NSDictionary *dataDic = rootDict[@"data"];

            NSString *code = dataDic[@"code"];
            NSString *msg = dataDic[@"msg"];
            NSString *info = dataDic[@"info"];
            if([code integerValue] == 0){
                success(task, info);
            }else if([code integerValue] == 700){
                [[self class]doLogout];
//                [[UserManager sharedManager] loginWithUsername:LoginedUser.mobile password:LoginedUser.password callback:^(BOOL isSuccess, NSString *msg) {
//                    if(isSuccess){
//                        [[self class] getWithPath:path
//                                            param:param
//                                            token:needToken
//                                          showMsg:isShowMsg
//                                          success:success failure:failure];
//                    }
//                }];
            }else{
                if(isShowMsg)
                    [Utility showError:[NSString stringWithFormat:@"状态%@\n%@",code, msg]];
                failure();
            }
        }else{
            NSString *respMsg = rootDict[@"msg"];
            if(respMsg && isShowMsg){
                [Utility showError:[NSString stringWithFormat:@"状态错误%ld\n%@",(long)statusCode, respMsg]];
            }
            failure();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(isShowMsg){
            failure();
        }
    }];
}

+ (void)getOriginDataWithPath:(nullable NSString *)path
                        param:(nullable NSDictionary *)param
                      success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable data))success
                      failure:(nullable void (^)(void))failure{
    NSString *str = @"";
    for (NSString *key in param) {
        str = [NSString stringWithFormat:@"%@%@:%@\n",str,key, param[key]];
    }
    NSLog(@" =====================\n%@%@\n%@\n===================",[HttpManager sharedManager].sessionManager.baseURL.absoluteString,path,str);
    [[HttpManager sharedManager].sessionManager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:nil];
            success(task, rootDict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure();
    }];
}




+ (void)postImagesWithPath:(NSString *)path
                    params:(NSDictionary *)param
                     token:(BOOL)needToken
                 isShowMsg:(BOOL)isShowMsg
                    images:(NSDictionary *)images
                  progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                   success:(void (^)(NSURLSessionDataTask * task, id data))success
                   failure:(nullable void (^)(void))failure{
    path = [self getFinalPath:path];
    NSDictionary *para;
    if(needToken){
        para = [self getFinalParam:param];
    }else{
        para = param;
    }
    
    
    NSString *str = @"";
    for (NSString *key in para) {
        str = [NSString stringWithFormat:@"%@%@:%@\n",str,key, para[key]];
    }
//    NSLog(@" =====================\n%@%@\n%@\n===================",[HttpManager sharedManager].sessionManager.baseURL.absoluteString,path,str);
    [[HttpManager sharedManager].sessionManager POST:path parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /**
         *  images 为字典  内容为 {@"后台字段名":[img1,img2...]}
         */
        //遍历所有键
        for (NSString *key in [images allKeys]) {
            //根据键 取出图片数组
            NSArray *imageArray = images[key];
            //遍历图片数组
            for (UIImage *image in imageArray) {
                //压缩至500k以下
                NSData *imageData = [image imageDataScaledToMaxFileSize:500];
                //按照表单格式把二进制文件写入formData表单
                [formData appendPartWithFileData:imageData name:key fileName:@"duibinaf.jpeg" mimeType:@"image/jpeg"];
            }
        }
        
        
        
    } progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSInteger statusCode = [rootDict[@"ret"] integerValue];
        if(statusCode == 200){
            NSDictionary *dataDic = rootDict[@"data"];
            
            NSString *code = dataDic[@"code"];
            NSString *msg = dataDic[@"msg"];
            NSString *info = dataDic[@"info"];
            if([code integerValue] == 0){
                success(task, info);
            }else if([code integerValue] == 700){
                
                [[self class]doLogout];
                
//                [[UserManager sharedManager] loginWithUsername:LoginedUser.mobile password:LoginedUser.password callback:^(BOOL isSuccess, NSString *msg) {
//                    if(isSuccess){
//                        [[self class] postImagesWithPath:path params:param token:needToken isShowMsg:isShowMsg images:images progress:uploadProgress success:success failure:failure];
//                    }
//                }];
            }else{
                if(isShowMsg)
                    [Utility showError:[NSString stringWithFormat:@"%@\n%@",code, msg]];
                failure();
            }
        }else{
            NSString *respMsg = rootDict[@"msg"];
            if(respMsg && isShowMsg){
                [Utility showError:[NSString stringWithFormat:@"状态错误%ld\n%@",(long)statusCode, respMsg]];
            }
            failure();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(isShowMsg){
            [Utility showError:@"网络加载失败"];
        }
            failure();
    }];
    
}

+ (void)doLogout{
    [[UserManager sharedManager]logoutWithCompletion:^{
        [Utility showError:@"当前登录已过期，请重新登录"];
    }];
}




+ (NSDictionary *)getFinalParam:(NSDictionary *)param{
    if(!IsLogined)return param;
    NSMutableDictionary  *p = [NSMutableDictionary dictionaryWithDictionary:param];
    [p setObject:[Utility getToken] forKey:@"token"];
    return p;
}
+ (NSString *)getFinalPath:(NSString *)apiPath{
    return [NSString stringWithFormat:@"%@/%@",ApiPath, apiPath?:@""];
}


@end
