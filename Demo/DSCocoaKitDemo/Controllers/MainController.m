//
//  MainController.m
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "MainController.h"
#import "ImageTextTableViewController.h"


@interface MainController () {
    NSArray<NSString *> *_categories;
}

@end


@implementation MainController

NSString *kMainCellReuseIdentifier = @"cell";


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    _categories = [self categoryList];
    self.navigationItem.title = @"分类";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMainCellReuseIdentifier];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellReuseIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _categories[indexPath.row];

    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTextTableViewController *vc = [[ImageTextTableViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.title = _categories[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Private

- (NSArray<NSString *> *)categoryList {
    return @[
             @"ImageLabelCell"
             ];
}

@end
