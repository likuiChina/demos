//
//  drawView6.m
//  horoscope
//
//  Created by LK on 2018/3/28.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "drawView6.h"
#import <CoreText/CoreText.h>

@implementation drawView6


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [super drawRect:rect];
    
    //1
    CGContextRef contenx = UIGraphicsGetCurrentContext();
    //2
    CGContextSetTextMatrix(contenx, CGAffineTransformIdentity);
    CGContextTranslateCTM(contenx, 0, self.bounds.size.height);
    CGContextScaleCTM(contenx, 1.0, -1.0);
    //3
    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    
    NSAttributedString *attrString = [[NSAttributedString alloc]initWithString:@"hah a个种类型的中排布拍的李稻葵撒家乐福解答克里斯 好几个地方戽水股份十多个抗旱打飞机看撒谎就会尽快哈打瞌睡hh乐福解答克里斯 好几个地方戽水抗旱打飞机看撒谎就会尽快哈打瞌乐福解答克里斯 好几个地方戽水抗股份就和房管局旱打飞机看撒谎就会尽快哈打瞌乐福解答克里斯 好几个地方戽水抗旱打飞机看撒谎就会尽快哈打瞌乐福好高端刚发的答克里斯 好几个地方戽水更好地发挥g'f'd抗旱打飞机看撒谎就会尽快哈打瞌 lkjfdajfkdsal" ];
//    CTFrameRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrString);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrString);
    
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attrString length]), path, NULL);
    
    
    CTFrameDraw(frame, contenx);
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
    
    
    
    
    
}


@end
