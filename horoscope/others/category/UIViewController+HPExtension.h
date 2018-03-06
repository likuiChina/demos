//
//  UIViewController+HPExtension.h
//  HammerParkUnify
//
//  Created by NemoLee on 7/15/16.
//  Copyright © 2016 HammerPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HPExtension)

@property (copy, nonatomic) NSString *navBarBgAlpha;

- (void)willPopback;
- (BOOL)shouldPopback;
- (void)addSubview:(UIView *)aView;
- (void)addDismissButtonForNavigationItem;
- (void)dismissNavigationViewController;

/**
 白色返回按钮
 */
-(void)createWhiteBackBtn;
/**
 *  快速创建左返回按钮
 */
- (void)createBackBtn;
/**
 *  快速创建左Dismiss按钮
 */
/**
 创建返回的直接用的disBtn
 */
-(void)createUpDisMissBtn;

/**
 创建返回的直接用的popBtn
 */
-(void)createUpPopBtn;

- (void)createLeftDismissBtn;
/**
 *  快速创建导航左按钮
 *
 *  @param btnTitle     标题
 *  @param doneFunction 点击事件名称
 *  @param imageName    图片名称
 */

/**
 创建右边多个按钮

 @param arrayTitle 名字数组
 @param arrayFunction 功能数组
 @param arrayImgs 图片数组
 */
- (void)createRightBtns:(NSArray *)arrayTitle withDone:(NSArray *)arrayFunction withImageName:(NSArray *)arrayImgs;

- (UIButton *)createLeftBtn:(NSString *)btnTitle withDone:(NSString *)doneFunction withImageName:(NSString *)imageName;
/**
 *  快速创建导航右按钮
 *
 *  @param btnTitle     标题
 *  @param doneFunction 点击事件名称
 *  @param imageName    图片名称
 */
- (UIButton *)createRightBtn:(NSString *)btnTitle withDone:(NSString *)doneFunction withImageName:(NSString*)imageName;

/**
 创建右边多个button
 
 @param arrayTitle 标题array
 @param arrayFunction 点击事件array
 @param arrayImgs 图片名字array
 */
//- (void)createRightBtns:(NSArray *)arrayTitle withDone:(NSArray *)arrayFunction withImageName:(NSArray *)arrayImgs;
/**
 *  返回上级
 */
- (void)popSelf;

- (void)popRoot;

- (void)dismiss;

/**
 客服聊天的功能
 */
-(void)createRightChatBtn;

-(void)setNavBarClear;

-(void)setNavBarWhite;

-(void)setNavBarRed;

- (UIViewController *)getCurrentViewControl;

-(void)setBtnTag:(NSInteger)btnTag withName:(NSString *)name;

@end
