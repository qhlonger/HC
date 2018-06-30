//
//  QPicker.m
//  LiveApp
//
//  Created by pingguo on 2018/3/21.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "QPicker.h"
#define QC_SCREEN_W [UIScreen mainScreen].bounds.size.width
#define QC_SCREEN_H [UIScreen mainScreen].bounds.size.height
#define QC_MainView_H (QC_SCREEN_W*0.8)
#define QC_Row_H (QC_SCREEN_W>320?48:44)
#define QC_iPhonePlus_OR_Later   (QC_SCREEN_H >= 736)
#define QC_iOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define QC_Font(x) [UIFont systemFontOfSize:(NSInteger)(QC_iPhonePlus_OR_Later?1.1*x:x)]
#define QC_RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface QPicker ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, weak)UIView *blackBackgroundView;
@property (nonatomic, weak)UIView *mainView;
@property (nonatomic, weak)UILabel *titleLabel;
@property (nonatomic, weak)UIPickerView *pickerView;
@property (nonatomic, weak)UIView *spaceView;
@property (nonatomic, weak)UIButton *cancelButton;
@property (nonatomic, weak)UIButton *okButton;
@property (nonatomic, strong)NSMutableArray *cityArray;
@property (nonatomic, copy)NSString *title;


@property(nonatomic, strong) NSMutableDictionary *selectedRows;
@end
@implementation QPicker


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.tapBack = YES;
        UIWindow *window=((AppDelegate*)[[UIApplication sharedApplication] delegate]).window;
        self.frame =window.bounds;
        [window addSubview:self];
    }
    return self;
}


+ (void)showWithTitle:(NSString *)title
               config:(void(^)(QPicker *picker))config
     numberOfComponet:(NSInteger)numberOfComponet
