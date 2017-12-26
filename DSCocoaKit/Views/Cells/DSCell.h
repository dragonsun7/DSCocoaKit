//
//  DSCell.h
//
//  Created by Dragon Sun on 2017/12/26.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 单元格分割线样式
 
 - DSCellSeparatorInsetStyleDefault: 默认样式(与普通的Cell一致)
 - DSCellSeparatorInsetStyleZero: 分割线从屏幕最左边开始绘制
 - DSCellSeparatorInsetStyleAlignContent: 分隔线从内容起始位置开始绘制
 */
typedef NS_ENUM(NSInteger, DSCellSeparatorInsetStyle) {
    DSCellSeparatorInsetStyleDefault,
    DSCellSeparatorInsetStyleZero,
    DSCellSeparatorInsetStyleAlignContent
};

