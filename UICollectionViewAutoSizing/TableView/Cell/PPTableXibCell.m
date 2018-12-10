//
//  PPTableXibCell.m
//  UICollectionViewAutoSizing
//
//  Created by Popeye Lau on 2018/12/10.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "PPTableXibCell.h"

@implementation PPTableXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
