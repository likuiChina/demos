//
//  UIView+HPExtension.m
//  HammerParkUnify
//
//  Created by NemoLee on 6/18/16.
//  Copyright © 2016 HammerPark. All rights reserved.
//

#import "UIView+HPExtension.h"
#import <objc/runtime.h>
//#import <BSCategories/BSCategories.h>

@implementation UIView (HPExtension)

static char * loadingViewKey = "com.hp.loadingView";




- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, self.size};
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    self.frame = (CGRect){self.origin, size};
}

- (CGPoint)boundsCenter
{
    return CGPointMake(self.width/2.f, self.height/2.f);
}

- (CGFloat)x
{
    return self.origin.x;
}

- (void)setX:(CGFloat)x
{
    self.origin = CGPointMake(x, self.origin.y);
}

- (CGFloat)y
{
    return self.origin.y;
}

- (void)setY:(CGFloat)y
{
    self.origin = CGPointMake(self.origin.x, y);
}

- (CGFloat)width
{
    return self.size.width;
}

- (void)setWidth:(CGFloat)width
{
    self.size = CGSizeMake(width, self.size.height);
}

- (CGFloat)height
{
    return self.size.height;
}

- (void)setHeight:(CGFloat)height
{
    self.size = CGSizeMake(self.size.width, height);
}

- (CGFloat)maxX
{
    return self.origin.x + self.width;
}

- (CGFloat)maxY
{
    return self.origin.y + self.height;
}

#pragma mark - Shortcuts for the coords
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

#pragma mark - Shortcuts for positions
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


+ (UIView *)separatorLineViewWithColor:(UIColor *)color
{
    UIView * separator = [[UIView alloc] init];
    separator.backgroundColor = color;
    separator.userInteractionEnabled = NO;
    return separator;
}

- (CGRect)bottomSeparatorLineRect
{
    return CGRectMake(0, self.height - 0.5, self.width, 0.5);
}




-(void)setlayerWithCorner:(CGFloat)conerRadius layerWidth:(CGFloat)width layerColor:(UIColor *)color
{
    self.layer.cornerRadius = conerRadius;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.masksToBounds = YES;
}

- (UIImage *)screenshot
{
    CGRect rect = self.frame;
    NSLog(@"%@",NSStringFromCGRect(rect));
    
    //    if ([theView isKindOfClass:[UIScrollView class]]) {
    //        rect.size = ((UIScrollView *)theView).contentSize;
    //    }
    NSLog(@"%@",NSStringFromCGSize(rect.size));
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSLog(@"context%@",context);
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.layer.contents = nil;
    return img;
    //    return [self screenshotWithRect:self.bounds];
}


-(void)addCustomGens:(NSString *)genName inClass:(id)tapClass
{
    self.userInteractionEnabled = YES;
    SEL func = NSSelectorFromString(genName);
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:tapClass action:func];
    //    tapGesture.delegate = tapClass;
    [self addGestureRecognizer:tapGesture];
}

-(void)addLongTapGens:(NSString *)genName inClass:(id)tapClass
{
    SEL func = NSSelectorFromString(genName);
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:tapClass action:func];
    longPressGr.minimumPressDuration = 0.5;
    [self addGestureRecognizer:longPressGr];
}


@end
