//
//  LoadingView.m
//  LiveApp
//
//  Created by pingguo on 2018/5/2.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView
- (void)show{
    UIWindow *window=((AppDelegate*)[[UIApplication sharedApplication] delegate]).window;
    self.frame =window.bounds;
    [window addSubview:self];
    
    self.alpha = 0;
    [self.actView startAnimating];
    self.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.actView stopAnimating];
        self.userInteractionEnabled = NO;
    }];
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview];
        [self layout];
        self.backgroundColor = Q16Color(0xffe42c);
    }
    return self;
}
- (void)addSubview{
    [self iconView];
    [self actView];
}
- (void)layout{
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(0.8);
        make.width.height.mas_equalTo(150);
    }];
    [self.actView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(1.4);
    }];
    
    
}
- (UIImageView *)iconView{
    if (!_iconView) {
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"login_logo"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:iconView];
        _iconView = iconView;
    }
    return _iconView;
}
- (UIActivityIndicatorView *)actView{
    if (!_actView) {
        UIActivityIndicatorView *actView = [[UIActivityIndicatorView alloc]init];
        actView.color = Q16Color(0xff108c);
        actView.hidesWhenStopped = YES;
        [self addSubview:actView];
        _actView = actView;
    }
    return _actView;
}
@end
