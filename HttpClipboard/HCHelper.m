//
//  HCHelper.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCHelper.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
@implementation HCHelper
+ (instancetype)helper{
    static HCHelper *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HCHelper alloc]init];
    });
    return manager;
}

// 获取设备IP地址
+(NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // 检索当前接口,在成功时,返回0
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // 循环链表的接口
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // 检查接口是否en0 wifi连接在iPhone上
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // 得到NSString从C字符串
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // 释放内存
    freeifaddrs(interfaces);
    return address;
}


- (NSString *)webPath{
//    NSString *webPath = [NSString stringWithFormat:@"%@/%@",[Utility documentsPath],@"Web"];
    
    NSString *projWebPath = [[NSBundle mainBundle] pathForResource:@"Web" ofType:nil];
    return projWebPath;
    
    
//
    
//    BOOL isDir;
//    if ([[NSFileManager defaultManager]fileExistsAtPath:webPath isDirectory:&isDir] && isDir) {
//
//    }else{
//        [[NSFileManager defaultManager] createDirectoryAtPath:webPath withIntermediateDirectories:YES attributes:nil error:nil];
//
//
//        NSString *htmlPath = [webPath stringByAppendingPathComponent:@"/index.html"];
//        NSString *projFilePath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//        [[NSFileManager defaultManager] copyItemAtPath:projFilePath toPath:htmlPath error:nil];
//    }
    
//    return webPath;
}
- (NSString *)userPath{
    NSString *userPath = [NSString stringWithFormat:@"%@/%@",[Utility documentsPath],@"User"];
    BOOL isDir;
    if ([[NSFileManager defaultManager]fileExistsAtPath:userPath isDirectory:&isDir] && isDir) {
        
    }else{
        [[NSFileManager defaultManager] createDirectoryAtPath:userPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return userPath;

}
- (HCFileType)typeFromPath:(NSString *)path{
    NSString *type = [path pathExtension];
    if ([type isEqualToString:@"txt"] ||
        [type isEqualToString:@""]) {
        return HCFileTypeTEXT;
    }else if([type isEqualToString:@"jpg"] ||
             [type isEqualToString:@"jpg"] ||
             [type isEqualToString:@"jpg"] ||
             [type isEqualToString:@"jpg"] ||
             [type isEqualToString:@"jpg"] ||
             [type isEqualToString:@"jpg"] ){
        return HCFileTypeTEXT;
    }else{
        return HCFileTypeUNKNOW;
    }
}
- (HTTPServer *)hcLocalServer{
    if (!_hcLocalServer) {
        _hcLocalServer = [[HTTPServer alloc]init];
        [_hcLocalServer setType:@"_http.tcp"];
        [_hcLocalServer setPort:80];
        [_hcLocalServer setDocumentRoot:[self webPath]];
        
    }
    return _hcLocalServer;
}
- (void)startLocalHttpServer{
    NSError *error;
    if([self.hcLocalServer start:&error]){
        NSLog(@"启动成功");
        NSLog(@"%@",[[self class] getIPAddress]);
    }else{
        NSLog(@"启动失败");
    }
    
    
}
- (void)stopLocalHttpServer{
    [self.hcLocalServer stop];
}
//- (NSString *)textOfFileType:(HCFileType)type{
//    
//}
//- (NSString *)imageOfFileType:(HCFileType)type{
//    
//}
@end
