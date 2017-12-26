//
//  DSImageLabelCell.h
//
//  Created by Dragon Sun on 2017/12/25.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "DSCell.h"

/**
 包含了一个图片框和一个标识框的Cell
 */
@interface DSImageLabelCell : UITableViewCell

+ (CGFloat)defaultHeight;

@property (nonatomic, strong) UIImage *image;                                   // 图片
@property (nonatomic, copy) NSString *text;                                     // 文字
@property (nonatomic, strong) UIFont *textFont;                                 // 文字字体(默认：系统14)
@property (nonatomic, strong) UIColor *textColor;                               // 文字颜色(默认：grayColor)
@property (nonatomic, assign) CGFloat imageLeftSpacing;                         // 图片的左间隔(默认：15.0)
@property (nonatomic, assign) CGFloat textLeftSpacing;                          // 文字的左间隔(默认：8.0)
@property (nonatomic, assign) DSCellSeparatorInsetStyle separatorInsetStyle;    // 分割线样式(默认：DSCellSeparatorInsetStyleDefault)

@end
