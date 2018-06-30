//
//  HCCardCell.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCCardCell : BaseCell
@property(nonatomic, assign) BOOL isFirstOne;
@property(nonatomic, assign) BOOL isLastOne;

@property(nonatomic, weak) UIView *bgView;
@end
