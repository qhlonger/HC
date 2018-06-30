//
//  QPopController.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/6.
//  Copyright © 2018年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPopController : UIViewController
@property(nonatomic, assign) CGPoint arrowPt;

@property(nonatomic, copy) NSInteger(^numberOfRow)(void);
@property(nonatomic, copy) NSString *(^titleForRow)(NSInteger index);

@end
