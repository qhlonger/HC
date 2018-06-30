//
//  QAlertView.h
//  Q
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QAlertView : UIView



@property(nonatomic, weak) UILabel *titleLabel;
@property(nonatomic, weak) UILabel *infoLabel;
@property(nonatomic, weak) UIButton *leftBtn;
@property(nonatomic, weak) UIButton *rightBtn;
@property(nonatomic, weak) UIView *mainView;
@property(nonatomic, weak) UITextField *textField;

@property(nonatomic, weak) UIView *bgView;
@property(nonatomic, weak) UIView *topLine;



@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *info;
@property(nonatomic, copy) NSString *leftTitle;
@property(nonatomic, copy) NSString *rightTitle;
@property(nonatomic, assign) BOOL tapBack;
@property(nonatomic, assign) BOOL showTextField;
@property(nonatomic, assign) BOOL showTopLine;
@property(nonatomic, copy) BOOL(^leftAction)(QAlertView *alertView);
@property(nonatomic, copy) BOOL(^rightAction)(QAlertView *alertView);
@property(nonatomic, copy) void(^config)(QAlertView *alertView);

@property(nonatomic, copy) void(^didShow)(QAlertView *alertView);


@property (nonatomic, assign)BOOL isEditing;


+ (void)showWithTitle:(NSString *)title
                 info:(NSString *)info
            leftTitle:(NSString *)leftTitle
           rightTitle:(NSString *)rightTitle
               config:(void(^)(QAlertView *alertView))config
           leftAction:(BOOL(^)(QAlertView *alertView))leftAction
          rightAction:(BOOL(^)(QAlertView *alertView))rightAction;

+ (void)showWithConfig:(void(^)(QAlertView *alertView))config;
@end
