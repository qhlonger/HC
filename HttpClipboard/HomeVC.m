//
//  HomeVC.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/3.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "HomeVC.h"
#import "DirectoryVC.h"
#import "FilesVC.h"
#import "HCItemCell.h"
#import "HCToolsCell.h"
#import "HCSectionHeader.h"
#import "HCItemInfo.h"
#import "HCListAdapter.h"
#import "HCHelper.h"
@interface HomeVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) HCListAdapter *itemAdapter;

@end

@implementation HomeVC
- (void)addSubview{
    [self tableView];
}
- (void)layout{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.navigationController.navigationBar.hidden = YES;
    NSString *filePath = [[Utility documentsPath] stringByAppendingPathComponent:@"x.txt"];
    [[NSFileManager defaultManager]createFileAtPath:filePath contents:nil attributes:nil];
    [[NSFileManager defaultManager]createDirectoryAtPath:[[Utility documentsPath] stringByAppendingPathComponent:@"a"] withIntermediateDirectories:YES attributes:nil error:nil];
    [[NSFileManager defaultManager]createDirectoryAtPath:[[[Utility documentsPath] stringByAppendingPathComponent:@"a"]stringByAppendingPathComponent:@"b"] withIntermediateDirectories:YES attributes:nil error:nil];
    [[NSFileManager defaultManager]createDirectoryAtPath:[[Utility documentsPath] stringByAppendingPathComponent:@"abc"] withIntermediateDirectories:YES attributes:nil error:nil];
    
}
static NSString *HCItemCellID = @"HCItemCell";
static NSString *HCToolsCellID = @"HCToolsCell";
static NSString *HCSectionHeaderID = @"HCSectionHeader";
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = MainBgGray;
        [tableView registerClass:[HCItemCell class] forCellReuseIdentifier:HCItemCellID];
        [tableView registerClass:[HCToolsCell class] forCellReuseIdentifier:HCToolsCellID];
        [tableView registerClass:[HCSectionHeader class] forHeaderFooterViewReuseIdentifier:HCSectionHeaderID];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ((HCCardCell *)cell).isFirstOne = YES;
    }else{
        ((HCCardCell *)cell).isFirstOne = NO;
    }
    
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        ((HCCardCell *)cell).isLastOne = YES;
    }else{
        ((HCCardCell *)cell).isLastOne = NO;
    }
        
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return PtOn47(150);
    }else{
        return RowH;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return PtOn47(80);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HCSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HCSectionHeaderID];
    if (section == 0) {
        header.titleLabel.text = @"工具";
        header.iconView.image = [UIImage imageNamed:@"toolbox"];
    }else if (section == 1){
        header.titleLabel.text = @"最近";
        header.iconView.image = [UIImage imageNamed:@"folder"];
    }else{
        
    }
    return header;
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
//    if ([view isMemberOfClass:[UITableViewHeaderFooterView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = MainBgGray;
//    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:HCToolsCellID forIndexPath:indexPath];
        __weak __typeof(self)weakSelf = self;
        [((HCToolsCell *)cell) setLAction:^{
            [[HCHelper helper]startLocalHttpServer];
        }];
        [((HCToolsCell *)cell) setMAction:^{
            DirectoryVC *dirVC = [[DirectoryVC alloc]init];
            [weakSelf.navigationController pushViewController:dirVC animated:YES];
        }];
        [((HCToolsCell *)cell) setRAction:^{
            FilesVC *dirVC = [[FilesVC alloc]init];
            [weakSelf.navigationController pushViewController:dirVC animated:YES];
        }];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:HCItemCellID forIndexPath:indexPath];
        
    }
    
    if (indexPath.row == 0) {
        ((HCCardCell *)cell).isFirstOne = YES;
    }else{
        ((HCCardCell *)cell).isFirstOne = NO;
    }
    
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        ((HCCardCell *)cell).isLastOne = YES;
    }else{
        ((HCCardCell *)cell).isLastOne = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
