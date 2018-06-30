//
//  Constants.h
//  Q
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#define BgLightGray QRGB(250,250,250)
#define MainBgGray QRGB(245,245,245)
#define BgDarkGray QRGB(220,220,220)


#define MainBorderColor QRGBA(223,60,82, 0.2)

#define MainColor Q16Color(0xFFD900)
#define MainWhiteColor Q16Color(0xFFFFFF)//QRGB(64,33,72)
#define DarkMainColor QRGB(64,33,72)
#define LightMainColor QRGB(69,38,61)


#define SecondMainColor  Q16Color(0x83C6D4)
//#define SecondMainColor  Q16Color(0x000000)
//QRGB(236,50,141)
#define DarkSecondMainColor Q16Color(0xFFA509)
#define LightSecondMainColor QRGB(236,50,141)


#define MainGradientColor1 Q16Color(0xC2282F)
#define MainGradientColor2 Q16Color(0xFF5B72)

#define TextBlackColor Q16Color(0x333333)
#define TextDarkGrayColor QRGB(100,100,100)
#define TextGrayColor QRGB(150,150,150)
#define TextLightGrayColor QRGB(200,200,200)

#define TabBarTintColor Q16Color(0xdddddd)
#define TabBarSelTintColor  SecondMainColor
#define TabBarBgColor QRGB(255,255,255)

#define SepColor Q16Color(0xE8E8E8)

#define OrangeBgColor Q16Color(0xFAF0E1)

#define BlueBallColor Q16Color(0x3A90D3)
#define RedBallColor Q16Color(0xDF3C52)
#define GrayBallColor TextGrayColor

#define GreenColor Q16Color(0x41A92D)
#define MainPinkColor QRGB(255,0,131)
#define MainYellowColor QRGB(255,205,53)

#define GradientPink SecondMainColor
#define GradientBlue DarkSecondMainColor




#define TitleFont PtOn47(12)


#define StatusBarH CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])
//#define NavBarH CGRectGetHeight([UINavigationBar appearance].frame)
#define BottomPadding (IsIpx ? 34 : 0)

#define TabBarHeight 50
#define NavBarHeight 44

#define SRadius PtOn47(4)
#define MRadius PtOn47(8)
#define LRadius PtOn47(15)

#define RowH PtOn47(44)

#define NormalMargin PtOn47(10)


#define TabBarItemSelImages @[@"tab1",@"tab1",@"tab1"]
#define TabBarItemTitles @[@" ",@" ",@" "]
#define TabBarItemImages @[@"tab1",@"tab1",@"tab1"]

static NSString * const  Key_IsLoginFlag=  @"Key_IsLoginFlag";
static NSString * const  Key_Token = @"Key_Token";
static NSString * const  Key_GameImg = @"Key_GameImg";
static NSString * const  Key_RongCloudToken = @"Key_RongCloudToken";
static NSString * const  Key_AllUserInfo=  @"Key_AllUserInfo";


static NSString * const  Noti_UpdateUserInfo=  @"Noti_UpdateUserInfo";

//static NSString * const  ApiPath = @"http://zgjzywm.com/ozb/public/api";
//static NSString * const  RootPath =  @"http://zgjzywm.com/ozb";
static NSString * const  ApiPath = @"http://192.168.0.218/ozb/api/Public/api";
static NSString * const  RootPath = @"http://192.168.0.218/ozb/";
static NSString * const  AppID =    @"212";




static NSString * const  Key_LastOpenTime = @"Key_LastOpenTime";
//static NSString * const  Key_EaseMob = @"1101171020178343#duomi";


static NSString * const  AgoraSignalKey = @"106c714984394e23afab486119ad7139";
static NSString * const  AgoraMediaKey = @"353346eda12c44daba13786ca81bea06";
//static NSString * const  AgoraSignalKey @"ea00e43bbbe049eb9754d94f9da0e932"
//static NSString * const  AgoraMediaKey  @"353346eda12c44daba13786ca81bea06"


