//
//  Utility.h
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QRefreshHeader.h"

#import "OneButtonTipsAlert.h"



@class MJRefreshNormalHeader, MJRefreshAutoFooter;
@interface Utility : NSObject


+ (void)saveLastOpenTime;
+ (BOOL)checkLastOpenTime;

+ (BOOL)isIphoneX;
+ (BOOL)isIphone40orLow;
+ (BOOL)isIphone47;
+ (BOOL)isIphone55;

+ (UIImage *)SnapView:(UIView *)view;
+ (UIImage *)levelImgWithLevel:(NSString *)level;

+ (void)showStatus:(NSString *)status;
+ (void)showSuccess:(NSString *)status;
+ (void)showError:(NSString *)status;
+ (void)showProgress:(CGFloat)progress withStatus:(NSString *)string;
+ (void)showProgressWithProgress:(NSProgress *)progress withStatus:(NSString *)string;
+ (void)showHUD;
+ (void)dismissHUD;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;
//数字逗号分隔

+ (NSString *)countNumAndChangeformat:(NSString *)num;


+ (CGFloat)getRatioWithMax:(CGFloat)max min:(CGFloat)min mid:(CGFloat)mid;
+ (CGFloat)getMidWithMax:(CGFloat)max min:(CGFloat)min ratio:(CGFloat)ratio;
+ (CGRect)getRectWithMaxRect:(CGRect)maxRect minRect:(CGRect)minRect Ratio:(CGFloat)ratio;
+ (CGRect)frame:(CGRect)frame byInsets:(UIEdgeInsets)insets;

+ (UIViewController *)getCurrentVC;



+ (UITextField *)normalTextField;



+ (BOOL)isString:(NSString *)string validate:(NSString *)pattern;
+ (NSArray <NSString *>*)getSubstringFromString:(NSString *)string validate:(NSString *)pattern;


+ (UIFont *)equalWidthFontWithSize:(NSInteger)size;



//+ (INSDefaultInfiniteIndicator *)defultFooter;

//+ (INSDefaultPullToRefresh *)defultHeader;

//+ (NSURL *)getImgUrl:(NSString *)urlStr;

+ (void)ifLoginDo:(void(^)(void))doThing;
+ (void)showNeedLoginTips;

+ (BOOL)joinGroup:(NSString *)groupUin key:(NSString *)key;
+ (CGFloat)ptOn40:(CGFloat)pt;
+ (CGFloat)ptOn47:(CGFloat)pt;
+ (CGFloat)ptOn55:(CGFloat)pt;
+ (CGFloat)ptOn58:(CGFloat)pt;

+ (NSString *)jsonStringFromDict:(NSDictionary *)dict;
+ (NSDictionary *)dictFromJsonString:(NSString *)json;

+ (void)toLoginVC;

+ (BOOL)toWechat;
+ (BOOL)toWechatScan;
+ (BOOL)toWechatAddFriends;
+ (BOOL)toQQ;
+ (void)callWithPhoneNumber:(NSString *)number;


+ (NSString *)removeSpaceAndNewline:(NSString *)str;

+ (UITextField *)loginTfWithImg:(NSString *)img placeholder:(NSString *)holder ;



+ (void)saveDefaultValue:(id)value forKey:(NSString *)key;
+ (id)getDefaultWithKey:(NSString *)key;
+ (void)removeValueForKey:(NSString *)key;
+ (BOOL)haveValueForKey:(NSString *)key;


+ (NSString *)getToken;



+ (MJRefreshNormalHeader *)normalHeaderWithBlock:(void(^)(void))block;

+ (MJRefreshAutoFooter *)normalFooterWithBlock:(void(^)(void))block;

+ (NSURL *)webImageUrlWithPath:(NSString *)path;

+ (void)showNoMoney:(BOOL(^)(OneButtonTipsAlert *alert))okAction;

+ (NSString *)documentsPath;
+ (NSString *)tmpPath;
+ (NSString *)cachesPath;
+ (NSString *)libraryPath;
+ (NSString *)homePath;
@end
