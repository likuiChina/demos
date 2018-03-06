//
//  googleADmanage.h
//  horoscope
//
//  Created by LK on 2017/12/14.
//  Copyright © 2017年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface googleADmanage : NSObject

singleH(googleADmanage);

-(void)stepUp;

-(void)showAudio:(UIViewController *)control;

-(void)requestScreenAd;
-(void)showScreenAD:(UIViewController *)control;

@end
