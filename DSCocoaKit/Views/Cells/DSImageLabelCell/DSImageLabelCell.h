//
//  DSImageLabelCell.h
//
//  Created by Dragon Sun on 2017/12/25.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSBaseCell.h"

/**
 包含了一个图片框和一个标识框的Cell
 */
@interface DSImageLabelCell : DSBaseCell

/**
 要显示的图片，单元格内垂直居中
 显示的大小取决于图片的大小，如果为 nil，则忽略图片的显示
 */
@property (nonatomic, strong) UIImage *image;

/**
 要显示的文字，单元格内垂直居中
 */
@property (nonatomic, copy) NSString *text;

/**
 文字的字体，默认为系统字体，大小14.0
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 文字的颜色，默认为grayColor
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 图片距离单元格左边框的间隔，默认为15.0
 当图片为 nil 时，该间隔依然生效
 */
@property (nonatomic, assign) CGFloat imageLeftSpacing;

/**
 文字起始位置与图片右边界的间隔，默认为8.0
 当图片为 nil 时，该间隔失效
 */
@property (nonatomic, assign) CGFloat textLeftSpacing;

@end
