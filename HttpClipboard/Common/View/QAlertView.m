//
//  QAlertView.m
//  Q
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "QAlertView.h"
#define QAlertBtnBoarder 1
#define QAlertWidth 300

@implementation QAlertView

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        
//        [AppHelper helper].alertWindow.windowLevel = UIWindowLevelStatusBar + 1;
//        [[AppHelper helper].alertWindow makeKeyAndVisible];
//        [[AppHelper helper].alertWindow addSubview:self];
//        self.frame = [AppHelper helper].alertWindow.bounds;
//        
//        self.tapBack = YES;
//        self.showTextField = NO;
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [AppHelper helper].alertWindow.windowLevel = UIWindowLevelStatusBar + 1;
//        [[AppHelper helper].alertWindow makeKeyAndVisible];
//        [[AppHelper helper].alertWindow addSubview:self];
//        self.frame = [AppHelper helper].alertWindow.bounds;
        
        
        UIWindow *window=((AppDelegate*)[[UIApplication sharedApplication] delegate]).window;
        self.frame =window.bounds;
        [window addSubview:self];
        self.userInteractionEnabled = YES;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
        self.tapBack = YES;
        self.showTextField = NO;
    }
    return self;
}
- (void)keyboardWillShow:(NSNotification *)notification {
    self.isEditing = YES;
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [self viewAnimationWithKeyboardheight:keyboardRect.size.height duration:animationDuration];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    self.isEditing = NO;
    NSDictionary* userInfo = [notification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [self viewAnimationWithKeyboardheight:0.f duration:animationDuration];
    //    [self moveInputBarWithKeyboardHeight:0.0 withDuration:animationDuration];
}
- (void)viewAnimationWithKeyboardheight:(CGFloat)height duration:(NSTimeInterval)dura{
    if(self.isEditing){
        [self editLayout];
    }else{
        [self notEditLayout];
    }
    [self setNeedsLayout];
    [UIView animateWithDuration:dura delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self layoutIfNeeded];
         self.textField.layer.borderColor  = self.isEditing ? SecondMainColor.CGColor : SepColor.CGColor;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)editLayout{
    [self.mainView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).multipliedBy(1);
        make.centerY.equalTo(self).multipliedBy(0.75);
        make.width.mas_equalTo(QAlertWidth);
        if(self.leftTitle || self.rightTitle){
            //            make.bottom.equalTo(self.leftBtn.mas_bottom);
        }else if(!self.leftTitle && !self.rightTitle){
            if(self.showTextField){
                make.bottom.equalTo(self.textField.mas_bottom).offset(NormalMargin);
            }else{
                if(self.info){
                    make.bottom.equalTo(self.infoLabel.mas_bottom).offset(NormalMargin);
                }else{
                    make.bottom.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
                }
            }
        }
        //        make.height.mas_equalTo(120);
    }];
}
- (void)notEditLayout{
    [self.mainView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).multipliedBy(1);
        make.centerY.equalTo(self).multipliedBy(1);
        make.width.mas_equalTo(QAlertWidth);
        if(self.leftTitle || self.rightTitle){
            //            make.bottom.equalTo(self.leftBtn.mas_bottom);
        }else if(!self.leftTitle && !self.rightTitle){
            if(self.showTextField){
                make.bottom.equalTo(self.textField.mas_bottom).offset(NormalMargin);
            }else{
                if(self.info){
                    make.bottom.equalTo(self.infoLabel.mas_bottom).offset(NormalMargin);
                }else{
                    make.bottom.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
                }
            }
        }
        //        make.height.mas_equalTo(120);
    }];
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
- (void)tap{
    [self dismiss];
}
- (void)dismiss{
    
    
    [UIView animateWithDuration:0.3f delay:0 usingSpringWithDamping:10 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        [self dissmissLayout];
        self.bgView.backgroundColor = QRGBA(0, 0, 0, 0);
        self.mainView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        self.mainView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
//        [[AppHelper helper].alertWindow.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        [AppHelper helper].alertWindow.windowLevel = UIWindowLevelNormal;
//        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        [app.window makeKeyAndVisible];
    }];
}
- (void)show{
    [self doConfigBeforeShow];
//    [[AppHelper helper].alertWindow makeKeyAndVisible];
    self.mainView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    [UIView animateWithDuration:0.125 animations:^{
        self.bgView.backgroundColor = QRGBA(0, 0, 0, 0.15);
        self.mainView.alpha = 0.5;
        self.mainView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.125 animations:^{
            self.bgView.backgroundColor = QRGBA(0, 0, 0, 0.3);
            self.mainView.alpha = 1;
            self.mainView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            if(self.didShow)self.didShow(self);
        }];
    }];
}
- (void)addSubview{
    [self bgView];
    [self mainView];
    [self titleLabel];
    [self infoLabel];
    [self leftBtn];
    [self rightBtn];
    
}

