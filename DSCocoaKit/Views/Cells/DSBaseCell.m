//
//  DSBaseCell.m
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/27.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSBaseCell.h"


@interface DSBaseCell() {
    CGFloat _defaultLeftSeparatorInset;
}

@end


@implementation DSBaseCell


#pragma mark - override

+ (CGFloat)defaultHeight {
    return 44.0;
}

- (void)initialize {
    _defaultLeftSeparatorInset = self.separatorInset.left;
}

- (void)layout {
    // do nothing
}

- (CGFloat)separatorAlignContentLeftInset {
    return _defaultLeftSeparatorInset;
}


#pragma mark - LifeCycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initialize];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 布局
    [self layout];
    
    // 分割线样式
    CGFloat insetLeft = _defaultLeftSeparatorInset;
    if (DSCellSeparatorInsetStyleZero == _separatorInsetStyle) insetLeft = 0.0;
    if (DSCellSeparatorInsetStyleAlignContent == _separatorInsetStyle)
        insetLeft = [self separatorAlignContentLeftInset];
    self.separatorInset = UIEdgeInsetsMake(0.0, insetLeft, 0.0, 0.0);
}


#pragma mark - Property

- (void)setSeparatorInsetStyle:(DSCellSeparatorInsetStyle)separatorInsetStyle {
    _separatorInsetStyle = separatorInsetStyle;
    [self layoutIfNeeded];
}

@end
