//
//  TablePlaceholderView.h
//  LiveApp
//
//  Created by pingguo on 2018/4/5.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TablePlaceholderView : UIView
@property(nonatomic, weak) UIImageView *iconView;
@property(nonatomic, weak) UILabel *titleLabel;
@property(nonatomic, weak) UILabel *detailLabel;
@property(nonatomic, weak) UIButton *btn;
@property(nonatomic, copy) void(^btnAction) (void);
@property(nonatomic, copy) void(^config) (TablePlaceholderView *holder);

+ (instancetype)placeholderWithImage:(NSString *)imageName
                               title:(NSString *)title
                              detail:(NSString *)detail
                            btnTitle:(NSString *)btnTitle
                           btnAction:(void(^)(void))btnAction
                              config:(void(^)(TablePlaceholderView *holder))config;
@end
