//
//  QPicker.h
//  LiveApp
//
//  Created by pingguo on 2018/3/21.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPicker : UIView

+ (void)showWithTitle:(NSString *)title
               config:(void(^)(QPicker *picker))config
     numberOfComponet:(NSInteger)numberOfComponet
numberOfRowForComponet:(NSInteger (^)(NSInteger component))numberOfRowForComponet
          titleForRow:(NSString *(^)(NSInteger component,NSInteger row))titleForRow
          didScrollAt:(void(^)(NSInteger component,NSInteger row))didScrollAt
        didSelectedRows:(void(^)(NSDictionary *selectedRows))didSelectedRows;
/**  显示  */
- (void)show;
/**  隐藏  */
- (void)hide;
/**  点击背景关闭  */
@property (nonatomic, assign)BOOL tapBack;

@property(nonatomic, assign) NSInteger numberOfComponet;
@property(nonatomic, copy) void(^config)(QPicker *picker) ;
@property(nonatomic, copy) NSInteger (^numberOfRowForComponet)(NSInteger component) ;
@property(nonatomic, copy) NSString *(^titleForRow)(NSInteger component,NSInteger row) ;
@property(nonatomic, copy) void(^didScrollAt)(NSInteger component,NSInteger row) ;
@property(nonatomic, copy) void(^didSelectedRows)(NSDictionary *selectedRows);
@end
