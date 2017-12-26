//
//  DSImageLabelCell.m
//
//  Created by Dragon Sun on 2017/12/25.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSImageLabelCell.h"


@interface DSImageLabelCell () {
    CGFloat _defaultLeftSeparatorInset;
}

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *label;

@end


@implementation DSImageLabelCell

@synthesize imageView = _imageView;
@synthesize label = _label;


#pragma mark - API

+ (CGFloat)defaultHeight {
    return 44.0f;
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
    
    CGFloat cellHeight = self.contentView.bounds.size.height;
    
    // 设置图片框的大小与位置(始终保持垂直居中)
    CGFloat imageWidth = _image.size.width;
    CGFloat imageHeight = _image.size.height;
    _imageView.frame = CGRectMake(_imageLeftSpacing, (cellHeight - imageHeight) / 2, imageWidth, imageHeight);
    
    // 设置标识框的大小与位置(始终保持垂直居中)
    [_label sizeToFit];
    CGFloat labelLeft = _imageLeftSpacing + imageWidth + _textLeftSpacing;
    CGFloat labelWidth = _label.bounds.size.width;
    CGFloat labelHeight = _label.bounds.size.height;
    _label.frame = CGRectMake(labelLeft, (cellHeight - labelHeight) / 2, labelWidth, labelHeight);

    // 分割线样式
    CGFloat insetLeft = _defaultLeftSeparatorInset;
    if (DSCellSeparatorInsetStyleZero == _separatorInsetStyle) insetLeft = 0.0;
    if (DSCellSeparatorInsetStyleAlignContent == _separatorInsetStyle) insetLeft = labelLeft;
    self.separatorInset = UIEdgeInsetsMake(0.0, insetLeft, 0.0, 0.0);
}


#pragma mark - Subview

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
    }
    
    return _label;
}


#pragma mark - Property

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
    [self layoutIfNeeded];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.label.font = textFont;
    [self layoutIfNeeded];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.label.textColor = textColor;
}

- (void)setImageLeftSpacing:(CGFloat)imageLeftSpacing {
    _imageLeftSpacing = imageLeftSpacing;
    [self layoutIfNeeded];
}

- (void)setTextLeftSpacing:(CGFloat)textLeftSpacing {
    _textLeftSpacing = textLeftSpacing;
    [self layoutIfNeeded];
}

- (void)setSeparatorInsetStyle:(DSCellSeparatorInsetStyle)separatorStyle {
    _separatorInsetStyle = separatorStyle;
    [self layoutIfNeeded];
}


#pragma mark - Private

- (void)initialize {
    _defaultLeftSeparatorInset = self.separatorInset.left;

    self.textFont = [UIFont systemFontOfSize:14.0f];
    self.textColor = [UIColor grayColor];
    self.imageLeftSpacing = 15.0;
    self.textLeftSpacing = 8.0;
    self.separatorInsetStyle = DSCellSeparatorInsetStyleDefault;
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
}

@end
