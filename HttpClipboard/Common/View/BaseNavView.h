//
//  BaseNavView.h
//  AiGuiQuan
//
//  Created by lijingjing on 12/05/2017.
//  Copyright © 2017 Nanchang Yihan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavView : UIImageView

@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, weak) UIView *line;

@property (nonatomic, copy)void(^leftAction) (void);
@property (nonatomic, copy)void(^rightAction) (void);

@end
