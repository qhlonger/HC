
//
//  QSeg.m
//  LiveApp
//
//  Created by pingguo on 2018/3/11.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "QSeg.h"

@implementation QSeg

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectedIndex = 0;
        self.userInteractionEnabled = YES;
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIButton *)btn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:SecondMainColor forState:UIControlStateSelected];
    [btn setTitleColor:TextGrayColor forState:UIControlStateNormal];
    btn.titleLabel.font = QBoldFont(18);
    if(self.btnConfig)self.btnConfig(btn);
    return btn;
}
- (UIView *)line{
    if(!_line){
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = SecondMainColor;
        [self addSubview:line];
        _line = line;
    }
    return _line;
}
- (void)setTitles:(NSArray<NSString *> *)titles{
    _titles = titles;
    
    NSMutableArray <UIButton *>*btns = [@[] mutableCopy];
    for (NSString *title in titles) {
        UIButton *btn = [self btn];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btns addObject:btn];
    }
    self.btns = btns;
    [self layoutSubviews];

    self.selectedIndex = 0;
}
- (void)btnClick:(UIButton *)btn{
    NSInteger index = [self.btns indexOfObject:btn];
//    NSInteger i = 0;
//    for (UIButton *btn in self.btns) {
//        btn.selected = i++ == index;
//    }
    self.selectedIndex = index;
    if(self.selectedAtIndex)self.selectedAtIndex(index);
    
}
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    int i = 0;
    for (UIButton *btn in self.btns) {
        btn.selected = i++ == selectedIndex;
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        self.line.frame = CGRectMake(self.btns[selectedIndex].minX, self.btns[selectedIndex].maxY-2, self.btns[selectedIndex].width, 2);
    }];
}

- (void)layoutSubviews{
    int i = 0;
    CGFloat maxBtnW = self.width/self.btns.count;
    
    for (UIButton *btn in self.btns) {
        CGFloat titleW = [btn.titleLabel.text boundingRectWithSize:CGSizeMake(maxBtnW, self.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size.width;
        CGFloat btnW = MIN(maxBtnW, titleW + 40);
        
        btn.frame = CGRectMake(maxBtnW*i + (maxBtnW-btnW)/2, 0, btnW, self.height);
        i++;
    }
    
    self.line.frame = CGRectMake(self.btns[self.selectedIndex].minX, self.btns[self.selectedIndex].maxY-2, self.btns[self.selectedIndex].width, 2);
}

@end