- (void)doLayout{
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}
- (UIView *)bgView{
    if(!_bgView){
        UIView *bg = [[UIView alloc]init];
        bg.backgroundColor = QRGBA(0, 0, 0, 0);
        [bg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)]];
        [self addSubview:bg];
        _bgView = bg;
    }
    return _bgView;
}
- (UIView *)mainView{
    if(!_mainView){
        UIView *main = [[UIView alloc]init];
        main.backgroundColor = [UIColor whiteColor];
        main.layer.cornerRadius = PtOn47(2);
        main.clipsToBounds = YES;
        
        [self addSubview:main];
        _mainView = main;
    }
    return _mainView;
}
- (UIButton *)leftBtn{
    if(!_leftBtn){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderWidth = QAlertBtnBoarder;
        btn.layer.borderColor = SepColor.CGColor;
        //        [btn setBackgroundImage:[UIImage imageWithColor:MainColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:MainBgGray] forState:UIControlStateHighlighted];
        [btn setTitleColor:SecondMainColor forState:UIControlStateNormal];
        btn.titleLabel.font = QFont(15);
        __weak __typeof(self)weakSelf = self;
        [btn bk_addEventHandler:^(id sender) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            if(strongSelf.leftAction)
            if(strongSelf.leftAction(strongSelf))
            [strongSelf dismiss];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [self.mainView addSubview:btn];
        _leftBtn = btn;
    }
    return _leftBtn;
}
- (UIButton *)rightBtn{
    if(!_rightBtn){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderWidth = QAlertBtnBoarder;
        btn.layer.borderColor = SepColor.CGColor;
//        [btn setBackgroundImage:[UIImage imageWithColor:MainColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:MainBgGray] forState:UIControlStateHighlighted];
        [btn setTitleColor:SecondMainColor forState:UIControlStateNormal];
        btn.titleLabel.font = QFont(15);
        
        __weak __typeof(self)weakSelf = self;
        [btn bk_addEventHandler:^(id sender) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            if(strongSelf.rightAction)
            if(strongSelf.rightAction(strongSelf))
            [strongSelf dismiss];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:btn];
        _rightBtn = btn;
    }
    return _rightBtn;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *title = [[UILabel alloc]init];
        title.font = QBoldFont(16);
        title.textColor = TextBlackColor;
        [self.mainView addSubview:title];
        _titleLabel = title;
    }
    return _titleLabel;
}
- (UILabel *)infoLabel{
    if (!_infoLabel) {
        UILabel *title = [[UILabel alloc]init];
        title.numberOfLines = 0;
        title.lineBreakMode = NSLineBreakByWordWrapping;
        title.font = QFont(14);
        title.textColor = TextGrayColor;
        [self.mainView addSubview:title];
        _infoLabel = title;
    }
    return _infoLabel;
}
- (UITextField *)textField{
    if(!_textField){
        UITextField *tf = [[UITextField alloc]init];
        tf.layer.borderColor = SepColor.CGColor;
        tf.layer.borderWidth = 0.5;
        tf.layer.cornerRadius = 6;
        tf.tintColor = SecondMainColor;
        [self.mainView addSubview:tf];
        _textField = tf;
    }
    return _textField;
}
- (UIView *)topLine{
    if (!_topLine) {
        UIView *v = [[UIView alloc]init];
        v.backgroundColor = SecondMainColor;
        [self.mainView addSubview:v];
        _topLine = v;
    }
    return _topLine;
}

