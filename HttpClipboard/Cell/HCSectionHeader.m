//
//  HCSectionHeader.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCSectionHeader.h"

@implementation HCSectionHeader
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        [self addSubview];
        [self layout];
        self.backgroundView.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)addSubview{
    
    [self iconView];
    [self titleLabel];
}
- (void)layout{
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(PtOn47(40));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(PtOn47(20));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(PtOn47(20));
        make.centerY.equalTo(self.contentView);
        make.right.lessThanOrEqualTo(self.contentView).offset(-PtOn47(0));
        
    }];
    
}


- (UIImageView *)iconView{
    if (!_iconView) {
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        _iconView = iconView;
    }
    return _iconView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = QBoldFont(20);
        titleLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
@end
