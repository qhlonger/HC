//
//  PltTimerTarget.m
//  LiveApp
//
//  Created by pingguo on 2018/4/8.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "PltTimerTarget.h"

@implementation PltTimerTarget
- (void)pltTimerTargetAction:(NSTimer *)timer
{
    if (self.target) {
        //该方法会在RunLoop为DefaultMode时才会调用，与timer的CommonMode冲突
        //[self.target performSelector:self.selector withObject:timer afterDelay:0.0];
        
        //该方法可以正常在CommonMode中调用，但是会报警告
        //[self.target performSelector:self.selector withObject:timer];
        
        //最终方法
        IMP imp = [self.target methodForSelector:self.selector];
        void (*func)(id, SEL, NSTimer*) = (void *)imp;
        func(self.target, self.selector, timer);
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}
@end
