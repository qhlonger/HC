//
//  BaseVC.m
//  CP
//
//  Created by Apple on 2018/1/15.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseVC.h"

//#import "UINavigationController+FDFullscreenPopGesture.h"
@interface BaseVC ()

@end

@implementation BaseVC
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    NSLog(@"vc dealloc");
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.hidesBottomBarWhenPushed = YES;
    self.view.backgroundColor = MainBgGray;
//    self.fd_interactivePopDisabled = YES;
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    /*
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    btn.tintColor = TextBlackColor;
    [btn setImage:[[UIImage imageNamed:@"nv_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 40);
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backItem;
    */
    
    
    
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"]
//                                                                   style:UIBarButtonItemStylePlain
//                                                                  target:self.navigationController
//                                                                  action:@selector(popViewControllerAnimated:)];
//
//    self.navigationItem.leftBarButtonItem = backButton;
//
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self initVar];
    [self addSubview];
    [self layout];
    
}
- (void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initVar{}
- (void)addSubview{}
- (void)layout{}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

@end
