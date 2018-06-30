//
//  HCItemDetailCell.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCItemDetailCell.h"

@implementation HCItemDetailCell


- (void)addSubview{
    [super addSubview];
    [self titleLabel];
    [self detailLabel];
}
- (void)layout{
    [super layout];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(PtOn47(10));
        make.top.equalTo(self.contentView).offset(PtOn47(10));
        make.right.equalTo(self.bgView).offset(-PtOn47(10));
        make.height.mas_equalTo(20);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(PtOn47(10));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(PtOn47(10));
        make.bottom.equalTo(self.contentView).offset(PtOn47(-10));
        make.right.equalTo(self.bgView).offset(-PtOn47(10));
    }];
    
}




- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        _detailLabel = titleLabel;
    }
    return _detailLabel;
}
@end
