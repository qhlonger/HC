//
//  OneButtonTipsAlert.h
//  LiveApp
//
//  Created by pingguo on 2018/3/15.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneButtonTipsAlert : UIView
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSString *btnTitle;


@property(nonatomic, weak) UIView *mainView;
@property(nonatomic, weak) UIView *bgView;
@property(nonatomic, weak) UILabel *titleLabel;
@property(nonatomic, weak) UILabel *messageLabel;
@property(nonatomic, weak) UIView *headerView;
@property(nonatomic, weak) UIView *btnShadowView;
@property(nonatomic, weak) UIButton *button;
@property(nonatomic, weak) UIButton *closeBtn;


@property(nonatomic, copy) BOOL(^btnAction) (OneButtonTipsAlert *alert);
@property(nonatomic, copy) BOOL(^closeAction) (OneButtonTipsAlert *alert);
@property(nonatomic, copy) void(^config) (OneButtonTipsAlert *alert);


- (void)dismiss;
- (void)show;
+ (void)showWithConfig:(void(^)(OneButtonTipsAlert *alert))config;
@end
