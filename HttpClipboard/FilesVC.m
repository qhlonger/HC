//
//  FilesVC.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "FilesVC.h"
#import "DirectoryVC.h"
@interface FilesVC ()
@property(nonatomic, weak) UIButton *homeBtn;
@property(nonatomic, strong) NSMutableArray *paths;


@end

@implementation FilesVC
- (NSMutableArray *)paths{
    if (!_paths) {
        _paths = [@[] mutableCopy];
        [_paths addObject:[Utility documentsPath]];
    }
    return _paths;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view);
//        make.height.mas_equalTo(PtOn47(200));
//    }];
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.right.left.equalTo(self.view);
//        make.top.equalTo(self.menuView.mas_bottom);
//    }];
    
    
    self.menuView.style = WMMenuViewStyleLine;
    self.menuView.progressViewIsNaughty = YES;
    self.pageAnimatable = YES;
    
    self.menuView.layoutMode = WMMenuViewLayoutModeLeft;
    self.menuView.fontName = @".PingFang-SC-Light";
    [self addSubview];
    [self layout];
}

- (void)addSubview{
    [self homeBtn];
}
- (void)layout{
    [self.homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(PtOn47(20));
        make.width.height.mas_equalTo(44);
        make.top.equalTo(self.view).offset(PtOn47(30));
    }];
}
- (UIButton *)homeBtn{
    if (!_homeBtn) {
        UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [homeBtn setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
        __weak __typeof(self)weakSelf = self;
        [homeBtn bk_addEventHandler:^(id sender) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:homeBtn];
        
        _homeBtn = homeBtn;
    }
    return _homeBtn;
}
- (CGFloat)menuView:(WMMenuView *)menu titleSizeForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    return 18;
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    
    NSString *title = [self pageController:self titleAtIndex:index];
    CGFloat width = [title sizeWithFont:QBoldFont(18) maxSize:CGSizeMake(PtOn47(120), PtOn47(40))].width + PtOn47(20);
    return width;
}
- (UIColor *)menuView:(WMMenuView *)menu titleColorForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    switch (state) {
        case WMMenuItemStateSelected:
            return MainColor;
            break;
        case WMMenuItemStateNormal:
            return TextBlackColor;
            break;
        default:
            break;
    }
    return [UIColor whiteColor];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.paths.count;
}
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    DirectoryVC *vc = [[DirectoryVC alloc]init];
    vc.path = self.paths[index];
    __weak __typeof(self)weakSelf = self;
    [vc setDidSelectItem:^(NSString *path) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        //选择文件后，删除当前path后方的path
        while (self.paths.count > index+1) {
            [self.paths removeLastObject];
        }
        
//        [strongSelf.paths removeObjectsInRange:NSMakeRange(index+1, self.paths.count-1-index)];
        BOOL isDir;
        if([[NSFileManager defaultManager]fileExistsAtPath:path isDirectory:&isDir] && isDir){
            [self.paths addObject:path];
            [self reloadData];
            self.selectIndex = self.paths.count - 1;
        }else{
            NSLog(@"%@",path);
        }
        
        
    }];;
    return vc;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    //当前文件夹名
    return [[self.paths[index] lastPathComponent] stringByDeletingPathExtension];
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    return CGRectMake(0, PtOn47(150), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) -PtOn47(150));
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0,  PtOn47(100), CGRectGetWidth(self.view.frame), PtOn47(50));
}
- (void)pageController:(WMPageController *)pageController lazyLoadViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    
}
- (void)pageController:(WMPageController *)pageController willCachedViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    
}
- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    
}
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    
}
@end
