//
//  BaseNavVC.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseNavVC.h"

@interface BaseNavVC ()

@end

@implementation BaseNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = MainColor;
    self.navigationBar.tintColor = TextBlackColor;
    self.navigationBar.translucent = NO;
    [[UINavigationBar appearance]  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
//    if (@available(iOS 11.0, *)) {
//        self.navigationBar.prefersLargeTitles = YES;
//        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
//    } else {
//        // Fallback on earlier versions
//    }
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:TextBlackColor, NSFontAttributeName:QBoldFont(18)};
//    self.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bg"]];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    
    //    方法2:通过父视图NaviController来设置
    //主要是以下两个图片设置
//    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"nav_back"];
//    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_back"];
//
//
//
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = backItem;
    
//    UIImage *backButtonImage = [[UIImage imageNamed:@"nav_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 29, 29)
//                                                                                           resizingMode:UIImageResizingModeTile];
//
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
//                                                      forState:UIControlStateNormal
//                                                    barMetrics:UIBarMetricsDefault];
//    //参考自定义文字部分
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin)
//                                                         forBarMetrics:UIBarMetricsDefault];
    
    
    
}
- (void)pop{
    [self popViewControllerAnimated:YES];
}

//- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
//
//
////    return [[UIBarButtonItem alloc] initWithTitle:@"s"
////                                            style:UIBarButtonItemStylePlain
////                                           target:target
////                                           action:action];
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    btn.tintColor = TextGrayColor;
//    [btn setImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//    btn.frame = CGRectMake(0, 0, 40, 40);
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//
//    return backItem;
//
//}
@end
