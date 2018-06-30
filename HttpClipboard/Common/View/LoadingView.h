//
//  LoadingView.h
//  LiveApp
//
//  Created by pingguo on 2018/5/2.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property(nonatomic, weak) UIImageView *iconView;
@property(nonatomic, weak) UIActivityIndicatorView *actView;
- (void)show;
- (void)hide;
@end
