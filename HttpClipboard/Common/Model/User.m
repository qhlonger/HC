//
//  User.m
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "User.h"

@implementation User

- (void)save{
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    
//    [userDefaults setObject:user.avatar forKey:KAvatar];
//    [userDefaults setObject:user.avatar_thumb forKey:kavatar_thumb];
//    [userDefaults setObject:user.coin forKey:KCoin];
//    [userDefaults setObject:user.sex forKey:KSex];
//    [userDefaults setObject:user.ID forKey:KID];
//    [userDefaults setObject:user.token forKey:KToken];
//    [userDefaults setObject:user.user_nicename forKey:KUser_nicename];
//    [userDefaults setObject:user.signature forKey:KSignature];
//    [userDefaults setObject:user.login_type forKey:Klogin_type];
//    [userDefaults setObject:user.avatar forKey:Klevel_anchor];
//    [userDefaults setObject:user.birthday forKey:KBirthday];
//    [userDefaults setObject:user.city forKey:Kcity];
//    [userDefaults setObject:user.level forKey:Klevel];
//    
    
    
    [userDefaults synchronize];
}
@end
