//
//  DirectoryVC.h
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "BaseVC.h"

@interface DirectoryVC : BaseVC


@property(nonatomic, strong) NSString *path;

@property(nonatomic, copy) void(^didSelectItem) (NSString *path);
@end
