//
//  DirectoryVC.m
//  HttpClipboard
//
//  Created by pingguo on 2018/6/4.
//  Copyright © 2018年 hl. All rights reserved.
//

#import "DirectoryVC.h"
#import "HCItemCell.h"
#import "HCToolsCell.h"
#import "HCSectionHeader.h"
#import "HCItemInfo.h"
#import "HCListAdapter.h"
#import "HCItemDetailCell.h"
#import "HCStateSctionHeader.h"
#import "HCListAdapter.h"

@interface DirectoryVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) HCListAdapter *itemAdapter;

@end

@implementation DirectoryVC
- (void)setPath:(NSString *)path{
    _path = path;
    
    HCItem *item = [[HCItem alloc]initWithpath:path];
    self.itemAdapter = [[HCListAdapter alloc]init];
    self.itemAdapter.item = item;
    if(_tableView)[_tableView reloadData];
}
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
    
//    self.path = [Utility documentsPath];
    
}

static NSString *HCItemCellID = @"HCItemCell";
static NSString *HCItemDeta1·ilCellID = @"HCItemDetailCell";
static NSString *HCToolsCellID = @"HCToolsCell";
static NSString *HCSectionHeaderID = @"HCSectionHeader";
static NSString *HCStateSctionHeaderID = @"HCStateSctionHeader";
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = MainBgGray;
        [tableView registerClass:[HCItemCell class] forCellReuseIdentifier:HCItemCellID];
        [tableView registerClass:[HCItemDetailCell class] forCellReuseIdentifier:HCItemDetailCellID];
        [tableView registerClass:[HCToolsCell class] forCellReuseIdentifier:HCToolsCellID];
        [tableView registerClass:[HCSectionHeader class] forHeaderFooterViewReuseIdentifier:HCSectionHeaderID];
        [tableView registerClass:[HCStateSctionHeader class] forHeaderFooterViewReuseIdentifier:HCStateSctionHeaderID];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.itemAdapter ? 2 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return MAX(self.itemAdapter.numberOfItems, 1);
    }else{
        return self.itemAdapter.numberOfInfo;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return RowH;
    }else{
        return [tableView fd_heightForCellWithIdentifier:HCItemDetailCellID configuration:^(id cell) {
            ((HCItemDetailCell *)cell).titleLabel.text = [self.itemAdapter detailKeyForIndex:indexPath.row];
            ((HCItemDetailCell *)cell).detailLabel.text = [self.itemAdapter detailValueForIndex:indexPath.row];
        }];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return PtOn47(80);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HCSectionHeader *header = nil;
    
    
    if (section == 0) {
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HCStateSctionHeaderID];
        
        header.titleLabel.text = @"文件";
        header.iconView.image = [UIImage imageNamed:@"folder"];
    }else if (section == 1){
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HCSectionHeaderID];
        header.titleLabel.text = @"详细信息";
        header.iconView.image = [UIImage imageNamed:@"info"];
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
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:HCItemCellID forIndexPath:indexPath];
        if(self.itemAdapter.numberOfItems == 0){
            ((HCItemCell *)cell).titleLabel.text = @"空文件夹";
        }else{
            ((HCItemCell *)cell).titleLabel.text = [self.itemAdapter titleForIndex:indexPath.row];
        }
        
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:HCItemDetailCellID forIndexPath:indexPath];
        ((HCItemDetailCell *)cell).titleLabel.text = [self.itemAdapter detailKeyForIndex:indexPath.row];
        ((HCItemDetailCell *)cell).detailLabel.text = [self.itemAdapter detailValueForIndex:indexPath.row];
        
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
    
    if(self.itemAdapter.numberOfItems == 0){
        [Utility showError:@"空文件夹"];
        return;
    }
    if (indexPath.section == 0) {
        if(self.didSelectItem)self.didSelectItem([self.itemAdapter pathOfIndex:indexPath.row]);
    }
}



@end
