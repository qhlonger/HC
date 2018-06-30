//
//  QSeg.h
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSeg : UIView

@property(nonatomic, strong) NSArray<NSString *> *titles;
@property(nonatomic, assign) NSInteger selectedIndex;
@property(nonatomic, copy) void(^selectedAtIndex)(NSInteger index);
@property(nonatomic, copy) void(^btnConfig) (UIButton *btn);

@property(nonatomic, weak) UIView *line;
@property(nonatomic, strong) NSArray <UIButton *>*btns;
@end
