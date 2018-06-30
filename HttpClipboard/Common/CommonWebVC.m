//
//  CommonWebVC.m
//  LiveApp
//
//  Created by pingguo on 2018/3/20.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "CommonWebVC.h"

@interface CommonWebVC ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;

@end

@implementation CommonWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubview];
    [self layout];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"live_close"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];;
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleNoti) name:Noti_DidJumpIn object:nil];;
    NSURLRequest *req;
    if(self.request)
        req = self.request;
    else
        req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:req];
    
}
- (void)handleNoti{
    [self close];
}
- (void)addSubview{
    [self webView];
}
- (void)layout{
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];;
}
- (void)close{
    if(self.navigationController){
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}
- (UIWebView *)webView{
    if (!_webView) {
        UIWebView *web = [[UIWebView alloc]init];
        web.delegate = self;
        [self.view addSubview:web];
        _webView = web;
    }
    return _webView;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@">>>>>>>>>>>>>>>open url%@",request.URL.absoluteString);
    
    NSString *str = request.URL.absoluteString;
    
    if([StaticManager sharedManager].lastUrl && [str containsString:[StaticManager sharedManager].lastUrl]){
        if([[UIApplication sharedApplication] canOpenURL:request.URL]){
            [[UIApplication sharedApplication]openURL:request.URL];
            return NO;
            
        }else{
            [Utility showError:@"未知错误"];
            //        [self close];
            return YES;
        }
    }
    if(navigationType == UIWebViewNavigationTypeLinkClicked){
        CommonWebVC *vc = [[CommonWebVC alloc]init];
        vc.request = request;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(navigationType == UIWebViewNavigationTypeBackForward){
        if(self.navigationController.viewControllers.count > 1){
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view startLoading];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view stopLoading];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view stopLoading];
    //    [Utility showError:@"加载失败"];
}
@end
