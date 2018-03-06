//
//  UIColor+HexColor.h
//  OKDaiWang
//
//  Created by 如风丶也如剑 on 16/11/25.
//  Copyright © 2016年 如风丶也如剑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
+(UIColor *)colorWithHex:(NSString *)hexColor;
+(UIColor *)colorWithHex:(NSString *)hexColor alpha:(float)alpha;

+ (UIColor *)colorWithHexRGB:(NSString *)hex;
+ (UIColor *)colorWithHexRGB:(NSString *)hex alpha:(CGFloat)alpha;
+ (UIImage *)colorImageWithColor:(UIColor *)color ;
UIColor * rgbweb(NSString *rgbval);

@end
