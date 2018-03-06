//
//  AdManager.h
//  horoscope
//
//  Created by LK on 2017/12/1.
//  Copyright © 2017年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdManager : NSObject

singleH(AdManager);

-(void)stepUp;

-(void)playVideo:(UIViewController *)viewControl;
-(void)showOfferWall:(UIViewController *)viewControl;
-(void)showNewVideo:(UIViewController *)viewControl;

@end
