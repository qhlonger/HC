//
//  PltTimerTarget.h
//  LiveApp
//
//  Created by pingguo on 2018/4/8.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PltTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

- (void)pltTimerTargetAction:(NSTimer *)timer;
@end
