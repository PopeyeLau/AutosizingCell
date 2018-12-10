//
//  PPMessageCell.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/11/28.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPMessageCell.h"

@interface PPMessageCell ()
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@end
@implementation PPMessageCell

- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void) setup {
    self.backgroundColor = UIColor.whiteColor;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.textLabel];

    [[self.contentView.widthAnchor constraintEqualToConstant:self.frame.size.width] setActive:YES];
    [[self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES]; //TOP
    [[self.contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES]; //LEFT
    [[self.contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES]; //RIGHT
    [[self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES]; //BOTTOM

    [[self.avatarImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES]; //TOP
    [[self.avatarImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8] setActive:YES]; //LEFT
    [[self.avatarImageView.heightAnchor constraintEqualToConstant:50] setActive:YES];
    [[self.avatarImageView.widthAnchor constraintEqualToConstant:50] setActive:YES];

    [[self.nameLabel.leftAnchor constraintEqualToAnchor:self.avatarImageView.rightAnchor constant:8] setActive:YES];
    [[self.nameLabel.bottomAnchor constraintEqualToAnchor:self.avatarImageView.centerYAnchor] setActive:YES];

    [[self.dateLabel.leftAnchor constraintEqualToAnchor:self.nameLabel.leftAnchor] setActive:YES];
    [[self.dateLabel.topAnchor constraintEqualToAnchor:self.avatarImageView.centerYAnchor] setActive:YES];

    [[self.textLabel.topAnchor constraintEqualToAnchor:self.avatarImageView.bottomAnchor constant:8] setActive:YES];
    [[self.textLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8] setActive:YES];
    [[self.textLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-8] setActive:YES]; //RIGHT
    [[self.textLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES]; //BOTTOM
}


- (void)prepareForReuse {
    [super prepareForReuse];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@", NSStringFromCGRect(self.contentView.frame));
}


- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (UIImageView *)avatarImageView {
    if(_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.layer.cornerRadius = 25;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _avatarImageView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel {
    if(_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"Name";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _nameLabel;
}

- (UILabel *)dateLabel {
    if(_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.text = @"2018-11-28 22:00";
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _dateLabel;
}

- (UILabel *)textLabel {
    if(_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.numberOfLines = 0;
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textLabel;
}
@end
