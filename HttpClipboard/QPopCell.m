//
//  QPopCell.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/6.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "QPopCell.h"

@implementation QPopCell


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

@end
