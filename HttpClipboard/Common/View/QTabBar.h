//
//  QTabBar.h
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTabBarItem : UIButton

@end


@interface QTabBar : UIImageView
@property(nonatomic, weak) UIView *line;
@property(nonatomic, strong) NSArray <QTabBarItem *>*items;
@property(nonatomic, copy) void(^ItemClick) (QTabBarItem *item, NSInteger index);

- (void)setSelectIndex:(NSInteger)index;

@end

