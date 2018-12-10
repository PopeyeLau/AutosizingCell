//
//  PPTableViewController.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/12/10.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPTableViewController.h"
#import "PPTableTextCell.h"
#import "PPTableXibCell.h"

typedef NS_ENUM(NSUInteger, ViewControllerCellType) {
    ViewControllerCellTypeText,
    ViewControllerCellTypeTextXib,
};

@interface PPTableViewController ()
@property(nonatomic, strong) NSArray<NSString*> *dataSource;
@end

@implementation PPTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UITableViewCell Self Sizing Cells";
    [self.tableView registerClass:[PPTableTextCell class] forCellReuseIdentifier:@"PPTableTextCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PPTableXibCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"PPTableXibCell"];
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedSectionFooterHeight = 10;
    self.tableView.estimatedSectionHeaderHeight = 40;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case ViewControllerCellTypeText: {
            PPTableTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PPTableTextCell" forIndexPath:indexPath];
            cell.titleLabel.text = self.dataSource[indexPath.row];
            return cell;
        }
            break;
        default: {
            PPTableXibCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PPTableXibCell" forIndexPath:indexPath];
            cell.titleLabel.text = self.dataSource[indexPath.row];
            return cell;
        }
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = UIColor.grayColor;
    if(section == ViewControllerCellTypeTextXib) {
        v.backgroundColor = UIColor.redColor;
    }
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = UIColor.yellowColor;
    return v;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:ViewControllerCellTypeTextXib] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


- (NSArray<NSString *> *)dataSource {
    if(_dataSource == nil) {
        _dataSource = @[@"Give Up on Trying to Change the Other Person",@" We’ve now been together eight years, and not much has changed. In fact, when I told him I was writing a story about differing attitudes toward tech in relationships, his first reaction was to suggest that I put the payment for this piece toward a new iPhone.", @"Though differing attitudes toward technology might seem superficial, according to Steven Dziedzic, founder of the marriage health app Lasting, they can qualify as “‘perpetual problems, which center around significant differences that repeatedly create conflict.” The specific nature of those conflicts differs from couple to couple, but there are common themes: the minor but recurring frustrations of day-to-day life, like remembering to use a smart light switch instead of the regular one or the incredulity when a partner doesn’t see the convenience of your way.", @"Then there are bigger issues, like finances. A friend has complained to me that her partner likes to spend his disposable income on gadgets, while she’d prefer to put that money toward travel. I could relate: I remember feeling aggrieved when, as I waited impatiently for an engagement ring, my boyfriend bought a VR helmet.",@"Many relationship experts recommend making clear rules around technology. This can apply to daily behaviors, but also to things like finances or quality time: for instance, making dinner tech-free, agreeing on a monthly gadget budget, deciding to balance every tech-centric activity or purchase with a more analog one."];
    }
    return _dataSource;
}
@end
