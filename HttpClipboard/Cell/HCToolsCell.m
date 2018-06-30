//
//  HCToolsCell.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCToolsCell.h"

@implementation HCToolsCell
- (void)addSubview{
    [super addSubview];
    [self lItem];
    [self mItem];
    [self rItem];
}
- (void)layout{
    [super layout];
    [self.mItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bgView).multipliedBy(0.33);
        make.top.bottom.equalTo(self.bgView);
        make.centerX.equalTo(self.bgView);
    }];
    [self.lItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bgView).multipliedBy(0.33);
        make.top.bottom.equalTo(self.bgView);
        make.left.equalTo(self.bgView);
    }];
    [self.rItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bgView).multipliedBy(0.33);
        make.top.bottom.equalTo(self.bgView);
        make.right.equalTo(self.bgView);
    }];
}
- (HCToolsItem *)getItem{
    HCToolsItem *item = [HCToolsItem buttonWithType:UIButtonTypeCustom];
    item.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [item setTitleColor:TextBlackColor forState:UIControlStateNormal];
    item.titleLabel.font = QBoldFont(16);
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    return item;
}
- (void)itemClick:(HCToolsItem*)item{
    if (item == self.lItem) {
        if(self.lAction)self.lAction();
    }else if (item == self.mItem) {
        if(self.mAction)self.mAction();
    }else if (item == self.rItem) {
        if(self.rAction)self.rAction();
    }
}

- (HCToolsItem *)lItem{
    if (!_lItem) {
        HCToolsItem *item = [self getItem];
        [item setTitle:@"文件保险箱" forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:@"securitybox"] forState:UIControlStateNormal];
        [self.contentView addSubview:item];
        _lItem = item;
    }
    return _lItem;
}
- (HCToolsItem *)mItem{
    if (!_mItem) {
        HCToolsItem *item = [self getItem];
        [item setTitle:@"快速剪贴板" forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:@"clipboard"] forState:UIControlStateNormal];
        [self.contentView addSubview:item];
        _mItem = item;
    }
    return _mItem;
}
- (HCToolsItem *)rItem{
    if (!_rItem) {
        HCToolsItem *item = [self getItem];
        [item setTitle:@"文件管理器" forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:@"folder"] forState:UIControlStateNormal];
        [self.contentView addSubview:item];
        _rItem = item;
    }
    return _rItem;
}

@end

@implementation HCToolsItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(CGRectGetWidth(contentRect)*0.2, 0, CGRectGetWidth(contentRect)*0.6, CGRectGetHeight(contentRect)*0.8);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, CGRectGetHeight(contentRect)*0.7, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect)*0.2);
}

@end
