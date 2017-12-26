//
//  DetailLabelTableViewController.m
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DetailLabelTableViewController.h"
#import "DSCocoaKit.h"


@implementation DetailLabelTableViewController

NSString *kDetailLabelCellReuseIdentifier = @"DetailLabelCell";


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[DSDetailLabelCell class] forCellReuseIdentifier:kDetailLabelCellReuseIdentifier];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSDetailLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:kDetailLabelCellReuseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = indexPath.row % 2 ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    cell.separatorInsetStyle = indexPath.row % 3;
    cell.image = (indexPath.row / 3 % 2) ? [UIImage imageNamed:@"CellIcon"] : nil;
    cell.text = @"用户信息";
    cell.detail = @"王麻子";
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DSDetailLabelCell defaultHeight];
}

@end
