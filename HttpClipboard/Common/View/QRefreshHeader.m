//
//  QRefreshHeader.m
//  LiveApp
//
//  Created by pingguo on 2018/3/19.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "QRefreshHeader.h"

@implementation QRefreshHeader
- (void)placeSubviews{
    [super placeSubviews];
    self.arrowView.center = CGPointMake(self.width/2, self.arrowView.center.y);
    self.arrowView.contentMode = UIViewContentModeCenter;
    self.arrowView.clipsToBounds = NO;
    self.arrowView.tintColor = SecondMainColor;
//    self.arrowView.image = [[UIImage imageNamed:@"gengduo"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    for (UIView *v in self.subviews) {
        if (v == self.arrowView) {
            continue;
        }
        if ([v isKindOfClass:[UIActivityIndicatorView class]]) {
            ((UIActivityIndicatorView*)v).center = CGPointMake(self.width/2, self.arrowView.center.y);
            ((UIActivityIndicatorView*)v).color = SecondMainColor;
        }else{
            v.frame = CGRectZero;
        }
    }
}

@end
