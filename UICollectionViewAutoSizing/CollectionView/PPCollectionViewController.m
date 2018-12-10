//
//  PPCollectionViewController.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/11/28.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPCollectionViewController.h"
#import "PPMessageCell.h"
#import "PPXibCell.h"

typedef NS_ENUM(NSUInteger, ViewControllerCellType) {
    ViewControllerCellTypeText,
    ViewControllerCellTypeTextXib,
};

@interface PPCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<NSString*> *dataSource;
@end

@implementation PPCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UICollectionViewCell Self Sizing Cells";
    [self setup];
}

- (void) setup {
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [[self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[self.collectionView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
    [[self.collectionView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
    [[self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 10);
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if(kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        header.backgroundColor = UIColor.orangeColor;
        return header;
    }
    UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
    footer.backgroundColor = UIColor.yellowColor;
    return footer;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case ViewControllerCellTypeText: {
            PPMessageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PPMessageCell" forIndexPath:indexPath];
            cell.text = self.dataSource[indexPath.item];
            return cell;
        }
            break;
        case ViewControllerCellTypeTextXib: {
            PPXibCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PPXibCell" forIndexPath:indexPath];
            cell.text = self.dataSource[indexPath.item];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:ViewControllerCellTypeTextXib]];
    [collectionView setContentOffset:CGPointMake(0, attributes.frame.origin.y) animated:YES];
}


- (NSMutableArray<NSString*> *)dataSource {
    if(_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithArray: @[@"First, we see the platforms object which contains names of all supported operating systems. It is made only for convenience. We can then use platforms.WINDOWS instead of typing ‘WINDOWS’ each time into our object with handlers we pass to the byOS function.", @"Next, notice the platformsNames object. The keys are the result of calling os.platform(). The values are the keys from the platforms object. We simply map it to a more user-friendly name.", @"In currentPlatform", @"The application is compiled ahead-of-time into native ARM code, not at runtime as in React Native. This gives better performance because there’s no JS bridge in the middle to parse and execute the code. However it also means there’s no over-the-air update option by downloading a new bundle of JS code at runtime.", @"Rather than being a wrapper on top of the iOS/Android-specific native UI components (which is what React Native and Xamarin do), it really draws the UI from scratch on a ‘screen canvas’, through a fast C++ 2D graphics library called Skia (which also serves as the graphics engine for Google Chrome, Chrome OS, Android, Mozilla Firefox and Firefox OS, and many other products). The Skia project started back in 1996 and was acquired by Google in 2005, although it’s released under the BSD license and anyone can use it. This has huge consequences — I talk more about this in the pros and cons sections below."]];
    }
    return _dataSource;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
        layout.estimatedItemSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 40);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerClass:[PPMessageCell class] forCellWithReuseIdentifier:@"PPMessageCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"PPXibCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"PPXibCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    }
    return _collectionView;
}

@end
