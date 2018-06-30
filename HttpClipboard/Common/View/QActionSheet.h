//
//  QActionSheet.h
//  QActionSheet
//
//  Created by 邱海龙 on 2016/12/30.
//  Copyright © 2016年 qiuhailong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QActionSheetCell;
@interface QActionSheet : UIView



+ (void)showActionSheetWithTitle:(NSString *)title
                     cancelTitle:(NSString *)cancelTitle
                     numberOfRow:(NSInteger)numberOfRow
                      cellConfig:(void(^)(QActionSheetCell *cell, NSIndexPath *indexPath))cellConfig
                 selectedAtIndex:(void(^)(NSInteger index))selectedAtIndex;
/**  显示  */
- (void)show;
/**  隐藏  */
- (void)hide;
/**  点击背景关闭  */
@property (nonatomic, assign)BOOL tapBack;
/**  标题  */
@property (nonatomic, copy)NSString *title;
/**  取消标题  */
@property (nonatomic, copy)NSString *cancelTitle;
/**  tableView 行数  */
@property (nonatomic, assign)NSInteger numberOfRow;
/**  cell 配置  */
@property (nonatomic, copy)void(^cellConfig)(QActionSheetCell *cell, NSIndexPath *indexPath);
/**  tableView 选中事件回调  */
@property (nonatomic, copy)void(^selectedAtIndex)(NSInteger index);
@end

@interface QActionSheetCell : UITableViewCell
@property (nonatomic, copy)NSString *title;

//@property (nonatomic, weak)UILabel *titleLabel;
@property (nonatomic, weak)UIButton *titleBtn;
@property (nonatomic, weak)UIView *lineUp;
@property (nonatomic, weak)UIView *lineDown;
@property (nonatomic, copy)void(^btnAction) (void);

@end
