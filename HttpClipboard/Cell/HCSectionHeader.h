//
//  HCSectionHeader.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCSectionHeader : UITableViewHeaderFooterView
@property(nonatomic, weak) UIImageView *iconView;
@property(nonatomic, weak) UILabel *titleLabel;



- (void)addSubview;
- (void)layout;
@end
