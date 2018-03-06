//
//  UIButton+Action.h
//  HammerParkUnify
//
//  Created by Hanser on 30/06/2017.
//  Copyright © 2017 HammerPark. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Action)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

/**
 创建button

 @param frame 大小
 @param color 背景色
 @param title
 @return 返回button
 */
+(UIButton *)initWithFrame:(CGRect)frame andBackGroundColor:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor;

+(UIButton *)initWitFrame:(CGRect)frame tag:(NSInteger)tag title:(NSString *)title targer:(id)tager action:(SEL)action;

+(UIButton *)initWitFrame:(CGRect)frame image:(UIImage *)image targer:(id)tager action:(SEL)action;

//网络加载错误
+(UIButton *)initWitFrame:(CGRect)frame targer:(id)tager action:(SEL)action;

/**
 uibutton上下排序

 @param spacing 距离宽度
 */
- (void)verticalImageAndTitle:(CGFloat)spacing;


@end
