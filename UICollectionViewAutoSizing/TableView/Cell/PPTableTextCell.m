//
//  PPTableTextCell.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/12/10.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPTableTextCell.h"

@interface PPTableTextCell()
@end

@implementation PPTableTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void) setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.titleLabel];
    [[self.titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES]; //TOP
    [[self.titleLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8] setActive:YES]; //LEFT
    [[self.titleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8] setActive:YES]; //RIGHT
    [[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES]; //BOTTOM
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"text";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 0;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titleLabel;
}

@end
