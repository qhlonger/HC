//
//  HCToolsCell.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HCCardCell.h"


@interface HCToolsItem : UIButton


@end

@interface HCToolsCell : HCCardCell
@property(nonatomic, weak) HCToolsItem *lItem;
@property(nonatomic, weak) HCToolsItem *mItem;
@property(nonatomic, weak) HCToolsItem *rItem;

@property(nonatomic, copy) void(^lAction) (void);
@property(nonatomic, copy) void(^mAction) (void);
@property(nonatomic, copy) void(^rAction) (void);


@end
