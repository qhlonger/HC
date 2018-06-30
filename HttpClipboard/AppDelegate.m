//
//  AppDelegate.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeVC.h"
#import "BaseNavVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setRootVC];
    return YES;
}
- (void)setRootVC{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    HomeVC *homeVC = [[HomeVC alloc]init];
    BaseNavVC *navVC = [[BaseNavVC alloc]initWithRootViewController:homeVC];
    
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    //    [self doAnimation];
}

- (void)doAnimation{
    
    //    [[StaticManager sharedManager].loadingView show];
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [[StaticManager sharedManager].loadingView hide];
    //    });
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    
    UIView *launchView = viewController.view;
    
    UIActivityIndicatorView *actView = [[UIActivityIndicatorView alloc]init];
    actView.hidesWhenStopped = YES;
    actView.color = Q16Color(0x6300db);
    [launchView addSubview:actView];
    [actView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(launchView);
        make.centerY.equalTo(launchView).multipliedBy(1.4);
    }];
    [actView startAnimating];
    
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    launchView.frame = [UIApplication sharedApplication].keyWindow.frame;
    [mainWindow addSubview:launchView];
    
    
    
    
    [UIView animateWithDuration:0.6f delay:1.f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.alpha = 0.0f;
        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.1f, 1.1f, 1.0f);
        //        launchView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -EMSCREEN_W, 0, 0);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
