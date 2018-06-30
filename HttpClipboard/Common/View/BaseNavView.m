
//
//  BaseNavView.m
//  AiGuiQuan
//
//  Created by lijingjing on 12/05/2017.
//  Copyright © 2017 Nanchang Yihan Network Technology Co., Ltd. All rights reserved.
//

#import "BaseNavView.h"

@implementation BaseNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self addSubview];
        [self layout];
    }
    return self;
}
- (void)addSubview{
    [self leftBtn];
    [self rightBtn];
    [self titleLabel];
    [self line];
}
- (void)layout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(PtOn47(NavBarHeight));
        
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(PtOn47(NavBarHeight));
        make.width.mas_equalTo(PtOn47(44));
        make.left.equalTo(self);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(PtOn47(NavBarHeight));
        make.width.mas_equalTo(PtOn47(44));
        make.right.equalTo(self);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}
- (UIView *)line{
    if (!_line) {
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = SepColor;
        line.hidden  = YES;
        [self addSubview:line];
        _line = line;
    }
    return _line;
}
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.tintColor = [UIColor blackColor];
        [_leftBtn setImage:[[UIImage imageNamed:@"nv_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];
    }
    return _leftBtn;
}
- (UIButton *)rightBtn{
    if(!_rightBtn){
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.tintColor = [UIColor whiteColor];
        [_rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightBtn];
    }
    return _rightBtn;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = QBoldFont(18);
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        _titleLabel.textColor = TextBlackColor;//[UIColor whiteColor];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (void)leftClick{
    if(self.leftAction)self.leftAction();
}
- (void)rightClick{
    if(self.rightAction)self.rightAction();
}
@end