static NSString * const  MsgKey_Time              =    @"MsgKey_Time";
static NSString * const  MsgKey_LiveInfo         =   @"MsgKey_LiveInfo";


static NSString * const  MsgKey_SenderInfo          =  @"MsgKey_SenderInfo";
static NSString * const  MsgKey_ReceiverInfo        =    @"MsgKey_ReceiverInfo";
static NSString * const  MsgKey_GiftInfo           = @"MsgKey_GiftDic";



static NSString * const  MsgKey_MsgType           = @"MsgKey_MsgType";
//static NSString * const  MsgValue_MsgTypeVideoRequest           @"MsgValue_MsgTypeVideoRequest"
//static NSString * const  MsgValue_MsgTypeVideoDeny           @"MsgValue_MsgTypeVideoDeny"
//static NSString * const  MsgValue_MsgTypeVideoAccept           @"MsgValue_MsgTypeVideoAccept"


static NSString * const  MsgKey_CancelCall          =  @"MsgKey_CancelCall";
static NSString * const  MsgKey_OnBusy           = @"MsgKey_OnBusy";
static NSString * const  MsgKey_LeaveChannel           = @"MsgKey_LeaveChannel";


static NSString * const  MsgType_GiftInRoom = @"MsgType_GiftInRoom";
static NSString * const  MsgType_ChatInRoom = @"MsgType_ChatInRoom";
static NSString * const  MsgType_SysLogInRoom = @"MsgType_SysLogInRoom";


static NSString * const  Noti_DidGetHelpImg = @"Noti_DidGetHelpImg";

//登录成功
static NSString * const  Noti_DidLoginSuccess = @"Noti_DidLoginSuccess";
static NSString * const  Noti_DidLogoutSuccess = @"Noti_DidLogoutSuccess";
static NSString * const  Noti_DidLaunchSuccess = @"Noti_DidLaunchSuccess";
//收到消息
static NSString * const  Noti_MessageDidRecive = @"Noti_MessageDidRecive";
static NSString * const  Noti_DidImConnected = @"Noti_DidImConnected";
static NSString * const  Noti_DidImDisconnected = @"Noti_DidImDisconnected";
static NSString * const  Noti_DidJumpIn = @"Noti_DidJumpIn";

//收到视频请求
static NSString * const  Noti_DidReceiveVideoRequest = @"Noti_DidReceiveVideoRequest";
//视频请求被拒绝
static NSString * const  Noti_DidReceiveVideoDeny = @"Noti_DidReceiveVideoDeny";
//视频请求被接受
static NSString * const  Noti_DidReceiveVideoAccept = @"Noti_DidReceiveVideoAccept";
//对方离开视频房间
static NSString * const  Noti_OtherSideLeaveRoom = @"Noti_OtherSideLeaveRoom";


//余额不足
static NSString * const  Noti_VideoChargeStateNoEnoughMoney = @"Noti_VideoChargeStateNoEnoughMoney";
//参数错误
static NSString * const  Noti_VideoChargeStateArgError = @"Noti_VideoChargeStateArgError";
//权限错误
static NSString * const  Noti_VideoChargeStateAuthError = @"Noti_VideoChargeStateAuthError";
//未知错误
static NSString * const  Noti_VideoChargeStateUnknowError = @"Noti_VideoChargeStateUnknowError";
//正常扣费
static NSString * const  Noti_VideoChargeStateNormal = @"Noti_VideoChargeStateNormal";
//3次扣费失败
static NSString * const  Noti_VideoChargeError3Times = @"Noti_VideoChargeError3Times";



static NSString * const  CustomMessageTypeGift = @"CustomMessageTypeGift";
static NSString * const  CustomMessageTypeVideoCall = @"CustomMessageTypeVideoCall";
static NSString * const  CustomMessageTypeChatRoom = @"CustomMessageTypeChatRoom";
#endif /* Constants_h */
