//
//  Utility.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "Utility.h"
#import <sys/utsname.h>
#import "PltTimerTarget.h"
//#import "LoginVC.h"
@implementation Utility


+ (BOOL)isIphoneX{
    return [[Utility platform] isEqualToString:@"iPhone X"];
}
+ (BOOL)isIphone40orLow{
    return ([[Utility platform] isEqualToString:@"iPhone 5"] ||
            [[Utility platform] isEqualToString:@"iPhone 5c"] ||
            [[Utility platform] isEqualToString:@"iPhone 5s"] ||
            [[Utility platform] isEqualToString:@"iPhone SE"]);
}
+ (BOOL)isIphone47{
    return ([[Utility platform] isEqualToString:@"iPhone 6"] ||
            [[Utility platform] isEqualToString:@"iPhone 6s"] ||
            [[Utility platform] isEqualToString:@"iPhone 7"] ||
            [[Utility platform] isEqualToString:@"iPhone 8"]);
}
+ (BOOL)isIphone55{
    return ([[Utility platform] isEqualToString:@"iPhone 6 Plus"] ||
            [[Utility platform] isEqualToString:@"iPhone 6s Plus"] ||
            [[Utility platform] isEqualToString:@"iPhone 7 Plus"] ||
            [[Utility platform] isEqualToString:@"iPhone 8 Plus"]);
}

