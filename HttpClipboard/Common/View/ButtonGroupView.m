//
//  ButtonGroupView.m
//  LiveApp
//
//  Created by pingguo on 2018/3/16.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "ButtonGroupView.h"

@implementation ButtonGroupView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
    }
    return self;
}


- (void)setNumberOfBtn:(NSInteger)numberOfBtn{
    _numberOfBtn = numberOfBtn;
}


- (void)reload{
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    
    NSMutableArray *arr = [@[] mutableCopy];
    for (int i = 0; i < self.numberOfBtn; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if(self.config)self.config(i, btn);
        [self addSubview:btn];
        [arr addObject:btn];
    }
    self.buttons = arr;
    [self layoutFrame];
}
- (void)btnClick:(UIButton *)btn{
    NSInteger idx = [self.buttons indexOfObject:btn];
    if(self.btnClick)self.btnClick(idx,btn);
}
- (void)layoutFrame{
    
    int i = 0;
    CGFloat fullW = self.width / self.numberOfBtn;
    
    CGFloat itemH = self.height;
    CGFloat itemW = itemH;
    CGFloat itemL = (fullW - itemW)/2;
    for (UIButton *btn in self.buttons) {
        btn.frame = CGRectMake(i*fullW + itemL, 0, itemW, itemH);
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = itemW/2;
        i ++;
    }
}
- (void)layoutSubviews{
    [self layoutFrame];
}

@end
