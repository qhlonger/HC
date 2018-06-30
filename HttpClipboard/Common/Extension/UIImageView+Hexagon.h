//
//  UIImageView+Hexagon.h
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Hexagon)
- (instancetype)initWithDrawHexagonWithImageViewWidth:(CGFloat)width withLineWidth:(CGFloat)lineWidth withStrokeColor:(UIColor *)color;

@end
