//
//  BaseCell.m
//  LiveApp
//
//  Created by pingguo on 2018/3/12.
//  Copyright © 2018年 TopTech. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview];
        [self layout];
    }
    return self;
}
- (void)addSubview{}
- (void)layout{}

@end
