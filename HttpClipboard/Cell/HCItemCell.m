//
//  HCItemCell.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCItemCell.h"

@implementation HCItemCell


- (void)addSubview{
    [super addSubview];
    [self itemIcon];
    [self titleLabel];
}
- (void)layout{
    [super layout];
    [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(PtOn47(40));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(PtOn47(40));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.itemIcon);
        make.centerY.equalTo(self.contentView);
        make.right.lessThanOrEqualTo(self.rightView.mas_left).offset(-PtOn47(0));
        
    }];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(PtOn47(40));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-PtOn47(40));
    }];
}




- (UIImageView *)itemIcon{
    if (!_itemIcon) {
        UIImageView *itemIcon = [[UIImageView alloc]init];
        [self.contentView addSubview:itemIcon];
        _itemIcon = itemIcon;
    }
    return _itemIcon;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
- (UIImageView *)rightView{
    if (!_rightView) {
        UIImageView *rightView = [[UIImageView alloc]init];
        rightView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:rightView];
        _rightView = rightView;
    }
    return _rightView;
}

@end
