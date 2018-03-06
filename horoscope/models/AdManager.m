//
//  AdManager.m
//  horoscope
//
//  Created by LK on 2017/12/1.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "AdManager.h"
#import <Tapjoy/Tapjoy.h>
#import <AdSupport/AdSupport.h>

@interface AdManager ()<TJPlacementDelegate>


@end

@implementation AdManager

singleM(AdManager);

-(void)stepUp
{
    [self p_setupSDKs];
    [self p_setupNotifications];
    
    [self showIdfa];
}

-(void)showIdfa
{
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"adid-->>>%@",adid);
}

- (void)p_setupSDKs {
    [self p_setupNotifications];
//    [Tapjoy connect:TapJoy_key];
    [Tapjoy connect:TapJoy_key options:@{ TJC_OPTION_ENABLE_LOGGING : @(YES) }];
    
    [Tapjoy actionComplete:TapJoy_key];
    [Tapjoy setDebugEnabled:YES];
    //    [GADMobileAds configureWithApplicationID:self.configureInfo[@"GADMobileAds"]];//谷歌去连接id
}

- (void)p_setupNotifications {
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    [defaultCenter addObserver:self
                      selector:@selector(tjcConnectSuccess:)
                          name:TJC_CONNECT_SUCCESS
                        object:nil];
    
    [defaultCenter addObserver:self
                      selector:@selector(tjcConnectFail:)
                          name:TJC_CONNECT_FAILED
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(p_respondsToAVNotification:)
                          name:TJC_GET_CURRENCY_RESPONSE_NOTIFICATION
                        object:nil];
    
    [defaultCenter addObserver:self selector:@selector(p_respondsToAVNotification:) name:TJC_AWARD_CURRENCY_RESPONSE_NOTIFICATION object:nil];
    
    [defaultCenter addObserver:self selector:@selector(showEarnedCurrencyAlert:) name:TJC_CURRENCY_EARNED_NOTIFICATION object:nil];
    
    
}


- (void)showEarnedCurrencyAlert:(NSNotification*)notifyObj
{
    NSNumber *currencyEarned = notifyObj.object;
    NSInteger earnedNum = [currencyEarned integerValue];
    
    NSLog(@"Currency earned: %ld", (long)earnedNum);
    
    // 弹出一个用户界面警告提醒用户他们刚刚成功赚取虚拟币
    // 这是一个默认警告，您也可以选择自定义警告
    [Tapjoy showDefaultEarnedCurrencyAlert];
    
    if (earnedNum > 0 && earnedNum <= 1000)
    {
        NSInteger seeTimes = [mUserDefault integerForKey:mTapjoySeeAdTimes];
        if (seeTimes >= 1 && earnedNum == TapJoyCridet_5)
        {
            [mUserDefault setInteger:--seeTimes forKey:mTapjoySeeAdTimes];
        }
        else
        {
            NSLog(@"jjjaaa");
        }
        
    }
}

- (void)p_setupConfig {
    
}
#pragma mark------tapjoy接受消息--------连接成功、失败等
- (void)p_respondsToAVNotification:(NSNotification *)noti
{
    if ([noti.name isEqualToString:TJC_CONNECT_FAILED])
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [Tapjoy connect:TapJoy_key];
        });
        
    }
    else if ([noti.name isEqualToString:TJC_CONNECT_SUCCESS]) {
        
        
        
    }
    else if ([noti.name isEqualToString:TJC_GET_CURRENCY_RESPONSE_NOTIFICATION])
    {
        
    }
    else if ([noti.name isEqualToString:TJC_AWARD_CURRENCY_RESPONSE_NOTIFICATION])
    {
        NSInteger tapPoints = [(NSNumber*)noti.object integerValue];
        NSLog(@"TJC_AWARD_CURRENCY_RESPONSE_NOTIFICATION-->>%@",@(tapPoints));
    }
}

-(void)tjcConnectSuccess:(NSNotification*)notifyObj
{
    NSLog(@"Tapjoy connect Succeeded");
    TJPlacement *p = [TJPlacement placementWithName:TapJoy_video delegate:self ];
    [p requestContent];
    
    TJPlacement *p2 = [TJPlacement placementWithName:TapJoy_Offerwall delegate:self ];
    [p2 requestContent];
    
    TJPlacement *p3 = [TJPlacement placementWithName:TapJoy_NewVideo delegate:self];
    [p3 requestContent];
    
    
}

-(void)tjcConnectFail:(NSNotification*)notifyObj
{
    NSLog(@"Tapjoy connect Failed");
    
}
#pragma mark - TJPlacementDelegate

- (void)contentIsReady:(TJPlacement*)placement {
    
    NSLog(@"contentIsReady-->>");
    
}

-(void)playVideo:(UIViewController *)viewControl
{
    TJPlacement *placement = [TJPlacement placementWithName:TapJoy_video delegate:self];
    if (!placement.isContentReady)//p.isContentAvailable
    {
        NSLog(@"TapJoy_video. not  ContentReady ");
        [placement requestContent];
        return ;
    }
    [placement showContentWithViewController:viewControl];;
}

-(void)showNewVideo:(UIViewController *)viewControl
{
    TJPlacement *placement = [TJPlacement placementWithName:TapJoy_NewVideo delegate:self];
    if (!placement.isContentReady)//p.isContentAvailable
    {
        NSLog(@"TapJoy_NewVideo. not  ContentReady ");
        [placement requestContent];
        return ;
    }
    [placement showContentWithViewController:viewControl];;
}

-(void)showOfferWall:(UIViewController *)viewControl
{
    TJPlacement *placement = [TJPlacement placementWithName:TapJoy_Offerwall delegate:self];
    if (!placement.isContentReady)//p.isContentAvailable
    {
        NSLog(@"placement. not  ContentReady ");
        [placement requestContent];
        return ;
    }
    [placement showContentWithViewController:viewControl];;
}



- (void)requestDidFail:(TJPlacement*)placement error:(NSError*)error {
    
    NSLog(@"requestDidFail-->>%@",placement);
    if ([Tapjoy isConnected]) {
        
    } else {
        // reload when connected
        
    }
}



- (void)requestDidSucceed:(TJPlacement*)placement
{
    NSLog(@"requestDidSucceed");
    
}

- (void)contentDidAppear:(TJPlacement*)placement
{
    
    
}

- (void)contentDidDisappear:(TJPlacement*)placement {
    
    
}

@end
