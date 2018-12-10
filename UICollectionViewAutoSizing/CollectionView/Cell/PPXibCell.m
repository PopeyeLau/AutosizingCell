//
//  PPXibCell.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/11/28.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPXibCell.h"

@interface PPXibCell ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation PPXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
    [[self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES]; //TOP
    [[self.contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES]; //LEFT
    [[self.contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES]; //RIGHT
    [[self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES]; //BOTTOM

}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@", NSStringFromCGRect(self.contentView.frame));
}
@end
