//
//  UIView+HPExtension.h
//  HammerParkUnify
//
//  Created by NemoLee on 6/18/16.
//  Copyright © 2016 HammerPark. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HPLoadingView.h"

typedef NS_ENUM(NSUInteger, HPViewEdge) {
    HPViewEdgeTop,
    HPViewEdgeLeft,
    HPViewEdgeRight,
    HPViewEdgeBottom
};

@interface UIView (HPExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign, readonly) CGPoint boundsCenter;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign, readonly) CGFloat maxX;

@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign, readonly) CGFloat maxY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic, assign, readonly) CGRect bottomSeparatorLineRect;


+ (UIView *)separatorLineViewWithColor:(UIColor *)color;


/**
 添加圆角

 @param conerRadius 圆角度
 @param width 宽度
 @param color 颜色
 */
-(void)setlayerWithCorner:(CGFloat)conerRadius layerWidth:(CGFloat)width layerColor:(UIColor *)color;

- (UIImage *)screenshot;

/**
 添加手势
 
 @param genName 手势名字
 */
-(void)addCustomGens:(NSString *)genName inClass:(id)tapClass;

/**
 长按手势
 
 @param genName 手势名称
 @param tapClass 在哪个class中按
 */
-(void)addLongTapGens:(NSString *)genName inClass:(id)tapClass;

@end
