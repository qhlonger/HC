//
//  CommonWebVC.h
//  LiveApp
//
//  Created by pingguo on 2018/3/20.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "BaseVC.h"

@interface CommonWebVC : BaseVC
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *target;
@property(nonatomic, strong) NSURLRequest *request;

@end