- (void)doConfigBeforeDismiss{
    
}
- (void)doConfigBeforeShow{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.mainView.alpha = 0;

    if(self.config)self.config(self);

    if(self.title){
        self.titleLabel.text= self.title;

    }
    if(self.info){
        self.infoLabel.text = self.info;

    }
    if(self.leftTitle)
        [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
    if(self.rightTitle)
        [self.rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];



//    self.infoLabel.backgroundColor = [UIColor redColor];
//    self.titleLabel.backgroundColor = [UIColor greenColor];

    
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.mainView);
        make.height.mas_equalTo(self.showTopLine ? 4 : 4);
    }];
    

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView);
        make.left.greaterThanOrEqualTo(self.mainView).offset(0);
        make.top.equalTo(self.topLine.mas_bottom).offset(NormalMargin);
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView);
        make.left.greaterThanOrEqualTo(self.mainView).offset(NormalMargin);
        if(self.title && self.info){
            make.top.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
        }else{
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
        }
    }];
    CGFloat offset = PtOn47(10);
    if(self.showTextField){
//        self.textField.backgroundColor = [UIColor blueColor];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mainView).offset(NormalMargin*2);
            make.centerX.equalTo(self.mainView);
            make.top.equalTo(self.infoLabel.mas_bottom).offset(NormalMargin);
            make.height.mas_equalTo(RowH*0.8);
        }];
        offset = RowH*0.8 +10 * 2;
    }
    CGFloat h = PtOn47(40), leftW = 0.5, rightW = 0.5;
    if(self.leftTitle && self.rightTitle){
        leftW = 0.5;
        rightW = 0.5;
    }else if(self.leftTitle && !self.rightTitle){
        leftW = 1;
        rightW = 0;
    }else if(!self.leftTitle && self.rightTitle){
        leftW = 0;
        rightW = 1;
    }else{
        h = 0;
        leftW = 0;
        rightW = 0;


    }
    if(self.leftTitle){
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoLabel.mas_bottom).offset(offset);
            make.left.equalTo(self.mainView).offset(-QAlertBtnBoarder);
            make.bottom.equalTo(self.mainView).offset(QAlertBtnBoarder);
            make.height.mas_equalTo(h);
            if(leftW == 1){
                make.right.equalTo(self.mainView).offset(1);
            }else{
                make.width.equalTo(self.mainView).multipliedBy(leftW);
            }

        }];
    }
    if(self.rightTitle){
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoLabel.mas_bottom).offset(offset);
            
            make.right.equalTo(self.mainView).offset(QAlertBtnBoarder);
            make.bottom.equalTo(self.leftBtn);

            make.height.mas_equalTo(h);
//            make.width.equalTo(self.mainView).multipliedBy(rightW);
            make.left.equalTo(self.leftBtn.mas_right).offset(-QAlertBtnBoarder);
        }];
    }

    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).multipliedBy(1);
        make.centerY.equalTo(self).multipliedBy(1);
        make.width.mas_equalTo(QAlertWidth);
        if(self.leftTitle || self.rightTitle){
//            make.bottom.equalTo(self.leftBtn.mas_bottom);
        }else if(!self.leftTitle && !self.rightTitle){
            if(self.showTextField){
                make.bottom.equalTo(self.textField.mas_bottom).offset(NormalMargin);
            }else{
                if(self.info){
                    make.bottom.equalTo(self.infoLabel.mas_bottom).offset(NormalMargin);
                }else{
                    make.bottom.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
                }
            }
        }
//        make.height.mas_equalTo(120);
    }];
    
    
}


+ (void)showWithTitle:(NSString *)title
                 info:(NSString *)info
            leftTitle:(NSString *)leftTitle
           rightTitle:(NSString *)rightTitle
               config:(void(^)(QAlertView *alertView))config
           leftAction:(BOOL(^)(QAlertView *alertView))leftAction
          rightAction:(BOOL(^)(QAlertView *alertView))rightAction{
    QAlertView *alert = [[QAlertView alloc]init];
    alert.title = title;
    alert.info = info;
    alert.leftTitle = leftTitle;
    alert.rightTitle = rightTitle;
    alert.leftAction = leftAction;
    alert.rightAction = rightAction;
    alert.config = config;
    [alert show];
}

+ (void)showWithConfig:(void(^)(QAlertView *alertView))config{
    QAlertView *alert = [[QAlertView alloc]init];
    alert.config = config;
    [alert show];
}


@end
