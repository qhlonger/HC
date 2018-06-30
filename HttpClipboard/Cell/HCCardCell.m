//
//  HCCardCell.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCCardCell.h"

@implementation HCCardCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
    }
    return self;
}
- (void)addSubview{
    [self bgView];
    
}
- (void)layout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(PtOn47(20));
        make.right.equalTo(self.contentView).offset(-PtOn47(20));
    }];
}
- (void)setIsLastOne:(BOOL)isLastOne{
    if (isLastOne == _isLastOne) {
        if (isLastOne) {
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.contentView).offset(0);
            }];
        }else{
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.contentView).offset(PtOn47(20));
            }];
        }
//        [self.contentView layoutIfNeeded];
    }
    _isLastOne = isLastOne;
}
- (void)setIsFirstOne:(BOOL)isFirstOne{
    if (isFirstOne == _isFirstOne) {
        if (isFirstOne) {
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView).offset(0);
            }];
        }else{
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView).offset(-PtOn47(20));
            }];
        }
//        [self.contentView layoutIfNeeded];
    }
    _isFirstOne = isFirstOne;
}

- (UIView *)bgView{
    if (!_bgView) {
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = PtOn47(10);
        bgView.clipsToBounds = YES;
        [self.contentView addSubview:bgView];
        _bgView = bgView;
    }
    return _bgView;
}

@end
