//
//  TablePlaceholderView.m
//  LiveApp
//
//  Created by pingguo on 2018/4/5.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "TablePlaceholderView.h"

@implementation TablePlaceholderView

+ (instancetype)placeholderWithImage:(NSString *)imageName
                               title:(NSString *)title
                              detail:(NSString *)detail
                            btnTitle:(NSString *)btnTitle
                           btnAction:(void(^)(void))btnAction
                              config:(void(^)(TablePlaceholderView *holder))config{
    TablePlaceholderView *holder = [[TablePlaceholderView alloc]init];
    holder.config = config;
    holder.btnAction = btnAction;
    holder.titleLabel.text = title;
    holder.detailLabel.text = detail;
    holder.iconView.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [holder.btn setTitle:btnTitle forState:UIControlStateNormal];
    
    holder.btn.hidden = !btnTitle;

//    holder.autoresizingMask = UIViewAutoresizingFlexibleRightMargin |
//    UIViewAutoresizingFlexibleLeftMargin |
//    UIViewAutoresizingFlexibleBottomMargin;
    
    return holder;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview];
        [self layout];
    }
    return self;
}
- (UIImageView *)iconView{
    if (!_iconView) {
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.tintColor = [SecondMainColor colorWithAlphaComponent:0.4];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:iconView];
        _iconView = iconView;
    }
    return _iconView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = TextGrayColor;
        titleLabel.font = QFont(14);
        titleLabel.numberOfLines = 0;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = TextLightGrayColor;
        titleLabel.font = QFont(12);
        titleLabel.numberOfLines = 0;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        _detailLabel = titleLabel;
    }
    return _detailLabel;
}
- (UIButton *)btn{
    if (!_btn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = SRadius;
        [btn setBackgroundImage:[UIImage imageWithColor:SecondMainColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = QFont(15);
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _btn = btn;
    }
    return _btn;
}
- (void)click{
    if(self.btnAction)self.btnAction();
}
- (void)layout{
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(0.7);
        make.width.equalTo(self);
        make.height.equalTo(self.iconView.mas_width).multipliedBy(0.4);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).offset(NormalMargin);
        make.centerX.equalTo(self);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(NormalMargin);
        make.centerX.equalTo(self);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(NormalMargin);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(PtOn47(80));
        make.height.mas_equalTo(PtOn47(36));
    }];
}
- (void)addSubview{
    [self iconView];
    [self titleLabel];
    [self detailLabel];
    [self btn];
}


@end
