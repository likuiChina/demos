//
//  testTools.m
//  horoscope
//
//  Created by LK on 2018/1/30.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "testTools.h"

@implementation testTools

+(NSString *)getUUID
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    
    NSLog(@" remainSecond %@ ",result);
    
    return result;
}

@end
