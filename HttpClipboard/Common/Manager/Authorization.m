//
//  Authorization.m
//  BaseProject
//
//  Created by 邱海龙 on 2016/12/30.
//  Copyright © 2016年 qiuhailong. All rights reserved.
//

#import "Authorization.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AddressBook/ABAddressBook.h>
#import <AVFoundation/AVFoundation.h>
#import "QAlertView.h"

@implementation Authorization
+ (void)juageAuth:(AuthType)authType ifHaveAuthDo:(void(^)(void))function{
    switch (authType) {
        case AuthTypeCamera:{
            NSString *mediaType = AVMediaTypeVideo;
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
            if(authStatus == ALAuthorizationStatusRestricted || authStatus == ALAuthorizationStatusDenied){
                [QAlertView showWithTitle:@"无法打开相机"
                                     info:@"应用没有相机权限，请前往“设置>隐私相机”中开启相机权限。"
                                leftTitle:@"取消"
                               rightTitle:@"前往"
                                   config:^(QAlertView *alertView) {
                                       
                              }leftAction:^BOOL(QAlertView *alertView) {
                                   return YES;
                              }rightAction:^BOOL(QAlertView *alertView) {
                                  NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                  
                                  if([[UIApplication sharedApplication] canOpenURL:url]) {
                                      NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                      [[UIApplication sharedApplication] openURL:url];
                                  }
                                  return YES;
                              }];
            }else{
                function();
            }
        }break;
        case AuthTypePhotos:{
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if(author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied){
//            if (author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
                //无权限
                [QAlertView showWithTitle:@"无法打开相册"
                                     info:@"应用没有相册权限，请前往“设置>隐私>相册”中开启相册权限。"
                                leftTitle:@"取消"
                               rightTitle:@"前往"
                                   config:^(QAlertView *alertView) {
                                       
                                   }leftAction:^BOOL(QAlertView *alertView) {
                                       return YES;
                                   }rightAction:^BOOL(QAlertView *alertView) {
                                       NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                       
                                       if([[UIApplication sharedApplication] canOpenURL:url]) {
                                           NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                           [[UIApplication sharedApplication] openURL:url];
                                       }
                                       return YES;
                                   }];
                return;
            }else{
                function();
            }
        }break;
        case AuthTypeMicroPhone:{
            NSString *mediaType = AVMediaTypeVideo;
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
            if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
                [QAlertView showWithTitle:@"无法打开麦克风"
                                     info:@"应用没有麦克风权限，请前往“设置>隐私>麦克风”中开启相册权限。"
                                leftTitle:@"取消"
                               rightTitle:@"前往"
                                   config:^(QAlertView *alertView) {
                                       
                                   }leftAction:^BOOL(QAlertView *alertView) {
                                       return YES;
                                   }rightAction:^BOOL(QAlertView *alertView) {
                                       NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                       
                                       if([[UIApplication sharedApplication] canOpenURL:url]) {
                                           NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                           [[UIApplication sharedApplication] openURL:url];
                                       }
                                       return YES;
                                   }];
            }else{
                function();
            }
//            [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
//
//                if (granted) {
//                    function();
//
//                    // 用户同意获取麦克风
//
//                } else {
//                    [QAlertView showWithTitle:@"无法打开麦克风"
//                                         info:@"应用没有麦克风权限，请前往“设置>隐私>麦克风”中开启相册权限。"
//                                    leftTitle:@"取消"
//                                   rightTitle:@"前往"
//                                       config:^(QAlertView *alertView) {
//
//                                       }leftAction:^BOOL(QAlertView *alertView) {
//                                           return YES;
//                                       }rightAction:^BOOL(QAlertView *alertView) {
//                                           NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//
//                                           if([[UIApplication sharedApplication] canOpenURL:url]) {
//                                               NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                                               [[UIApplication sharedApplication] openURL:url];
//                                           }
//                                           return YES;
//                                       }];
//
//                    return ;
//
//                }
//
//            }];
        }break;
            
        case AuthTypeContact:{
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
            ABAuthorizationStatus authStatus = ABAddressBookGetAuthorizationStatus();
            
            if (authStatus != kABAuthorizationStatusAuthorized){
                ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (error){
                            NSLog(@"Error: %@", (__bridge NSError *)error);
                        }else if (!granted){
                            //无权限
                            [QAlertView showWithTitle:@"无法打开通讯录"
                                                 info:@"应用没有通讯录权限，请前往“设置>隐私>通讯录”中开启通讯录权限。"
                                            leftTitle:@"取消"
                                           rightTitle:@"前往"
                                               config:^(QAlertView *alertView) {
                                                   
                                               }leftAction:^BOOL(QAlertView *alertView) {
                                                   return YES;
                                               }rightAction:^BOOL(QAlertView *alertView) {
                                                   NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                                   
                                                   if([[UIApplication sharedApplication] canOpenURL:url]) {
                                                       NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                                       [[UIApplication sharedApplication] openURL:url];
                                                   }
                                                   return YES;
                                               }];
                           
                        }else{
                            function();
                        }
                    });
                });
            }else{
                function();
            }
        }break;
        default:
            break;
    }
    
    
}

@end
