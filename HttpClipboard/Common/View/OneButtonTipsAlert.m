//
//  OneButtonTipsAlert.m
//  LiveApp
//
//  Created by pingguo on 2018/3/15.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "OneButtonTipsAlert.h"

@implementation OneButtonTipsAlert


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIWindow *window=((AppDelegate*)[[UIApplication sharedApplication] delegate]).window;
        self.frame =window.bounds;
        [window addSubview:self];
        [self addSubview];
        [self layout];
        
    }
    return self;
}

- (void)addSubview{
    [self bgView];
    [self mainView];
    [self headerView];
    [self titleLabel];
    [self messageLabel];
    [self closeBtn];
    [self btnShadowView];
    [self button];
    
}

- (void)layout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.7);
    }];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.mainView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView);
        make.top.equalTo(self.headerView).offset(NormalMargin);
        make.width.lessThanOrEqualTo(self.mainView).offset(-NormalMargin*2);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
        make.width.lessThanOrEqualTo(self.mainView).offset(-NormalMargin*2);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(-NormalMargin);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView.mas_right).offset(-PtOn47(10));
        make.centerY.equalTo(self.mainView.mas_top).offset(PtOn47(10));
        make.width.height.mas_equalTo(PtOn47(40));
    }];
    [self.btnShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.headerView.mas_bottom).offset(NormalMargin*2);
        make.left.equalTo(self.mainView).offset(NormalMargin*2);
        make.right.equalTo(self.mainView).offset(-NormalMargin*2);
        make.bottom.equalTo(self.mainView.mas_bottom).offset(-NormalMargin*2);
        make.height.mas_equalTo(PtOn47(50));
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.btnShadowView);
    }];
    
}

+ (void)showWithConfig:(void(^)(OneButtonTipsAlert *alert))config{
    OneButtonTipsAlert *alert = [[OneButtonTipsAlert alloc]init];
    alert.config = config;
    [alert show];
}
- (void)dismiss{
    
    
    [UIView animateWithDuration:0.6f
                          delay:0
         usingSpringWithDamping:10
          initialSpringVelocity:8
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
        //        [self dissmissLayout];
                            self.bgView.backgroundColor = QRGBA(0, 0, 0, 0);
                            self.mainView.transform = CGAffineTransformMakeScale(0.7, 0.7);
                            self.closeBtn.transform = CGAffineTransformMakeScale(0.7, 0.7);
                            self.mainView.alpha = 0;
                            self.closeBtn.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        //        [[AppHelper helper].alertWindow.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        //        [AppHelper helper].alertWindow.windowLevel = UIWindowLevelNormal;
        //        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //        [app.window makeKeyAndVisible];
    }];
}
- (void)show{
//    [self doConfigBeforeShow];
    //    [[AppHelper helper].alertWindow makeKeyAndVisible];
    if(self.config)self.config(self);
    self.mainView.alpha = 0;
    self.closeBtn.alpha = 0;
    self.mainView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    self.closeBtn.transform = CGAffineTransformMakeScale(0.7, 0.7);
    [UIView animateWithDuration:0.2 animations:^{
        self.bgView.backgroundColor = QRGBA(0, 0, 0, 0.3);
        self.mainView.alpha = 0.5;
        self.closeBtn.alpha = 0.5;
        self.mainView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        self.closeBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.bgView.backgroundColor = QRGBA(0, 0, 0, 0.3);
            self.mainView.alpha = 1;
            self.closeBtn.alpha = 1;
            self.mainView.transform = CGAffineTransformMakeScale(1, 1);
            self.closeBtn.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            
        }];
    }];
}


- (UIView *)bgView{
    if (!_bgView) {
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = QRGBA(0, 0, 0, 0);
        [self addSubview:bgView];
        _bgView = bgView;
    }
    return _bgView;
}
- (UIView *)mainView{
    if (!_mainView) {
        UIView *mainView = [[UIView alloc]init];
        mainView.backgroundColor = [UIColor whiteColor];
        mainView.layer.cornerRadius = PtOn47(30);
        mainView.clipsToBounds = YES;
        [self addSubview:mainView];
        _mainView = mainView;
    }
    return _mainView;
}
- (UIView *)headerView{
    if (!_headerView) {
        
        UIView *headerView = [[UIView alloc]init];
        headerView.backgroundColor = TextBlackColor;
        [self.mainView addSubview:headerView];
        _headerView = headerView;
    }
    return _headerView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.numberOfLines = 0;
        titleLabel.font = QBoldFont(16);
        titleLabel.textColor = [UIColor whiteColor];
        [self.mainView  addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
- (UILabel *)messageLabel{
    if (!_messageLabel) {
        
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.numberOfLines = 0;
        messageLabel.font = QFont(14);
        messageLabel.textColor = MainYellowColor;
        [self.mainView  addSubview:messageLabel];
        _messageLabel = messageLabel;
    }
    return _messageLabel;
}
- (UIView *)btnShadowView{
    if (!_btnShadowView) {
        UIView *btnShadowView = [[UIView alloc]init];
        btnShadowView.layer.cornerRadius = PtOn47(25);
        
        btnShadowView.layer.shadowOpacity = 1;
        btnShadowView.layer.shadowRadius = 8;
        btnShadowView.layer.shadowColor = QRGBA(0, 0, 0, 0.2).CGColor;
        btnShadowView.layer.shadowOffset = CGSizeMake(1, 1);
        
        [self.mainView addSubview:btnShadowView];
        _btnShadowView = btnShadowView;
    }
    return _btnShadowView;
}
- (UIButton *)button{
    if (!_button) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        __weak __typeof(self)weakSelf = self;
        [button bk_whenTapped:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            if(strongSelf.btnAction)
                if(strongSelf.btnAction(self))
                    [strongSelf dismiss];
        }];
        
        button.layer.cornerRadius = PtOn47(25);
        button.clipsToBounds = YES;
        button.titleLabel.font = QBoldFont(18);
        [button setTitleColor:TextBlackColor forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:MainYellowColor] forState:UIControlStateNormal];
        [self.mainView  addSubview:button];
        _button = button;
    }
    return _button;
}
- (UIButton *)closeBtn{
    if (!_closeBtn) {
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        __weak __typeof(self)weakSelf = self;
        [closeBtn bk_whenTapped:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            if(strongSelf.closeAction)
                if(strongSelf.closeAction(self))
                    [strongSelf dismiss];
        }];
        
        closeBtn.layer.cornerRadius = PtOn47(20);
        closeBtn.clipsToBounds = YES;
        [closeBtn setImage:[UIImage imageNamed:@"live_close"] forState:UIControlStateNormal];
        [closeBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]] forState:UIControlStateNormal];
        [self addSubview:closeBtn];
        _closeBtn = closeBtn;
    }
    return _closeBtn;
}



@end
