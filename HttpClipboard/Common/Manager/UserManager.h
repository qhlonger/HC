//
//  UserManager.h
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface UserManager : NSObject//<RCIMUserInfoDataSource>

@property(nonatomic, strong) User *currentUser;


+ (instancetype)sharedManager;


/**
 获取用户信息
 
 @param aID id
 @param needUpdate 从网络或本地数据库获取
 @param completion 回调
 */
- (void)getUserWithId:(NSString *)aID update:(BOOL)needUpdate completion:(void(^)(User *user))completion;
//更新当前用户信息
- (void)getUserInfo:(void(^)(User *currentuser))callback refresh:(BOOL)needRefresh;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password callback:(void(^)(BOOL isSuccess, NSString *msg))callback;
- (void)getToken:(void(^)(NSString *token))completion;
- (void)smsLoginWithPhone:(NSString *)phone code:(NSString *)code callback:(void(^)(BOOL isSuccess, NSString *msg))callback;

- (void)logoutWithCompletion:(void(^)(void))completion;

@property(nonatomic, assign) BOOL isLogined;





@end
