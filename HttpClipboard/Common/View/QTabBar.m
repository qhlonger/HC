//
//  QTabBar.m
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "QTabBar.h"







@interface QTabBar()


@end

@implementation QTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addItems];
//        self.backgroundColor = TabBarBgColor;
        [self line];
        [self layoutFrame];
    }
    return self;
}
- (UIView *)line{
    if(!_line){
        
        UIView *v = [[UIView alloc]init];
//        v.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:CGRectMake(0, 0, ScreenWidth, 1) andColors:@[GradientPink, GradientBlue]];
        [self addSubview:v];
        _line = v;
    }
    return _line;
}
- (void)addItems{
    NSMutableArray *its = [@[] mutableCopy];
    for (int i = 0; i < TabBarItemSelImages.count; i ++) {

        QTabBarItem *item = [QTabBarItem buttonWithType:UIButtonTypeCustom];
        
        item.selected = i == 1;
        item.tintColor = TabBarTintColor;
        item.titleLabel.textAlignment = NSTextAlignmentCenter;
        item.titleLabel.font = QFont(10);
        item.imageView.contentMode = UIViewContentModeCenter;
        
        [item setTitle:TabBarItemTitles[i] forState:UIControlStateNormal];
        
        [item setTitleColor:TabBarSelTintColor forState:UIControlStateSelected];
        [item setTitleColor:TabBarTintColor forState:UIControlStateNormal];
        
        item.tintColor = 1==i ?TabBarSelTintColor:TabBarTintColor;
        if(TabBarItemImages.count > 0){
            [item setImage:[[UIImage imageNamed:TabBarItemImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
            [item setImage:[[UIImage imageNamed:TabBarItemSelImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
        }else{
            [item setImage:[[UIImage imageNamed:TabBarItemImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
            [item setImage:[[UIImage imageNamed:TabBarItemSelImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        }
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:item];
        [its addObject:item];
    }
    self.items = its;
}
- (void)layoutFrame{
    self.line.frame = CGRectMake(0, 0, self.width, 1);
    
    int i = 0;
    CGFloat itemW = self.width / TabBarItemSelImages.count;
    for (QTabBarItem *item in self.items) {
        item.frame = CGRectMake(i*itemW, 0, itemW, self.height);
        i ++;
    }
}
- (void)layoutSubviews{
    [self layoutFrame];
}
- (void)itemClick:(QTabBarItem *)item{
    
    NSInteger index = [self.items indexOfObject:item];
    [self setSelectIndex:index];
    
    if(self.ItemClick)self.ItemClick(item, index);
}

- (void)setSelectIndex:(NSInteger)index{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.1;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.96];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.2];     //结束伸缩倍数
    
    
    
    int i = 0;
    for (QTabBarItem *item in self.items) {
        item.selected = index == i;
        item.tintColor = index==i ?TabBarSelTintColor:TabBarTintColor;
        if(i == index){
            [[item.imageView layer]
             addAnimation:animation forKey:nil];
        }
        
        i ++;
    }
}



@end

@interface QTabBarItem ()

@end


@implementation QTabBarItem



- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat h = CGRectGetHeight(contentRect) * 0.3;
    
    return CGRectMake(0, CGRectGetHeight(contentRect) - h, CGRectGetWidth(contentRect), h);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    //    CGFloat h = CGRectGetHeight(contentRect) * 0.7;
    //    return CGRectMake(0, 0, CGRectGetWidth(contentRect), h);
    
    CGFloat wh = 34;
    return CGRectMake(CGRectGetWidth(contentRect)/2-wh/2, CGRectGetHeight(contentRect)/2-wh/2, wh, wh);
    
}

@end
