//
//  UserManager.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UserManager.h"
//#import "LoginVC.h"
@interface UserManager()

@end

@implementation UserManager

+ (instancetype)sharedManager{
    static UserManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserManager alloc]init];
    });
    return manager;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *loginFlag =  [Utility getDefaultWithKey:Key_IsLoginFlag];
        BOOL isLogined = loginFlag && [loginFlag isEqualToString:@"1"];
        _isLogined = isLogined;
        
        User *user = [User mj_objectWithKeyValues:[Utility getDefaultWithKey:Key_AllUserInfo]];
        _currentUser = user;
    }
    return self;
}
- (BOOL)isLogined{
//    if(self.currentUser && self.currentUser.id){
//        return YES;
//    }
    return NO;
}

//融云delagte
//从本地获取，本地没有，从网络获取，并更新本地
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(User *))completion{
//        [self getUserWithId:userId update:NO completion:^(User *user) {
//            if(user){
//                RCUserInfo *userInfo = [[RCUserInfo alloc]initWithUserId:[user.id stringValue] name:user.user_nicename portrait:[Utility webImageUrlWithPath:user.avatar_thumb].absoluteString];
//                completion(userInfo);
//            }else{
//                [self getUserWithId:userId update:YES completion:^(User *user) {
//                    if(user){
//                        RCUserInfo *userInfo = [[RCUserInfo alloc]initWithUserId:[user.id stringValue] name:user.user_nicename portrait:[Utility webImageUrlWithPath:user.avatar_thumb].absoluteString];
//                        completion(userInfo);
//                    }else{
//                        completion(nil);
//                    }
//                }];
//            }
//        }];
}
- (void)setCurrentUser:(User *)currentUser{
    _currentUser = currentUser;
    
//    RCUserInfo *rcInfo = [[RCUserInfo alloc]initWithUserId:[currentUser.id stringValue] name:currentUser.user_nicename portrait:[Utility webImageUrlWithPath:currentUser.avatar_thumb].absoluteString];
//    [RCIM sharedRCIM].currentUserInfo = rcInfo;
//    [[RCIM sharedRCIM] refreshUserInfoCache:rcInfo withUserId:rcInfo.userId];
//
//    if(currentUser){
//        self.isLogined = YES;
//    }
//    NSDictionary *userDic = [currentUser mj_keyValues];
//    if(userDic)
//        [Utility saveDefaultValue:userDic forKey:Key_AllUserInfo];
//    [[NSNotificationCenter defaultCenter]postNotificationName:Noti_UpdateUserInfo object:nil];
}



/**
 获取用户信息

 @param aID id
 @param needUpdate 从网络或本地数据库获取
 @param completion 回调
 */
- (void)getUserWithId:(NSString *)aID update:(BOOL)needUpdate completion:(void(^)(User *user))completion{
    if(!aID){
        completion(nil);
        return;
    }

    
    
    
//    if(needUpdate){
//        NSMutableDictionary *param = [@{} mutableCopy];
//        [param setObject:@"User.getUserInfo" forKey:@"service"];
//        [param setObject:aID forKey:@"uid"];
//        if(IsLogined)
//            [param setObject:LoginedUser.id forKey:@"selfid"];
//        [HttpManager getWithPath:@""
//                           param:param
//                           token:YES
//                         showMsg:NO
//                         success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable data) {
//                             NSDictionary *userInfo = data;
//                             RLMUser *rlmUser = [[RLMUser alloc]initWithValue:userInfo];
////                             rlmUser.id = data[@"id"];
////                             rlmUser.avatar = data[@"avatar"];
////                             rlmUser.avatar_thumb = data[@"avatar_thumb"];
////                             rlmUser.user_nicename = data[@"user_nicename"];
//
//
////                             RLMUser *rlmUser = [RLMUser mj_objectWithKeyValues:userInfo];
//                             RLMRealm *realm = [RLMRealm defaultRealm];
//                             [realm transactionWithBlock:^{
//                                 [realm addOrUpdateObject:rlmUser];
//                             }];
//
//                             User *user = [User mj_objectWithKeyValues:userInfo];
//
//
//                             RCUserInfo *rcInfo = [[RCUserInfo alloc]initWithUserId:[user.id stringValue] name:user.user_nicename portrait:[Utility webImageUrlWithPath:user.avatar_thumb].absoluteString];
//
//                             [[RCIM sharedRCIM] refreshUserInfoCache:rcInfo withUserId:rcInfo.userId];
//
//                             completion(user);
//                         } failure:^{
//                             completion(nil);
//                         }];
//    }else{
//        RLMUser *rlmUser = [RLMUser objectForPrimaryKey:aID];
//        if(rlmUser && rlmUser.avatar && rlmUser.user_nicename){
////            NSDictionary *userInfoDict = [rlmUser mj_keyValuesWithKeys:@[@""]];
//
//
//            User *user = [[User alloc]init];// [User mj_objectWithKeyValues:userInfoDict];
//            user.avatar = rlmUser.avatar;
//            user.avatar_thumb = rlmUser.avatar_thumb;
//            user.user_nicename = rlmUser.user_nicename;
//            user.id = @([rlmUser.id integerValue]);
//            completion(user);
//        }else{
//            completion(nil);
//        }
//
//    }
}