numberOfRowForComponet:(NSInteger (^)(NSInteger component))numberOfRowForComponet
          titleForRow:(NSString *(^)(NSInteger component,NSInteger row))titleForRow
          didScrollAt:(void(^)(NSInteger component,NSInteger row))didScrollAt
      didSelectedRows:(void(^)(NSDictionary *selectedRows))didSelectedRows{
    QPicker *picker = [[QPicker alloc]init];
    picker.title = title;
    picker.numberOfComponet = numberOfComponet;
    picker.numberOfRowForComponet = numberOfRowForComponet;
    picker.titleForRow = titleForRow;
    picker.didSelectedRows = didSelectedRows;
    [picker.pickerView reloadAllComponents];
    //    picker.callBack = callBack;
    [picker show];
}
#pragma mark 显示
- (void)show{
    
    
    
    self.blackBackgroundView.frame = CGRectMake(0, 0, QC_SCREEN_W, QC_SCREEN_H);
    [self setUpUI];
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:10.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.blackBackgroundView.alpha = 0.2f;
        self.blackBackgroundView.frame = CGRectMake(0, 0, QC_SCREEN_W, QC_SCREEN_H - QC_SCREEN_W*0.8);
        [self setUpUI];
    } completion:^(BOOL finished) {
        
    }];
    
}
#pragma mark 隐藏
- (void)hide{
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:10.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.blackBackgroundView.frame = CGRectMake(0, 0, QC_SCREEN_W, QC_SCREEN_H);
        self.blackBackgroundView.alpha = 0.f;
        self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QC_SCREEN_W, QC_SCREEN_W*0.8);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)setUpUI{
    self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QC_SCREEN_W, QC_SCREEN_W*0.8);
    self.okButton.frame = CGRectMake(QC_SCREEN_W-QC_Row_H*2, 0, QC_Row_H*2, QC_Row_H);
    self.cancelButton.frame = CGRectMake(0, 0, QC_Row_H * 2, QC_Row_H);
    self.titleLabel.frame = CGRectMake(QC_Row_H * 2, 0, QC_SCREEN_W - QC_Row_H*4, QC_Row_H);
    self.pickerView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), QC_SCREEN_W, QC_SCREEN_W*0.8-QC_Row_H);
    self.spaceView.frame = CGRectMake(0, CGRectGetMaxY(self.pickerView.frame), QC_SCREEN_W, 10);
}
+ (UIImage *)imageWithColor:(UIColor *)color{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), 0, 1);
    [color set];
    UIRectFill(CGRectMake(0, 0, 10, 10));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIView *)spaceView{
    if (!_spaceView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = QC_RGBAColor(255, 255, 255, 0.2);
        if(QC_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:view];
        }else{
            [self.mainView addSubview:view];
        }
        _spaceView = view;
    }
    return _spaceView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc]init];
        label.numberOfLines = 0;
        label.font = QC_Font(14);
        label.text = self.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = QC_RGBAColor(255, 255, 255, 0.2);
        if(QC_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:label];
        }else{
            [self.mainView addSubview:label];
        }
        _titleLabel = label;
    }
    return _titleLabel;
}
- (void)okAction{
    if(self.didSelectedRows)self.didSelectedRows(self.selectedRows);
    
    [self hide];
}
- (UIButton *)okButton{
    if (!_okButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:QRGBA(255, 255, 255, 0.3)] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(okAction) forControlEvents:UIControlEventTouchUpInside];
        if(QC_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:btn];
        }else{
            [self.mainView addSubview:btn];
        }
        _okButton = btn;
    }
    return _okButton;
}
- (UIButton *)cancelButton{
    if (!_cancelButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:QRGBA(255, 255, 255, 0.3)] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        if(QC_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:btn];
        }else{
            [self.mainView addSubview:btn];
        }
        _cancelButton = btn;
    }
    return _cancelButton;
}
- (UIView *)mainView{
    if (!_mainView) {
        if(QC_iOS_8_OR_LATER){
            
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
            UIVisualEffectView *mainView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QC_SCREEN_W, QC_SCREEN_W*0.8);
            [self addSubview:mainView];
            _mainView = mainView;
        }else{
            UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, QC_SCREEN_H, QC_SCREEN_W, QC_SCREEN_W*0.8)];
            mainView.backgroundColor = QRGBA(255, 255, 255, 0.94);
            [self addSubview:mainView];
            _mainView = mainView;
        }
    }
    return _mainView;
}
- (void)bgTap{
    if(self.tapBack)
        [self hide];
}
-(NSArray *)cityArray{
    if (!_cityArray) {
        NSString *filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"CityList.json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSError *error;
        NSArray *cityarr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        _cityArray = [NSMutableArray arrayWithArray:cityarr];
        
    }
    return _cityArray;
}
- (UIView *)blackBackgroundView{
    if (!_blackBackgroundView) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, QC_SCREEN_W, QC_SCREEN_H)];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.f;
        bgView.alpha = 0.f;
        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgTap)]];
        [self addSubview:bgView];
        _blackBackgroundView = bgView;
    }
    return _blackBackgroundView;
}
- (UIPickerView *)pickerView{
    if (!_pickerView) {
        
        
        UIPickerView *picker = [[UIPickerView alloc]init];
        
        picker.dataSource = self;
        picker.delegate = self;
        
        if(QC_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:picker];
        }else{
            [self.mainView addSubview:picker];
        }
        _pickerView = picker;
        
    }
    return _pickerView;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.numberOfComponet;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.numberOfRowForComponet(component);
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.titleForRow(component, row);
}
- (NSMutableDictionary *)selectedRows{
    if (!_selectedRows) {
        _selectedRows = [@{} mutableCopy];
    }
    return _selectedRows;
}
- (void)setNumberOfComponet:(NSInteger)numberOfComponet{
    _numberOfComponet = numberOfComponet;
    [self.selectedRows removeAllObjects];
    for (int i = 0; i < numberOfComponet; i++) {
        [self.selectedRows setObject:@(0) forKey:@(i)];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.selectedRows setObject:@(row) forKey:@(component)];
    if(self.didScrollAt)
        self.didScrollAt(component, row);
    
}

@end
