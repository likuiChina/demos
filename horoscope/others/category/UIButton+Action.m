//
//  UIButton+Action.m
//  HammerParkUnify
//
//  Created by Hanser on 30/06/2017.
//  Copyright © 2017 HammerPark. All rights reserved.
//

#import "UIButton+Action.h"

@implementation UIButton (Action)

- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

+(UIButton *)initWithFrame:(CGRect)frame andBackGroundColor:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor
{
    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonChat setBackgroundColor:color];
    buttonChat.frame = frame;
    [buttonChat setTitleColor:titleColor forState:UIControlStateNormal];
    [buttonChat setTitle:title forState:UIControlStateNormal];
    
    return buttonChat;
}

+(UIButton *)initWitFrame:(CGRect)frame image:(UIImage *)image targer:(id)tager action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:tager action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)initWitFrame:(CGRect)frame tag:(NSInteger)tag title:(NSString *)title targer:(id)tager action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
//    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:tager action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//网络加载错误
+(UIButton *)initWitFrame:(CGRect)frame targer:(id)tager action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    [button setTitle:@"Network Problems ..." forState:UIControlStateNormal];
    [button setTitleColor: [UIColor colorWithHex:@"999999"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:10];
    button.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithHexRGB:@"f0f0f0"];
    [button addTarget:tager action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)verticalImageAndTitle:(CGFloat)spacing
{
//    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}




@end
