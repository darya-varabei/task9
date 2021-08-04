//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SPStrokeColorTableViewCell.h"

@interface SPStrokeColorTableViewCell()
@property (strong, nonatomic)UILabel *lable;

@end

@implementation SPStrokeColorTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupView {
    self.lable = [[UILabel alloc] init];
    
    self.lable.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    
    self.lable.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.lable];
    [NSLayoutConstraint activateConstraints:@[
    [self.lable.topAnchor constraintEqualToAnchor:self.topAnchor constant:10],
    [self.lable.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
    [self.lable.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:10],
    [self.lable.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10],
    [self.lable.heightAnchor constraintEqualToConstant:32]
    ]];
}

@end
