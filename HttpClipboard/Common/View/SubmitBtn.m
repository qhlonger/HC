//
//  SubmitBtn.m
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "SubmitBtn.h"

@implementation SubmitBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius  = SRadius;
        
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 2;
        self.layer.shadowColor = SecondMainColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 1);
    }
    return self;
}
- (UIButton *)btn{
    if(!_btn){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.cornerRadius = SRadius;
        btn.clipsToBounds = YES;
        [btn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:SecondMainColor] forState:UIControlStateNormal];
        btn.titleLabel.font = QBoldFont(15);
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        
        [self addSubview:btn];
        _btn = btn;
    }
    return _btn;
}
- (void)layoutSubviews{
    self.btn.frame = self.bounds;
}

@end
