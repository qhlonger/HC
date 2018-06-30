//
//  ButtonGroupView.h
//  LiveApp
//
//  Created by pingguo on 2018/3/16.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonGroupView : UIView
@property(nonatomic, assign) NSInteger numberOfBtn;
@property(nonatomic, copy) void(^config)(NSInteger index, UIButton *btn);
@property(nonatomic, copy) void(^btnClick) (NSInteger index,UIButton *theBtn);
@property(nonatomic, strong) NSArray <UIButton *>*buttons;


- (void)reload;

@end
