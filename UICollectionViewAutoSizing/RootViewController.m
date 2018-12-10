//
//  RootViewController.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/12/10.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "RootViewController.h"
#import "PPCollectionViewController.h"
#import "PPTableViewController.h"


@interface RootViewController ()
@property(nonatomic, strong) NSArray<NSString*> *dataSource;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Self Sizing Cells";
    self.dataSource = @[@"UICollectionView", @"UITableView"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] init];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        PPCollectionViewController *target = [[PPCollectionViewController alloc] init];
        [self.navigationController pushViewController:target animated:YES];
        return;
    }
    PPTableViewController *target = [[PPTableViewController alloc] init];
    [self.navigationController pushViewController:target animated:YES];
    return;
}

@end