+ (NSString *)platform {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro (12.9 inch)";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro (12.9 inch)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}







+ (void)showStatus:(NSString *)status{
    NSLog(@"LALog %@",status);
    [SVProgressHUD showInfoWithStatus:status];
}
+ (void)showSuccess:(NSString *)status{
    NSLog(@"LALog %@",status);
    [SVProgressHUD showSuccessWithStatus:status];
}
+ (void)showError:(NSString *)status{
    NSLog(@"LALog %@",status);
    [SVProgressHUD showErrorWithStatus:status];
}

+ (void)showProgress:(CGFloat)progress withStatus:(NSString *)string{
    [SVProgressHUD showProgress:progress status:string];
}
+ (void)showProgressWithProgress:(NSProgress *)progress withStatus:(NSString *)string{
    [SVProgressHUD showProgress:(1.0 * progress.completedUnitCount / progress.totalUnitCount) status:string];
}
+ (void)showHUD{
    [SVProgressHUD show];
}
+ (void)dismissHUD{
    [SVProgressHUD dismiss];
}


+ (NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}


+ (NSArray <NSString *>*)getSubstringFromString:(NSString *)str validate:(NSString *)pattern{
    
    
    
    //根据正则表达式设定OC规则
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results = [regular matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //NSLog(@"%@",results);
    //遍历结果
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in results) {
        
        for (int i = 0; i < [match numberOfRanges]; i++) {
            //以正则中的(),划分成不同的匹配部分
            NSString *component = [str substringWithRange:[match rangeAtIndex:i]];
            
            [array addObject:component];
            
        }
        
    }
    
    return array;
}

#pragma mark ----------     获取顶层VC
+ (UIViewController *)getCurrentVC{
//    UIViewController *result = nil;
//
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    if (window.windowLevel != UIWindowLevelNormal)
//    {
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        for(UIWindow * tmpWin in windows)
//        {
//            if (tmpWin.windowLevel == UIWindowLevelNormal)
//            {
//                window = tmpWin;
//                break;
//            }
//        }
//    }
//
//    UIView *frontView = [[window subviews] objectAtIndex:0];
//    id nextResponder = [frontView nextResponder];
//
//    if ([nextResponder isKindOfClass:[UIViewController class]])
//        result = nextResponder;
//    else
//        result = window.rootViewController;
//
//    return result;
        UIViewController *resultVC;
        resultVC = [Utility topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
        while (resultVC.presentedViewController) {
            resultVC = [Utility topViewController:resultVC.presentedViewController];
        }
    return resultVC;
}
+ (UIViewController *)topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
}

+ (CGFloat)getRatioWithMax:(CGFloat)max min:(CGFloat)min mid:(CGFloat)mid{
    return (mid - min) / (max - min);
}

/**
 根据最大 最小 比例 获取 中间值
 
 @param max   最大
 @param min   最小
 @param ratio 比例
 
 @return 中间值
 */
+ (CGFloat)getMidWithMax:(CGFloat)max min:(CGFloat)min ratio:(CGFloat)ratio{
    return (max - min) * ratio + min;
}
+ (CGRect)getRectWithMaxRect:(CGRect)maxRect minRect:(CGRect)minRect Ratio:(CGFloat)ratio{
    return CGRectMake([Utility getMidWithMax:maxRect.origin.x       min:minRect.origin.x    ratio:ratio],
                      [Utility getMidWithMax:maxRect.origin.y       min:minRect.origin.y    ratio:ratio],
                      [Utility getMidWithMax:maxRect.size.width     min:minRect.size.width  ratio:ratio],
                      [Utility getMidWithMax:maxRect.size.height    min:minRect.size.height ratio:ratio]);
}
+ (UIImage *)SnapView:(UIView *)view{
    UIGraphicsBeginImageContext(view.frame.size);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (CGRect)frame:(CGRect)frame byInsets:(UIEdgeInsets)insets{
    return CGRectMake(frame.origin.x + insets.left, frame.origin.y + insets.top, frame.size.width - insets.left - insets.right, frame.size.height - insets.top-insets.bottom);
}
+ (UIImage *)levelImgWithLevel:(NSString *)level{
    return [UIImage imageNamed:[NSString stringWithFormat:@"level_%@",level]];
}

+ (NSString *)jsonStringFromDict:(NSDictionary *)dic{
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+ (NSDictionary *)dictFromJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
    
}
+ (void)ifLoginDo:(void(^)(void))doThing{
    if(!IsLogined){
        [self showNeedLoginTips];
    }else{
        if(doThing)
            doThing();
    }
}
+ (void)showNeedLoginTips{
    [QAlertView showWithTitle:@"需要登录" info:@"当前内容需要登录才能正常访问"
                    leftTitle:@"取消" rightTitle:@"去登录"
                       config:^(QAlertView *alertView) {
                           
                       } leftAction:^BOOL(QAlertView *alertView) {
                           return YES;
                       } rightAction:^BOOL(QAlertView *alertView) {
                           [Utility toLoginVC];
                           return YES;
                       }];
    
}
//数字逗号分隔

+ (NSString *)countNumAndChangeformat:(NSString *)str{
    NSString *intStr;
    NSString *floStr;
    if ([str containsString:@"."]) {
        NSRange range = [str rangeOfString:@"."];
        floStr = [str substringFromIndex:range.location];
        intStr = [str substringToIndex:range.location];
    }else{
        floStr = @"";
        intStr = str;
    }
    if (intStr.length <=3) {
        return [intStr stringByAppendingString:floStr];
    }else{
        NSInteger length = intStr.length;
        NSInteger count = length/3;
        NSInteger y = length%3;
        NSString *tit = [intStr substringToIndex:y] ;
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
        for (int i =0; i < count; i ++) {
            NSInteger index = i + i *3;
            [det insertString:@","atIndex:index];
        }
        if (y ==0) {
            det = [[det substringFromIndex:1]mutableCopy];
        }
        intStr = [tit stringByAppendingString:det];
        return [intStr stringByAppendingString:floStr];
    }
}

+ (UITextField *)normalTextField{
    UITextField *textField = [[UITextField alloc]init];
    
    textField.backgroundColor = [UIColor whiteColor];
    textField.font = QFont(15);
    textField.textColor = TextBlackColor;
    textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
+ (BOOL)isString:(NSString *)string validate:(NSString *)pattern{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:string];
}
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo
{
    PltTimerTarget *timerTarget = [[PltTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:timerTarget selector:@selector(pltTimerTargetAction:) userInfo:userInfo repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    timerTarget.timer = timer;
    return timerTarget.timer;
}


+ (UIFont *)equalWidthFontWithSize:(NSInteger)size{
    return [UIFont fontWithName:@"_typewriter" size:size];
}

//+ (NSURL *)getImgUrl:(NSString *)urlStr{
//    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",RootPath, urlStr]];
//}



+ (CGFloat)ptOn40:(CGFloat)pt{
    return pt / 320 * CGRectGetWidth([UIScreen mainScreen].bounds);
}
+ (CGFloat)ptOn47:(CGFloat)pt{
    return pt / 375 * CGRectGetWidth([UIScreen mainScreen].bounds);
}
+ (CGFloat)ptOn55:(CGFloat)pt{
    return pt / 540 * CGRectGetWidth([UIScreen mainScreen].bounds);
}
+ (CGFloat)ptOn58:(CGFloat)pt{
    return pt / 562.5 * CGRectGetWidth([UIScreen mainScreen].bounds);
}

+ (void)toLoginVC{
    
//    [[Utility getCurrentVC] presentViewController:[[BaseNavVC alloc]initWithRootViewController:[[LoginVC alloc]init]] animated:YES completion:nil];
}

+ (BOOL)joinGroup:(NSString *)groupUin key:(NSString *)key{
    NSString *urlStr = [NSString stringWithFormat:@"mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&key=%@&card_type=group&source=external", groupUin,key];
    NSURL *url = [NSURL URLWithString:urlStr];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    else return NO;
}

+ (BOOL)toWechatScan{
    NSURL *url = [NSURL URLWithString:@"weixin://scanqrcode/"];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    return NO;
}
+ (BOOL)toWechat{
    NSURL *url = [NSURL URLWithString:@"weixin://"];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    return NO;
}
+ (BOOL)toWechatAddFriends{
    NSURL *url = [NSURL URLWithString:@"weixin://dl/add"];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    return NO;
}
+ (void)callWithPhoneNumber:(NSString *)number{
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",number];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
}
+ (BOOL)toQQ{
    NSURL *url = [NSURL URLWithString:@"mqqapi://"];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    return NO;
}


+ (UITextField *)loginTfWithImg:(NSString *)img placeholder:(NSString *)holder {
    UITextField *tf = [[UITextField alloc]init];
    tf.placeholder = holder;
    tf.font = QFont(14);
    tf.backgroundColor = [UIColor whiteColor];
    tf.layer.cornerRadius = SRadius;
    tf.tintColor = SecondMainColor;
    tf.clipsToBounds = YES;
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    iv.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.tintColor = BgDarkGray;
    
    tf.leftView = iv;
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    return tf;
}


+ (void)saveDefaultValue:(id)value forKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:key];
    [defaults synchronize];
}
+ (id)getDefaultWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id obj = [defaults valueForKey:key];
    [defaults synchronize];
    return obj;
}
+ (void)removeValueForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}
+ (BOOL)haveValueForKey:(NSString *)key{
    if ([Utility getDefaultWithKey:key])
        return YES;
    return NO;
}
+ (NSString *)getToken{
    return @"";
//    return LoginedUser.token;
}

