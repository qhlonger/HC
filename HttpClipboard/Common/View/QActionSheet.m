//
//  QActionSheet.m
//  QActionSheet
//
//  Created by 邱海龙 on 2016/12/30.
//  Copyright © 2016年 qiuhailong. All rights reserved.
//




#define QA_SCREEN_W [UIScreen mainScreen].bounds.size.width
#define QA_SCREEN_H [UIScreen mainScreen].bounds.size.height
#define QA_Row_H (QA_SCREEN_W>320?48:44)
#define QA_iPhonePlus_OR_Later   (QA_SCREEN_H >= 736)
#define QA_iOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define QA_Font(x) [UIFont systemFontOfSize:(NSInteger)(QA_iPhonePlus_OR_Later?1.1*x:x)]
#define QA_RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define QA_MainView_H (QA_SCREEN_W*0.8)

#import "QActionSheet.h"
#import "AppDelegate.h"


@interface QActionSheet ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak)UIView *blackBackgroundView;
@property (nonatomic, weak)UIView *mainView;
@property (nonatomic, weak)UILabel *titleLabel;
@property (nonatomic, weak)UITableView *tableView;
@property (nonatomic, weak)UIView *spaceView;
@property (nonatomic, weak)UIButton *cancelButton;





@end
@implementation QActionSheet
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

+ (void)showActionSheetWithTitle:(NSString *)title
                     cancelTitle:(NSString *)cancelTitle
                     numberOfRow:(NSInteger)numberOfRow
                      cellConfig:(void(^)(QActionSheetCell *cell, NSIndexPath *indexPath))cellConfig
                 selectedAtIndex:(void(^)(NSInteger index))selectedAtIndex{
    QActionSheet *actionSheet = [[QActionSheet alloc]init];
    actionSheet.title = title;
    actionSheet.cancelTitle = cancelTitle;
    actionSheet.numberOfRow = numberOfRow;
    actionSheet.cellConfig = cellConfig;
    actionSheet.selectedAtIndex = selectedAtIndex;
    [actionSheet show];
}
#pragma mark 显示
- (void)show{
    
    self.blackBackgroundView.frame = CGRectMake(0, 0, QA_SCREEN_W, QA_SCREEN_H);
    [self setUpUI];
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:10.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
            self.blackBackgroundView.alpha = 0.2f;
            self.blackBackgroundView.frame = CGRectMake(0, 0, QA_SCREEN_W, QA_SCREEN_H - self.mainViewHeight);
            [self setUpUI];
    } completion:^(BOOL finished) {
        
    }];
    
}
#pragma mark 隐藏
- (void)hide{
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:10.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.blackBackgroundView.frame = CGRectMake(0, 0, QA_SCREEN_W, QA_SCREEN_H);
        self.blackBackgroundView.alpha = 0.f;
        self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QA_SCREEN_W, self.tableViewTotalHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setUpUI{
    self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QA_SCREEN_W, self.mainViewHeight);
    self.titleLabel.frame = CGRectMake(0, 0, QA_SCREEN_W, self.titleHeight);
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), QA_SCREEN_W, self.tableViewTotalHeight);
    self.spaceView.frame = CGRectMake(0, CGRectGetMaxY(self.tableView.frame), QA_SCREEN_W, 10);
    self.cancelButton.frame = CGRectMake(0, CGRectGetMaxY(self.spaceView.frame), QA_SCREEN_W, QA_Row_H);
}
- (CGFloat)mainViewHeight{
    return self.titleHeight + self.tableViewTotalHeight + QA_Row_H + 10;
}
- (CGFloat)titleHeight{
    if(!self.title)return 0;
    CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(QA_SCREEN_W, 100)];
    return size.height + 20;
}
- (CGFloat)tableViewTotalHeight{
    CGFloat th = 0;
    th = QA_Row_H * ( self.numberOfRow < 8 ? self.numberOfRow : 8 );
    return th;
}




