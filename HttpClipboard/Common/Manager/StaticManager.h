//
//  StaticManager.h
//  LiveApp
//
//  Created by pingguo on 2018/3/22.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTabBar.h"
#import "LoadingView.h"
//typedef NS_ENUM(NSInteger, VideoState){
//    VideoStateOnIdle,//空闲中
//    VideoStateOnRquest,//正在请求视频中
//    VideoStateOnReceiveRequest,//接收到视频请求
//    VideoStateOnVideo,//正在视频
//} ;
@interface StaticManager : NSObject

+ (instancetype)sharedManager;


//@property(nonatomic, assign) VideoState videoState;


@property(nonatomic, strong) LoadingView *loadingView;
@property(nonatomic, strong) QTabBar *customTabbar;
@property(nonatomic, copy) NSString *lastUrl;
@end
