//
//  DSBaseCell.h
//  DSCocoaKitDemo
//
//  Created by Dragon Sun on 2017/12/27.
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


@interface DSBaseCell : UITableViewCell

/**
 单元格分割线的样式，默认为 DSCellSeparatorInsetStyleDefault
 详情请参看 DSCellSeparatorInsetStyle 枚举的说明
 */
@property (nonatomic, assign) DSCellSeparatorInsetStyle separatorInsetStyle;


/**************************************************************/
/********************** 下面的方法需要被重载 **********************/
/**************************************************************/

/**
 返回默认的单元格高度(44.0)，如果需要改变，请在子类重载

 @return 默认的单元格高度
 */
+ (CGFloat)defaultHeight;

/**
 该方法将被init方法调用，供子类重载
 需要在该方法中完成添加子视图、设置默认值等初始化工作
 */
- (void)initialize;

/**
 该方法将被layoutSubviews方法调用，供子类重载，需要在该方法中实现对子视图的布局
 该方法将在separatorAlignContentLeftInset方法之前被调用
 */
- (void)layout;

/**
 该方法将被layoutSubviews方法调用，供子类重载
 需要返回当separatorInsetStyle = DSCellSeparatorInsetStyleAlignContent时，分割线的左位置
 如果未实现该方法，将会返回分割线默认位置
 该方法将在layout方法之后被调用
 @return 当separatorInsetStyle = DSCellSeparatorInsetStyleAlignContent时，分割线的左位置
 */
- (CGFloat)separatorAlignContentLeftInset;

@end
