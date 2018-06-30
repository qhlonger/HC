//
//  StaticManager.m
//  LiveApp
//
//  Created by pingguo on 2018/3/22.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "StaticManager.h"

@implementation StaticManager

+ (instancetype)sharedManager{
    static StaticManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[StaticManager alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.videoState = VideoStateOnIdle;
    }
    return self;
}
- (LoadingView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[LoadingView alloc]init];
    }
    return _loadingView;
}



@end
