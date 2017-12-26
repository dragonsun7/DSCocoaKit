//
//  ImageLabelTableViewController.m
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "ImageLabelTableViewController.h"
#import "DSCocoaKit.h"


@implementation ImageLabelTableViewController

NSString *kImageLabelCellReuseIdentifier = @"ImageLabelCell";


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DSImageLabelCell class] forCellReuseIdentifier:kImageLabelCellReuseIdentifier];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSImageLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:kImageLabelCellReuseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.separatorInsetStyle = indexPath.row % 3;
    cell.image = (indexPath.row / 3 % 2) ? [UIImage imageNamed:@"CellIcon"] : nil;
    cell.text = @"用户信息";
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DSImageLabelCell defaultHeight];
}

@end

