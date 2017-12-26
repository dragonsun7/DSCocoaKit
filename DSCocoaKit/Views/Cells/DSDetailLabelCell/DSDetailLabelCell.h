//
//  DSDetailLabelCell.h
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSImageLabelCell.h"

/**
 相对于 DSImageLabelCell，在单元格右边添加了一个明细标识框
 */
@interface DSDetailLabelCell : DSImageLabelCell

/**
 要显示的明细文字，单元格内垂直居中
 */
@property (nonatomic, copy) NSString *detail;

/**
 明细文字的字体，默认为系统字体，大小14.0
 */
@property (nonatomic, strong) UIFont *detailFont;

/**
 明细文字的颜色，默认为 lightGrayColor
 */
@property (nonatomic, strong) UIColor *detailColor;

/**
 明细文字距离单元格右边框的间隔，默认为6.0
 如果单元格有附件视图，则为距离附件视图起始位置的间隔
 */
@property (nonatomic, assign) CGFloat detailRightSpacing;

@end