+ (void)saveLastOpenTime{
    
    [Utility saveDefaultValue:[NSDate date].getMSStamp forKey:Key_LastOpenTime];
}
+ (BOOL)checkLastOpenTime{
    NSNumber *number = [Utility getDefaultWithKey:Key_LastOpenTime];
    NSNumber *nowStamp = [NSDate date].getMSStamp;
    return [nowStamp integerValue] - [number integerValue] < 1000*60*60*24*15;
}

+ (MJRefreshNormalHeader *)normalHeaderWithBlock:(void(^)(void))block{
    MJRefreshNormalHeader *header =[[MJRefreshNormalHeader alloc]init];
    [header setRefreshingBlock:block];
    header.stateLabel.textColor = SecondMainColor;
    UIActivityIndicatorView *loadingView = [header valueForKey:@"loadingView"];
    loadingView.color = SecondMainColor;
    header.arrowView.tintColor = SecondMainColor;
    header.arrowView.image = [[UIImage imageNamed:@"ref_c"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
//    [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    return header;
}

+ (MJRefreshAutoNormalFooter *)normalFooterWithBlock:(void(^)(void))block{
    MJRefreshAutoNormalFooter *footer = [[MJRefreshAutoNormalFooter alloc]init];
//    footer.actIndicator.color = SecondMainColor;
    [footer setRefreshingBlock:block];
    footer.stateLabel.textColor = TextGrayColor;
    footer.stateLabel.font = QFont(13);
//    [MJRefreshAutoFooter footerWithRefreshingBlock:block];
    
    return footer;
}
+ (NSURL *)webImageUrlWithPath:(NSString *)path{
    path = [path stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    if(![path hasPrefix:@"http:"])
        path = [NSString stringWithFormat:@"%@%@",RootPath,path];
    return [NSURL URLWithString:path];
}
+ (void)showNoMoney:(BOOL(^)(OneButtonTipsAlert *alert))okAction{
    [OneButtonTipsAlert showWithConfig:^(OneButtonTipsAlert *alert) {
        alert.messageLabel.text = @"立即充值，视频交友畅通无阻！";
        alert.titleLabel.text = @"余额不足";
        [alert.button setTitle:@"前往充值" forState:UIControlStateNormal];
        [alert setBtnAction:okAction];
        [alert setCloseAction:^BOOL(OneButtonTipsAlert *alert) {
            return YES;
        }];
    }];
}

+ (NSString *)documentsPath{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)tmpPath{
    return NSTemporaryDirectory();
}
+ (NSString *)cachesPath{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)libraryPath{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}
+ (NSString *)homePath{
    return NSHomeDirectory();
}



@end
