//
//  Macros.h
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define QFont(x) [UIFont systemFontOfSize:[Utility ptOn47:x]]
//#define EMFont(x) [UIFont fontWithName:@".PingFangSC-Light" size:(NSInteger)(EMiPhonePlus_OR_Later?1.1*x:x)]
#define QBoldFont(x) [UIFont boldSystemFontOfSize:[Utility ptOn47:x]]
#define QSCFont(x) [UIFont fontWithName:@".PingFang-SC-Light" size:[Utility ptOn47:x]]

/** 颜色*/
#define QRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define QRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define Q16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define IsIpx  [Utility isIphoneX]
#define IsIp40 [Utility isIphone40orLow]
#define IsIp47 [Utility isIphone47]
#define IsIp55 [Utility isIphone55]

#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)


#define PtOn40(x) [Utility ptOn40:x]
#define PtOn47(x) [Utility ptOn47:x]
#define PtOn55(x) [Utility ptOn55:x]
#define PtOn58(x) [Utility ptOn58:x]


#define IsLogined [UserManager sharedManager].isLogined
#define LoginedUser [UserManager sharedManager].currentUser


#define StaticGiftView [StaticManager sharedManager].giftView
#define StaticCallView [StaticManager sharedManager].callView

#define OsVersion [[UIDevice currentDevice].systemVersion floatValue]

//#define isLogined [Utility isLogined]


#define minstr(a) [NSString stringWithFormat:@"%@",a]




#endif /* Macros_h */
