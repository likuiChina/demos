//
//  LKBigButton.m
//  horoscope
//
//  Created by LK on 2018/3/30.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "LKBigButton.h"

@implementation LKBigButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(200.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(200.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    
//    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    return CGRectContainsPoint(bounds, point);
}


@end