//更新当前用户
- (void)getUserInfo:(void(^)(User *currentuser))callback refresh:(BOOL)needRefresh{
    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSNumber *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];//本地 build
//    //NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];version
//    //NSLog(@"当前应用软件版本:%@",appCurVersion);
//    NSString *build = [NSString stringWithFormat:@"%@",app_build];
//    //这个地方传版本号，做上架隐藏，只有版本号跟后台一致，才会隐藏部分上架限制功能，不会影响其他正常使用客户(后台位置：私密设置-基本设置 -IOS上架版本号)
//    NSMutableDictionary *param = [@{} mutableCopy];
//    [param setObject:@"User.getBaseInfo" forKey:@"service"];
//    [param setObject:LoginedUser.id forKey:@"uid"];
//    [param setObject:[Utility getToken] forKey:@"token"];
//    [param setObject:build forKey:@"version_ios"];
////    NSString *url = [NSString stringWithFormat:@"?service=User.getBaseInfo&uid=%@&token=%@&version_ios=%@",LoginedUser.id,[Utility getToken],build];
//    [HttpManager getWithPath:@""
//                       param:param
//                       token:YES
//                     showMsg:NO
//                     success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable data) {
////            NSArray *data = data;
//            NSArray *info = data;
//                if(info.count){
//                    NSDictionary *infoData = [info firstObject];
//                    User *user = [User mj_objectWithKeyValues:infoData];
//                    [LoginedUser mj_setKeyValues:infoData];
//                    if(callback)callback(user);
//                    RCUserInfo *rcInfo = [[RCUserInfo alloc]initWithUserId:[LoginedUser.id stringValue] name:LoginedUser.user_nicename portrait:[Utility webImageUrlWithPath:LoginedUser.avatar_thumb].absoluteString];
//                    [RCIM sharedRCIM].currentUserInfo = rcInfo;
//                    [[RCIM sharedRCIM] refreshUserInfoCache:rcInfo withUserId:rcInfo.userId];
//
//                    [[NSNotificationCenter defaultCenter]postNotificationName:Noti_UpdateUserInfo object:nil];
//
//        }
//    } failure:^{
//
//    }];
    
}
- (void)loginWithUsername:(NSString *)username password:(NSString *)password callback:(void(^)(BOOL isSuccess, NSString *msg))callback{
//    NSMutableDictionary *param = [@{} mutableCopy];
//    [param setObject:@"Login.userLogin" forKey:@"service"];
//    [param setObject:username forKey:@"user_login"];
//    if(password.length == 32)
//        [param setObject:password forKey:@"user_pass"];
//    else
//        [param setObject:[password md532BitLower] forKey:@"user_pass"];
//    [HttpManager postWithPath:@""
//                        param:param
//                        token:NO
//                      showMsg:YES
//                      success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable data) {
//                          NSArray *info = data;
//                          if(info.count){
//                              NSDictionary *infoDic = [info firstObject];
//                              if(infoDic){
//                                  User *user = [User mj_objectWithKeyValues:infoDic];
//
//                                  if(password.length == 32)
//                                      user.password = password;
//                                  else
//                                      user.password = [password md532BitLower];
//                                  user.username = username;
//                                  LoginedUser = user;
////                                  NSString *loginFlag = [Utility getDefaultWithKey:Key_IsLoginFlag];
////                                  if(!loginFlag || ![loginFlag isEqualToString:@"0"]){
//                                      [[QIMHelper helper]loginIMWithCompletion:^(BOOL isSuccess) {
//
//                                      }];
////                                  }
//                                  [Utility saveDefaultValue:@"1" forKey:Key_IsLoginFlag];
//                                  [[NSNotificationCenter defaultCenter]postNotificationName:Noti_DidLoginSuccess object:nil];
//                                  if(callback)callback(YES, @"登录成功");
//                                  return;
//                              }
//                          }
//                          if(callback)callback(NO, @"获取用户信息失败");
//                      } failure:^{
//                          if(callback)callback(NO, @"网络错误");
//                      }];
}
- (void)smsLoginWithPhone:(NSString *)phone code:(NSString *)code callback:(void (^)(BOOL isSuccess, NSString *msg))callback{
//    NSMutableDictionary *param = [@{} mutableCopy];
//    [param setObject:@"Login.userLoginByMessage" forKey:@"service"];
//    [param setObject:phone forKey:@"user_login"];
//    [param setObject:code forKey:@"code"];
//
//    [HttpManager postWithPath:@""
//                        param:param
//                        token:NO
//                      showMsg:YES
//                      success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable data) {
//                          NSArray *info = data;
//                          if(info.count){
//                              NSDictionary *infoDic = [info firstObject];
//                              if(infoDic){
//                                  User *user = [User mj_objectWithKeyValues:infoDic];
//                                  LoginedUser = user;
////                                  NSString *loginFlag = [Utility getDefaultWithKey:Key_IsLoginFlag];
////                                  if(!loginFlag || ![loginFlag isEqualToString:@"0"]){
//                                      [[QIMHelper helper]loginIMWithCompletion:^(BOOL isSuccess) {
//
//                                      }];
////                                  }
//                                  [Utility saveDefaultValue:@"1" forKey:Key_IsLoginFlag];
//                                  [[NSNotificationCenter defaultCenter]postNotificationName:Noti_DidLoginSuccess object:nil];
//                                  if(callback)callback(YES, @"登录成功");
//                                  return;
//                              }
//                          }
//                          if(callback)callback(NO, @"获取用户信息失败");
//                      } failure:^{
//                          if(callback)callback(NO, nil);
//                      }];
}
- (void)getToken:(void(^)(NSString *token))completion{
//    NSMutableDictionary *param = [@{} mutableCopy];
//    [param setObject:@"User.getUserToken" forKey:@"service"];
//    [param setObject:self.currentUser.id forKey:@"uid"];
//
//    [HttpManager getWithPath:@"" param:param token:YES showMsg:YES success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable data) {
//        NSString *token = data[@"token"];
//        self.currentUser.token = token;
//        [self.currentUser save];
//        completion(token);
//    } failure:^{
//        completion(nil);
//    }];
}
- (void)logoutWithCompletion:(void(^)(void))completion{
//    //    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//    [Utility saveDefaultValue:@"0" forKey:Key_IsLoginFlag];
//    [Utility removeValueForKey:Key_AllUserInfo];
//    [UserManager sharedManager].currentUser = nil;
//    NSString*appDomain = [[NSBundle mainBundle]bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
//    [StaticManager sharedManager].customTabbar.items[0].badgeValue = nil;
//    [[RCIM sharedRCIM] logout];
//    [[RCIM sharedRCIM] clearUserInfoCache];
////    [RCIMClient sharedRCIMClient]
//    [[NSNotificationCenter defaultCenter]postNotificationName:Noti_DidLogoutSuccess object:nil];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if(completion)completion();
//    });
//    //    });
    
}

@end
