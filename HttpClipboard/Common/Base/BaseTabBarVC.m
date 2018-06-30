//
//  BaseTabBarVC.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseTabBarVC.h"


#import "QTabBar.h"


//#import "MineVC.h"
//#import "AutoBetVC.h"
//#import "PlanVC.h"

//#import "LiveVC.h"
//#import "UserCenterVC.h"
//#import "MessageVC.h"

@interface BaseTabBarVC ()
@property(nonatomic, strong) QTabBar *customTabBar;
@end

@implementation BaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = TabBarBgColor;
    self.tabBar.translucent = NO;
    
    [[UITabBar appearance]  setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self config];
    [self addVCs];
    [self customTabBar];
    
//    self.delegate = self;
//    [self.tabBar addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
//    [self.tabBar addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];
//}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    if ([keyPath isEqualToString:@"frame"]) {
//        self.customTabBar.frame = self.tabBar.bounds;
//    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self.customTabBar setSelectIndex:[self.tabBar.items indexOfObject:item]];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (QTabBar *)customTabBar{
    if (!_customTabBar) {
        _customTabBar = [[QTabBar alloc]init];
//        _customTabBar.image = [UIImage imageNamed:@"nav_bg"];
        _customTabBar.contentMode = UIViewContentModeScaleAspectFill;
        _customTabBar.clipsToBounds = YES;
//        _customTabBar.backgroundColor = [UIColor redColor];
        __weak __typeof(self)weakSelf = self;
        [_customTabBar setItemClick:^(QTabBarItem *item, NSInteger index) {
            weakSelf.selectedIndex = index;
        }];
//        self.tabBar.hidden = YES;
        [self.tabBar addSubview:_customTabBar];
        
//        UIView *r = [[UIView alloc]init];

        [StaticManager sharedManager].customTabbar = _customTabBar;
        _customTabBar.frame = self.tabBar.bounds;
    }
    return _customTabBar;
}
- (void)config{
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = TabBarBgColor;
}
- (void)addVCs{
//    MineVC *liveVC = [[MineVC alloc]init];
//    BaseNavVC *liveNC = [[BaseNavVC alloc]initWithRootViewController:liveVC];
//
//    PlanVC *messageVC = [[PlanVC alloc]init];
//    BaseNavVC *messageNC = [[BaseNavVC alloc]initWithRootViewController:messageVC];
//
//    AutoBetVC *userVC = [[AutoBetVC alloc]init];
//    BaseNavVC *userNC = [[BaseNavVC alloc]initWithRootViewController:userVC];
    
    
    
    
//    self.viewControllers = @[messageNC, liveNC, userNC];
    
    self.selectedIndex = 1;
    
    
//    NSArray *tabBarItemImages = @[@"tabbar_home",
//                                  @"tabbar_notice",
//                                  @"tabbar_bbs",
//                                  @"tabbar_mine"];
//    NSArray *tabBarItemSelImages = @[@"tabbar_home",
//                                     @"tabbar_notice",
//                                     @"tabbar_bbs",
//                                  @"tabbar_mine"];
//    NSArray *tabBarItemTitles = @[@"s",
//                                  @"s",
//                                  @"b",
//                                  @"a"
//                                  ];
//    int i = 0;
//    self.tabBar.tintColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//    for (UITabBarItem *item in self.tabBar.items) {
//        item.title = tabBarItemTitles[i];
//        item.image = [UIImage imageNamed:tabBarItemImages[i]];
//        item.selectedImage = [[UIImage imageNamed:tabBarItemSelImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//        i++;
//    }
    
    
}

@end
