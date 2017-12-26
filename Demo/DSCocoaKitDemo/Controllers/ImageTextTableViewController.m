//
//  ImageTextTableViewController.m
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "ImageTextTableViewController.h"
#import "DSCocoaKit.h"


@implementation ImageTextTableViewController

NSString *kImageTextCellReuseIdentifier = @"ImageTextCell";


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DSImageTextCell class] forCellReuseIdentifier:kImageTextCellReuseIdentifier];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSImageTextCell *cell = [tableView dequeueReusableCellWithIdentifier:kImageTextCellReuseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.separatorInsetStyle = indexPath.row % 3;
    cell.image = [UIImage imageNamed:@"CellIcon"];
    cell.text = @"用户信息";
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DSImageTextCell defaultHeight];
}

@end

