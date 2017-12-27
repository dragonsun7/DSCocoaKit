//
//  DSImageLabelCell.m
//
//  Created by Dragon Sun on 2017/12/25.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSImageLabelCell.h"


@interface DSImageLabelCell ()

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *textLabel;

@end


@implementation DSImageLabelCell

@synthesize imageView = _imageView;
@synthesize textLabel = _textLabel;


#pragma mark - override

- (void)initialize {
    [super initialize];
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.textLabel];
    
    self.textFont = [UIFont systemFontOfSize:14.0];
    self.textColor = [UIColor grayColor];
    self.imageLeftSpacing = 15.0;
    self.textLeftSpacing = 8.0;
}

- (void)layout {
    [super layout];
    
    CGFloat cellHeight = self.contentView.bounds.size.height;
    
    // 设置图片框的大小与位置(始终保持垂直居中)
    CGFloat imageWidth = _image.size.width;
    CGFloat imageHeight = _image.size.height;
    _imageView.frame = CGRectMake(_imageLeftSpacing, (cellHeight - imageHeight) / 2, imageWidth, imageHeight);
    
    // 设置标识框的大小与位置(始终保持垂直居中)
    [_textLabel sizeToFit];
    CGFloat labelLeft = _imageLeftSpacing + imageWidth + (_image ? _textLeftSpacing : 0.0);
    CGFloat labelWidth = _textLabel.bounds.size.width;
    CGFloat labelHeight = _textLabel.bounds.size.height;
    _textLabel.frame = CGRectMake(labelLeft, (cellHeight - labelHeight) / 2, labelWidth, labelHeight);
}

- (CGFloat)separatorAlignContentLeftInset {
    return _textLabel.frame.origin.x;
}


#pragma mark - Subview

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    
    return _imageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
    }
    
    return _textLabel;
}


#pragma mark - Property

- (void)setImage:(UIImage *)image {
    _image = image;
    _imageView.image = image;
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text {
    _text = text;
    _textLabel.text = text;
    [self layoutIfNeeded];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    _textLabel.font = textFont;
    [self layoutIfNeeded];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textLabel.textColor = textColor;
}

- (void)setImageLeftSpacing:(CGFloat)imageLeftSpacing {
    _imageLeftSpacing = imageLeftSpacing;
    [self layoutIfNeeded];
}

- (void)setTextLeftSpacing:(CGFloat)textLeftSpacing {
    _textLeftSpacing = textLeftSpacing;
    [self layoutIfNeeded];
}

@end
