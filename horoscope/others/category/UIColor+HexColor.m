//
//  UIColor+HexColor.m
//  OKDaiWang
//
//  Created by 如风丶也如剑 on 16/11/25.
//  Copyright © 2016年 如风丶也如剑. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+(UIColor *)colorWithHex:(NSString *)hexColor{
    return [self colorWithHex:hexColor alpha:1.0f];
}
+(UIColor *)colorWithHex:(NSString *)hexColor alpha:(float)alpha{
    //删除空格
    NSString *colorStr = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([colorStr length] < 6||[colorStr length]>7)
    {
        return [UIColor clearColor];
    }
    //
    if ([colorStr hasPrefix:@"#"])
    {
        colorStr = [colorStr substringFromIndex:1];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //red
    NSString *redString = [colorStr substringWithRange:range];
    //green
    range.location = 2;
    NSString *greenString = [colorStr substringWithRange:range];
    //blue
    range.location = 4;
    NSString *blueString= [colorStr substringWithRange:range];
    
    // Scan values
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    return [UIColor colorWithRed:((float)red/ 255.0f) green:((float)green/ 255.0f) blue:((float)blue/ 255.0f) alpha:alpha];
}

+ (UIColor *)colorWithHexRGB:(NSString *)hex alpha:(CGFloat)alpha{
    if(hex.length == 0) return [UIColor redColor];
    if([[hex substringToIndex:1] isEqualToString:@"#"]){
        hex = [hex substringFromIndex:1];
    }
    if(hex.length != 6) return [UIColor redColor];
    int i = 0;
    NSString *rstr = [hex substringWithRange:NSMakeRange(i, 2)]; i+=2;
    NSString *gstr = [hex substringWithRange:NSMakeRange(i, 2)]; i+=2;
    NSString *bstr = [hex substringWithRange:NSMakeRange(i, 2)]; i+=2;
    
    
    NSScanner *scanner;
    
    unsigned int red;
    scanner = [NSScanner scannerWithString:rstr];
    if(![scanner scanHexInt:&red]){
        return [UIColor redColor];
    }
    
    unsigned int green;
    scanner = [NSScanner scannerWithString:gstr];
    if(![scanner scanHexInt:&green]){
        return [UIColor redColor];
    }
    
    unsigned int blue;
    scanner = [NSScanner scannerWithString:bstr];
    if(![scanner scanHexInt:&blue]){
        return [UIColor redColor];
    }
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}


+ (UIColor *)colorWithHexRGB:(NSString *)hex
{
    return [self colorWithHexRGB:hex alpha:1];
}

UIColor * rgbweb(NSString *rgbval)
{
    return [UIColor colorWithHexRGB:rgbval alpha:1];
}

+ (UIImage *)colorImageWithColor:(UIColor *)color {
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
