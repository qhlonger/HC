//
//  HCItemCell.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCCardCell.h"

@interface HCItemCell : HCCardCell

@property(nonatomic, weak) UIImageView *itemIcon;
@property(nonatomic, weak) UILabel  *titleLabel;
@property(nonatomic, weak) UIImageView  *rightView;


@end
