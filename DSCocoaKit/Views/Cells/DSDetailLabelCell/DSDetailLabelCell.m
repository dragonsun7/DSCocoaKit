//
//  DSDetailLabelCell.m
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSDetailLabelCell.h"


@interface DSDetailLabelCell ()

@property (nonatomic, readonly) UILabel *detailLabel;

@end


@implementation DSDetailLabelCell

@synthesize detailLabel = _detailLabel;


#pragma mark - override

- (void)initialize {
    [super initialize];
    
    [self.contentView addSubview:self.detailLabel];
    
    self.detailFont = [UIFont systemFontOfSize:14.0];
    self.detailColor = [UIColor lightGrayColor];
    self.detailRightSpacing = 6.0;
}

- (void)layout {
    [super layout];
    
    // 设置detailLabel的大小与位置(始终保持垂直居中)
    [_detailLabel sizeToFit];
    
    CGFloat spacing = _detailRightSpacing;
    if (self.accessoryType != UITableViewCellAccessoryNone || self.accessoryView) {
        spacing = 0.0;
    }
    
    CGFloat cellWidth = self.contentView.bounds.size.width;
    CGFloat cellHeight = self.contentView.bounds.size.height;
    CGFloat labelWidth = _detailLabel.bounds.size.width;
    CGFloat labelHeight = _detailLabel.bounds.size.height;
    CGFloat labelLeft = cellWidth - labelWidth - spacing;
    CGFloat labelTop = (cellHeight - labelHeight) / 2;
    _detailLabel.frame = CGRectMake(labelLeft, labelTop, labelWidth, labelHeight);
}


#pragma mark - Subview

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
    }
    
    return _detailLabel;
}


#pragma mark - Property

- (void)setDetail:(NSString *)detail {
    _detail = detail;
    _detailLabel.text = detail;
    [self layoutIfNeeded];
}

- (void)setDetailFont:(UIFont *)detailFont {
    _detailFont = detailFont;
    _detailLabel.font = detailFont;
    [self layoutIfNeeded];
}

- (void)setDetailColor:(UIColor *)detailColor {
    _detailColor = detailColor;
    _detailLabel.textColor = detailColor;
}

- (void)setDetailRightSpacing:(CGFloat)detailRightSpacing {
    _detailRightSpacing = detailRightSpacing;
    [self layoutIfNeeded];
}

@end
