//
//  HCStateSctionHeader.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCStateSctionHeader.h"

@implementation HCStateSctionHeader

- (void)addSubview{
    [super addSubview];
    
    [self stateSwitch];
    [self moreBtn];
}
- (void)layout{
    [super layout];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(PtOn47(20));
        make.centerY.equalTo(self.contentView);
        make.right.lessThanOrEqualTo(self.stateSwitch.mas_left).offset(-PtOn47(0));
        
    }];
    [self.stateSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(PtOn47(40));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.moreBtn.mas_left).offset(-PtOn47(10));
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(PtOn47(40));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-PtOn47(20));
        
    }];
    
}


- (UISwitch *)stateSwitch{
    if (!_stateSwitch) {
        UISwitch *sw = [[UISwitch alloc]init];
        sw.tintColor = [SecondMainColor colorWithAlphaComponent:0.6];
        sw.thumbTintColor = MainColor;

        sw.onTintColor = SecondMainColor ;
        [self.contentView addSubview:sw];
        _stateSwitch = sw;
    }
    return _stateSwitch;
}
- (UIButton *)moreBtn{
    if (!_moreBtn) {
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [self.contentView addSubview:moreBtn];
        _moreBtn = moreBtn;
    }
    return _moreBtn;
}

@end
