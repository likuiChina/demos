//
//  googleADmanage.m
//  horoscope
//
//  Created by LK on 2017/12/14.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "googleADmanage.h"
@import GoogleMobileAds;
@import UIKit;

#if 0
//example
#define kExampleSoftKey         @"ca-app-pub-3940256099942544~1458002511"
#define kExampleVedioKey        @"ca-app-pub-3940256099942544/1712485313"

#else
//自己的
#define kExampleSoftKey          @"ca-app-pub-5455680498843708~9328394641"
#define kExampleVedioKey         @"ca-app-pub-5455680498843708/6526971482"

#endif

@interface googleADmanage()<GADRewardBasedVideoAdDelegate,GADInterstitialDelegate>

@property(nonatomic, strong) GADInterstitial*interstitial;

@end

@implementation googleADmanage

singleM(googleADmanage);


-(void)stepUp
{
    [GADMobileAds configureWithApplicationID:kExampleSoftKey];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [GADRewardBasedVideoAd sharedInstance].delegate = self;
        [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID:kExampleVedioKey];
    });
    
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didRewardUserWithReward:(GADAdReward *)reward {
    NSString *rewardMessage = [NSString stringWithFormat:@"Reward received with currency %@ , amount %lf",
     reward.type, [reward.amount doubleValue]];
    NSLog(@"-----:::rewardMessage->>%@", rewardMessage);
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"-------oooReward based video ad is received.");
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"-------,,,Opened reward based video ad.");
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"-------///Reward based video ad started playing.");
    
//
    
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"------[][][]]Reward based video ad is closed.");
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID:kExampleVedioKey];
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"-------...Reward based video ad will leave application.");
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didFailToLoadWithError:(NSError *)error {
    NSLog(@"-------|||Reward based video ad failed to load.");
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID:kExampleVedioKey];
}

#pragma mark-----点击显示视屏-----
-(void)showAudio:(UIViewController *)control
{
    if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
        [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:control];
        NSLog(@"<<<-----------isok");
    }
    else
    {
        [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID:kExampleVedioKey];
        
        NSLog(@"<<<-----------bu ok");
    }
}


/***兼执行广告，插屏广告*/

-(void)requestScreenAd
{
    ///插屏广告
    
    self.interstitial = [self createAndLoadInterstitial];
    
    
    
}

- (GADInterstitial *)createAndLoadInterstitial
{
    GADInterstitial *interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    self.interstitial = [self createAndLoadInterstitial];
}

-(void)showScreenAD:(UIViewController *)control
{
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:control];
    } else {
        NSLog(@"Ad wasn't ready");
        GADRequest *request = [GADRequest request];
        [self.interstitial loadRequest:request];
    }
}

/// Tells the delegate an ad request succeeded.
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    NSLog(@"interstitialDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)interstitial:(GADInterstitial *)ad
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that an interstitial will be presented.
- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {
    NSLog(@"interstitialWillPresentScreen");
}

/// Tells the delegate the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad {
    NSLog(@"interstitialWillDismissScreen");
}

///// Tells the delegate the interstitial had been animated off the screen.
//- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
//    NSLog(@"interstitialDidDismissScreen");
//}

/// Tells the delegate that a user click will open another app
/// (such as the App Store), backgrounding the current app.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {
    NSLog(@"interstitialWillLeaveApplication");
}

@end
