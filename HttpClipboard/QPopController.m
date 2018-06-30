//
//  QPopController.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/6.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "QPopController.h"
#import "QPopCell.h"

@interface QPopController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak) UITableView *tableView;
@end

@implementation QPopController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

static NSString *QPopCellID = @"QPopCell";
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = MainBgGray;
        [tableView registerClass:[QPopCell class] forCellReuseIdentifier:QPopCellID];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRow();
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RowH;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QPopCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:QPopCellID forIndexPath:indexPath];
    cell.titleLabel.text = self.titleForRow(indexPath.row);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