+ (UIImage *)imageWithColor:(UIColor *)color{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), 0, 1);
    [color set];
    UIRectFill(CGRectMake(0, 0, 10, 10));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIButton *)cancelButton{
    if (!_cancelButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.cancelTitle ? self.cancelTitle : @"取消" forState:UIControlStateNormal];
        btn.titleLabel.font =QFont(14);
        [btn setBackgroundImage:[QActionSheet imageWithColor:QA_RGBAColor(255, 255, 255, 0.5)] forState:UIControlStateNormal];
        [btn setBackgroundImage:[QActionSheet imageWithColor:[UIColor clearColor]] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if(QA_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:btn];
        }else{
            [self.mainView addSubview:btn];
        }
        _cancelButton = btn;
    }
    return _cancelButton;
}
- (UIView *)spaceView{
    if (!_spaceView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = QA_RGBAColor(0, 0, 0, 0.1);
        if(QA_iOS_8_OR_LATER){
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
        label.font = QA_Font(14);
        label.text = self.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = QA_RGBAColor(0, 0, 0, 0.1);
        if(QA_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:label];
        }else{
            [self.mainView addSubview:label];
        }
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIView *)mainView{
    if (!_mainView) {
        if(QA_iOS_8_OR_LATER){
            
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            UIVisualEffectView *mainView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            mainView.frame = CGRectMake(0, CGRectGetMaxY(self.blackBackgroundView.frame), QA_SCREEN_W, self.tableViewTotalHeight);
            [self addSubview:mainView];
            _mainView = mainView;
        }else{
            UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, QA_SCREEN_H, QA_SCREEN_W, self.tableViewTotalHeight)];
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
- (UIView *)blackBackgroundView{
    if (!_blackBackgroundView) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, QA_SCREEN_W, QA_SCREEN_H)];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.f;
        bgView.alpha = 0.f;
        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgTap)]];
        [self addSubview:bgView];
        _blackBackgroundView = bgView;
    }
    return _blackBackgroundView;
}

#pragma mark ----------     tableView Getter
static NSString *cellID = @"cellID";
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.mainView.bounds style:UITableViewStylePlain];
        [tableView registerClass:[QActionSheetCell class] forCellReuseIdentifier:cellID];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.allowsSelection = YES;
        tableView.backgroundColor = [UIColor clearColor];
//        tableView.alwaysBounceVertical = YES;
        if(QA_iOS_8_OR_LATER){
            [((UIVisualEffectView *)self.mainView).contentView addSubview:tableView];
        }else{
            [self.mainView addSubview:tableView];
        }
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark ----------     UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRow;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return QA_Row_H;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(self.cellConfig)
        self.cellConfig(cell, indexPath);
    cell.backgroundColor = [UIColor clearColor];
    __weak __typeof(self)weakSelf = self;
    [cell setBtnAction:^{
        weakSelf.selectedAtIndex?self.selectedAtIndex(indexPath.row):nil;
        [weakSelf hide];
    }];
    return cell;
}
#pragma mark ----------     UITableView Delegate
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if(self.selectedAtIndex)self.selectedAtIndex(indexPath.row);
//    [self hide];
//}

@end




@implementation QActionSheetCell
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat lineH = 0.5;
    self.lineUp.frame = CGRectMake(0, 0, self.frame.size.width, lineH);
    self.titleBtn.frame = CGRectMake(0, lineH, self.frame.size.width, self.frame.size.height-lineH*2);
    //    self.titleLabel.frame = CGRectMake(0, lineH, self.frame.size.width, self.frame.size.height-lineH*2);
    self.lineUp.frame = CGRectMake(0, self.frame.size.height-lineH, self.frame.size.width, lineH);
}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
//    if (highlighted == YES) {
//        // 选中时候的样式
////        self.titleLabel.backgroundColor = [UIColor clearColor];
//        self.titleBtn.backgroundColor = [UIColor clearColor];
//
//    } else {
//        // 未选中时候的样式
////        self.titleLabel.backgroundColor = QA_RGBAColor(255, 255, 255, 0.5);
//        self.titleBtn.backgroundColor = QA_RGBAColor(255, 255, 255, 0.5);
//    }
//}
- (void)setTitle:(NSString *)title{
    _title = title;
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}
//- (UILabel *)titleLabel{
//    if (!_titleLabel) {
//        UILabel *label = [[UILabel alloc]init];
//        label.backgroundColor = QA_RGBAColor(255, 255, 255, 0.5);
//        label.font = EMFont(14);
//        label.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:label];
//        _titleLabel = label;
//    }
//    return _titleLabel;
//}
- (UIView *)lineUp{
    if (!_lineUp) {
        UIView *line =[[ UIView alloc]init];
        line.backgroundColor = QA_RGBAColor(1, 1, 1, 0.1);
        [self.contentView addSubview:line];
        _lineUp = line;
    }
    return _lineUp;
}
- (UIView *)lineDown{
    if (!_lineDown) {
        UIView *line =[[ UIView alloc]init];
        line.backgroundColor = QA_RGBAColor(1, 1, 1, 0.1);
        [self.contentView addSubview:line];
        _lineDown = line;
        
    }
    return _lineDown;
}
- (UIButton *)titleBtn{
    if (!_titleBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageWithColor:QA_RGBAColor(255, 255, 255, 0.6)] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = QFont(14);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        _titleBtn = btn;
    }
    return _titleBtn;
}
- (void)btnClick{
    if(self.btnAction)self.btnAction();
}


@end


